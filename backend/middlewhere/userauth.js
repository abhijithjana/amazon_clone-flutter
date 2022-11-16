const jwt=require("jsonwebtoken")
const auth=async(req,res,next)=>{
  try {
    const token=req.header("auth_token");
    if(!token) return res.status(401).json({msg:"unavailable to verify token without providing token"});
    const verified= jwt.verify(token,'screeatco+de@#$%%&**##');
    if(!verified) return res.status(401).json({msg:"unverified token"});
    req.user=verified.id;
    req.token=token;
    next();
  } catch (error) {
    res.status(501).json({error:error.message});
  }
}

module.exports=auth;