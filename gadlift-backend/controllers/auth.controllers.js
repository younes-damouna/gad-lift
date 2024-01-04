const User = require("../models/user.model")
const jwt = require("jsonwebtoken")
const bcrypt = require("bcrypt")

const login = async (req, res) => {
    const { email, password } = req.body
    const user = await User.findOne({ email })
    if (!user) res.status(400).send({ message: "Invalid email/password" })

    const isValidPassword = await bcrypt.compare(password, user.password)
    if (!isValidPassword)
        res.status(400).send({ message: "Invalid email/password" })
    const { password: hashedPassword, _id, ...userDetails } = user.toJSON()
    const token = jwt.sign({
        ...userDetails,
    }, process.env.JWT_SECRET,
        {
            expiresIn: "2 days"
        })
    res.status(200).send({
        user: userDetails,
        token
    })

}

const register =async(req,res)=>{
    const {email,password,firstName,lastName,userType}=req.body
    console.log("Hello from postman")
    if(!email || !password || !firstName || !lastName){
        res.status(400).send({message:"all fields are required"})

    } else{
        try {
            const user= new User({
                email,
                password,
                firstName,
                lastName,
                userType
            })
    
            await user.save()
            res.status(200).send({user})
        } catch (error) {
            res.status(500).send({error:error})
        }
    }

 
}
module.exports={
    login,register
}