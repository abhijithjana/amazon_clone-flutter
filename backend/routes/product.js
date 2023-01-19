const express = require("express");
const auth = require("../middlewhere/userauth");
const Product = require("../model/productmodel");
const ratingSchema = require("../model/rating");

const productroute=express.Router();



productroute.get('/api/product',auth, async(req,res)=>{
    try {
        console.log(req.query.category);
        let product= await Product.find({category:req.query.category});
        res.status(200).json(product);
    } catch (error) {
        res.status(500).json({error:error.message});
    }
});

productroute.get('/api/product/search/:name',auth,async(req,res)=>{
    try {
       
        const searchelement=req.params.name;
        let product =await Product.find({
            name:{$regex:searchelement ,$options:"i"},
        });

         res.status(200).json(product);
    } catch (error) {

        res.status(500).json({error:error.message});
    }
}) 

productroute.post('/api/rating/product',auth,async(req,res)=>{
  try {
   
    const {id,rating}=req.body;
    let product= await Product.findById(id);

    for(let i=0;i<product.rating.length;i++){
         if(product.rating[i].userid==req.user){
             product.rating.splice(i,1);
            
             break;
         }
         
    }
    
 
  const ratingSchema={
    userid:req.user,
    rating
  }
  
  
  product.rating.push(ratingSchema);
 


  product =await product.save();

  res.status(200).json(product);

    
  } catch (error) {
    res.status(500).json({error:error.message});

    
  }
});




module.exports=productroute;