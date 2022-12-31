const express =require('express');
const adminmiddle = require('../middlewhere/adminmiddel');
const Product = require('../model/productmodel');
const adminroute=express.Router();


adminroute.post('/admin/add-Product',adminmiddle,async(req,res)=>{
    try {  
        const{name,description,price,qualtity,category,images}=req.body;
        
        
         let product=new Product(
            {name,
            description,
            price,
            qualtity,
            category,
            images
            }
         );

         product=await product.save();
          res.status(200).json(product);
    } catch (error) {
        res.status(501).json({error:error.message});
    }
});



//get all  product

adminroute.get('/admin/getproduct',adminmiddle,async(req,res)=>{
    try {
       const product = await Product.find({});
       
       res.status(200).json(product);
       
       
    } catch (error) {
        console.log(' error');
        res.status(501).json({error:error.message});
    }
})

adminroute.post('/admin/deleteproduct',adminmiddle,async(req,res)=>{
    try {  const id=req.body.id;
            
        const product = await Product.findByIdAndDelete(id);
         if(product.acknowledged)
         res.status(200).json(product)
         else
         res.status(401).json(product);
        
    } catch (error) {
        console.log(' error');
        res.status(501).json({error:error.message});
    }
});
module.exports=adminroute;