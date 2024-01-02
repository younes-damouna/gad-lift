const express=require("express")

const {connectToMongoDb, connectToMongoDB} =require("./configs/mongoDB.configs")
const app=express()
app.use(express.json())
require("dotenv").config()

app.get("/hello",(res,req)=>{
    console.log("Hello!")
})

app.listen(8000,()=>{
    console.log("Server is Listening on Port: ", 8000);

    connectToMongoDB();
});