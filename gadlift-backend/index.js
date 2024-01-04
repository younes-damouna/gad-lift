const express=require("express")

const {connectToMongoDb, connectToMongoDB} =require("./configs/mongoDB.configs")
const app=express()
app.use(express.json())
require("dotenv").config()

app.get("/hello", (req, res) => {
    console.log("HELLO!!");
  });
  
const authRoutes=require("./routes/auth.routes")
app.use("/auth",authRoutes)

app.listen(8000,()=>{
    console.log("Server is Listening on Port: ", 8000);

    connectToMongoDB();
});