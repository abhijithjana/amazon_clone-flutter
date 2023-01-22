const mongoose=require('mongoose');
const { productScheema } = require('./productmodel');

const userSchema=mongoose.Schema(
    {
        name:{
            type:String,
            trim:true,
            required:true

        },
        email:{
            type:String,
            required:true,
            trim:true,
            validate:{
                validator:(value)=>{
                    const re=/^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
                    return value.match(re);
                },
                message:"please enter a valid email"
            }
        },
        password:{
            type:String,
            required:true,
            trim:true,
           
        },
        address:{
            type:String,
            default:''
        },
        type:{
            type:String,
            default:"user"
        },

        cart:[
            {
                product:productScheema,
                
                count:{
                    type:Number,
                    require:true
                }
            }
        ]
    }
)

const User=mongoose.model('User',userSchema);


module.exports=User;