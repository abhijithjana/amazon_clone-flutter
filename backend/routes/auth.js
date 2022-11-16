const express=require('express');
const User = require('../model/usermodel');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const auth = require('../middlewhere/userauth');
const authrouter=express.Router();


// var hash = bcrypt.hashSync('bacon', 8);
// console.log(hash);
// var password=bcrypt.compareSync("bacon", hash)
// console.log(password);
authrouter.post("/user/signup",async (req,res)=>{
   try {
    const {name , email , password}=req.body;
    const useralreadyexist=await User.findOne({email:email})

    if(useralreadyexist){
        return res.status(400).json({message:`User already exit with email ${email}`});
    }


    let encryptpassword=await bcrypt.hashSync(password,8);

    let user= new User({
        email,
        name,
        password:encryptpassword
    }) 

    user=await user.save();
    res.json({user:user});

   } catch (error) {
       res.status(500).json({error:error.message});
   }
});


authrouter.post("/user/signin",async (req,res)=>{
try {
    const {email , password}=req.body;
    const useralreadyexist=await User.findOne({email:email});
    if(!useralreadyexist){
     
        return res.status(400).json({message:`User not exit with email ${email}`});  
    }

    const ismatch=await bcrypt.compare(password,useralreadyexist.password);
    if(!ismatch) {
        
        return res.status(400).json({message:`Password incorrect`});
    }
    

    const  token = jwt.sign({id:useralreadyexist.id}, 'screeatco+de@#$%%&**##');
    res.status(200).json({token,...useralreadyexist._doc});
} catch (error) {
    res.status(500).json({error:error.message});
}

}
);


authrouter.post('/tokenverify',async(req,res)=>{
    try {
        const token=req.header("auth_token");
        if(!token) return res.json(false);
        const verified= jwt.verify(token,'screeatco+de@#$%%&**##');
        if(!verified) return res.json(false);
        const user=await User.findById(verified.id);
        if(!user) return res.json(false);
        return res.json(true);
    } catch (error) {
        res.status(500).json({error:error.message});
    }
});

authrouter.get('/',auth,async (req,res)=>{
    const user= await User.findById(req.user);
  
    res.json({...user._doc,token:req.token});
});

module.exports=authrouter;