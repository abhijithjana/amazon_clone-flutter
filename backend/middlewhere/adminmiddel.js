const user=require('../model/usermodel');
const jwt=require('jsonwebtoken');
let User = require('../model/usermodel');

const adminmiddle=async(req,res,next)=>{

try {
    const token =req.header('auth_token');
    if(!token) return res.status(401).json({msg:"unavailable to verify you without token"});
    const verify=jwt.verify(token,'screeatco+de@#$%%&**##');
    if(!verify) return res.status(401).json({msg:"invalid token"});
    
     const user=await User.findById(verify.id);
     
  
    if(user.type=='user' || user.type=='seller') return res.status(401).json({msg:"unautherised user"});
  
    req.user=verify.id;
   req.token=token;
    
    next();
    
} catch (e) {
    res.status(501).json({error:e.message});
}
}

module.exports=adminmiddle;