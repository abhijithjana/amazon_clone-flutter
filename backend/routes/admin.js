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

adminroute.get('/admin/getproduct',(req,res)=>{
    try {
        const id =req.body;
        let product=Product.findById(id);
        images=Product.images;
        res.json({product})
    } catch (error) {
        
    }
})

module.exports=adminroute;