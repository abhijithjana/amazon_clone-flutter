//package import
const express=require('express');
const mongose=require('mongoose');

const app=express();
const mduri="mongodb+srv://abhijith:GqPRoFYX17sUZ4MV@cluster0.z9tbdni.mongodb.net/?retryWrites=true&w=majority"

const port=3000;
//module import 
const authrouter=require("./routes/auth");


//middlewere
app.use(express.json())
app.use(authrouter);


//connection
mongose.connect(mduri).then(
    console.log("connection succsfull to database")
).catch((e)=>{
    console.log(e);
})

app.listen(port,"0.0.0.0",()=>{
    console.log(`succesfully connected port number ${port}`);
});

