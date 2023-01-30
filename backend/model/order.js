const mongoose=require('mongoose');
const {productScheema} = require('../model/productmodel');

const orderSchema=mongoose.Schema({
    products:[
        {
         product:productScheema,
         count:{
            type:Number,
            required:true
         }   
        }
    ],
    totalprice:{
        type:Number,
        required:true
    },
    address:{
        type:String,
        required:true
    },
    userId:{
        required:true,
        type:String
    },
    orderAt:{
        required:true,
        type:Number
    },
    status:{
        type:Number,
        default:0
    }
});

const Ordermodel=mongoose.model('Ordermodel',orderSchema);

module.exports=Ordermodel;