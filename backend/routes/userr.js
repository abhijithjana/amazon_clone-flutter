const express =require('express');
const adminmiddle = require('../middlewhere/adminmiddel');
const auth = require('../middlewhere/userauth');
const Ordermodel = require('../model/order');
const {Product} = require('../model/productmodel');
const { count } = require('../model/usermodel');
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

userroute.put('/user/updateaddress',auth,async(req,res)=>{
    try {
        const {address}=req.body;
        let updatesuser=await User.findByIdAndUpdate(req.user,{
            address:address,
        },{
            new:true
        });
        res.status(200).json(updatesuser);

    } catch (error) {
        res.status(501).json({error:error.message});
    }
})
userroute.post('/user/place-order',auth,async(req,res)=>{
    try {
     
        const {cart,totalprice,address}=req.body;
        let products=[];
       
        for(let i=0;i<cart.length;i++){
          
            let product=await Product.findById(cart[i].product._id);
            
            if(product.qualtity>=cart[i].count){
                product.qualtity-=cart[i].count;
                products.push({product,count:cart[i].count});
                    await product.save();

                }
            else{
                     res.status(400).json({'msg':`${product.name} is out of stock limit`});
            }
        }

        await User.findByIdAndUpdate(req.user,{
           cart:[],
        });

        let order=new Ordermodel(
            {
                products,
                totalprice,
                address,
                userId:req.user,
                orderAt: new Date().getTime()
            }
        );
      
        order=await order.save();
        res.status(200).json(order);

    } catch (error) {
              res.status(501).json({error:error.message});
    }
});

userroute.get('/user/order',auth,async(req,res)=>{
try {
    let order= await Ordermodel.find({userId:req.user});
   
    res.json(order);
} catch (error) {
    res.status(501).json({error:error.message});
}
})

module.exports=userroute;