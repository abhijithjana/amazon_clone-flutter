const express =require('express');
const adminmiddle = require('../middlewhere/adminmiddel');
const auth = require('../middlewhere/userauth');
const {Product} = require('../model/productmodel');
const User = require('../model/usermodel');
const userroute=express.Router();


userroute.post('/user/add-card',auth,async(req,res)=>{
    try {  
        
        const {id}=req.body;
        let product=await Product.findById(id);

        let user =await User.findById(req.user);
       

        if(user.cart.length==0){
            
            user.cart.push({
                product,
                count:1
            })
            
        
        }
        
        else{
            let isproctfound=false;
            for(let i=0;i<user.cart.length;i++){
                
                   if(user.cart[i].product._id.equals(product._id)){
                  
                      isproctfound=true;
                     
                   }
            }
              
            if(isproctfound){
                
                let p=user.cart.find((products)=>products.product._id.equals(product._id));
                p.count+=1;
               
            }
            else{
                user.cart.push({
                    product,
                    count:1
                }) 
            }
         
        }
        user=await user.save();
        res.status(200).json(user);
    } catch (error) {
        res.status(501).json({error:error.message});
    }
});




userroute.delete('/user/remove-card/:id',auth,async(req,res)=>{
    try {  
    
        const {id}=req.params;
        
        let product=await Product.findById(id);
       
        let user =await User.findById(req.user);
       

       
        
    
            
            for(let i=0;i<user.cart.length;i++){
                
                   if(user.cart[i].product._id.equals(product._id)){
                 
                      if(user.cart[i].count==1){
                        user.cart.splice(i,1);
                      }
                     else{ 
                        
                       user.cart[i].count-=1;
                       
                     }
                   }
            }
              
            
           
         
      
        user=await user.save();
        res.status(200).json(user);
    } catch (error) {
        res.status(501).json({error:error.message});
    }
});

module.exports=userroute;