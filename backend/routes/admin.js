const express =require('express');
const adminmiddle = require('../middlewhere/adminmiddel');
const {Product} = require('../model/productmodel');
const adminroute=express.Router();
const Ordermodel = require('../model/order');


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
adminroute.get('/admin/orderproduct',adminmiddle,async(req,res)=>{
    try {  
        const oderproduct=await Ordermodel.find({});
        res.json(oderproduct);
    } catch (error) {
        console.log(' error');
        res.status(501).json({error:error.message});
    }
});
adminroute.post('/admin/updateoderstatus',adminmiddle,async(req,res)=>{
    try { 
        
        let updatestatus=await Ordermodel.findByIdAndUpdate(req.body.id,{
            status:req.body.status<3?req.body.status+1:req.body.status
        },{
            new:true
        });
        console.log('hh');
        res.status(200).json(updatestatus);
    } catch (error) {
        console.log(' error');
        res.status(501).json({error:error.message});
    }
});

adminroute.get('/admin/analythics',adminmiddle,async(req,res)=>{
    try { 
       let totalearning=0;
       const order=await Ordermodel.find({});
        for(let i=0;i<order.length;i++){
            for(let j=0;j<order[i].products.length;j++){
                totalearning=order[i].products[j].count*order[i].products[j].product.price;

            }
        }
       let mobiles= await fetchearningCat('Mobiles');
       let essentials= await fetchearningCat('Essentials');
       let appliances= await fetchearningCat('Appliances');
       let books= await fetchearningCat('Books');
       let fashion= await fetchearningCat('Fashion');

       let earning={
        totalearning,
        mobiles,
        essentials,
        appliances,
        books,
        fashion
       }
        res.status(200).json(earning);
    } catch (error) {
        console.log(' error');
        res.status(501).json({error:error.message});
    }
});

async function fetchearningCat(category) {
    let earning=0;
       const categoryorder=await Ordermodel.find({
        'products.product.category':category
       });
        for(let i=0;i<categoryorder.length;i++){
            for(let j=0;j<categoryorder[i].products.length;j++){
                earning=categoryorder[i].products[j].count*categoryorder[i].products[j].product.price;

            }
        }
        return earning;
} 
module.exports=adminroute;