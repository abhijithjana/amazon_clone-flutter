const mongoose=require('mongoose');

const ratingSchema=mongoose.Schema({
    userid:{
        required:true,
        type:String
    },
    rating:{
        required:true,
        type:Number
    }
});

module.exports=ratingSchema;