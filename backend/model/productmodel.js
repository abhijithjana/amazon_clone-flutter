const mongoose=require('mongoose');

const productScheema=mongoose.Schema(
    {
        name:{
            type:String,
            trim:true,
            required:true
        },
        description:{
            type:String,
            required:true
        },
        price:{
            type:Number,
            required:true,
            trim:true
         },
         qualtity:{
            type:Number,
            required:true,
            trim:true
         },
         category:{
            type:String,
            required:true
         },
         images:[
            {
                type:String,
                required:true
            }
         ]
    }
);


const Product=mongoose.model('Product',productScheema);


module.exports=Product;