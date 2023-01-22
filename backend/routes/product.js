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



productroute.get('/api/product/dealoftheday',auth,async(req,res)=>{

  try {
    let topratedp=0;
     let p=new Product();
     let products= await Product.find();

                
     let avg=0;
     let t=0
              for(let j=0;j<products.length;j++){
              
                for(let i=0;i<products[j].rating.length;i++){
                  t+=products[j].rating[i].rating;
            }
            t>0?avg=t/products[j].rating.length:0;
            if(topratedp<avg){
        
       
              topratedp=avg;
                 p=products[j];
                
              }
              }
    

     
     
      
      console.log(p);
      res.status(200).json(p)
     }
      catch (error) {
    res.status(501).json({error:error.message});
  }
});




module.exports=productroute;