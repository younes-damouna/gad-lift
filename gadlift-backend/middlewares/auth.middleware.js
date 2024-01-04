const jwt =require("jsonwebtoken")
const User=require("../models/user.model")

const AuthMiddleware= async (req,res)=>{
    const token =req.headers["authorization"]?.split(" ")[1]
    if(!token){
        res.status(403).send("Forbidden")
    }else{
        const decoded=jwt.verify(token,process.env.JWT_SECRET)
        const user= await User.findOne({email:decoded.email}).select("-password")
        req.user=usernext()
    }
}

module.exports={
    AuthMiddleware
}