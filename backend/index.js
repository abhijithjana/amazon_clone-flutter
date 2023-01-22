//package import
const express=require('express');
const mongose=require('mongoose');
const mduri = require('./privatecontant');
const adminroute = require('./routes/admin');

const app=express();

const port=3000;
//module import 
const authrouter=require("./routes/auth");
const productroute = require('./routes/product');
const userroute = require('./routes/userr');


//middlewere
app.use(express.json())
app.use(authrouter);
app.use(adminroute);
app.use(productroute)
app.use(userroute);


//connection
mongose.connect(mduri).then(
    console.log("connection succsfull to database")
).catch((e)=>{
    console.log(e);
})

app.listen(port,"0.0.0.0",()=>{
    console.log(`succesfully connected port number ${port}`);
});

