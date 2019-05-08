const express=require("express");
const pool=require("../pool.js");
var router=express.Router();
//添加路由
//1.用户登录
router.get("/login",(req,res)=>{
  var {uname,upwd,phone}=req.query;
  var sql="SELECT uid FROM mt_user WHERE (uname=? OR phone=?) AND upwd=?";
  pool.query(sql,[uname,phone,upwd],(err,result)=>{
    if(err) throw err;
    if(result.length>0){
      res.send({code:1,msg:"登录成功"})
    }else{
      res.send({code:-1,msg:"账号或密码有误"})
    }
  })
})
//2.用户注册
//2.1 用户名检验是否被注册
router.get("/unameCheck",(req,res)=>{
  var uname=req.query.uname;
  var sql="SELECT uid FROM mt_user WHERE uname=?";
  pool.query(sql,[uname],(err,result)=>{
    if(err) throw err;
    if(result.length>0){
      res.send({code:-1,msg:"该用户名已被注册"})
    }else{
      res.send({code:1,msg:"该用户名可使用"})
    }
  })
})
//2.2注册register
router.post("/register",(req,res)=>{
  var {uname,upwd,phone,gender}=req.body;
  console.log(req.body);
  var sql="INSERT INTO mt_user (uname,upwd,phone,gender) VALUES (?,?,?,?)";
  pool.query(sql,[uname,upwd,phone,gender],(err,result)=>{
    if(err) throw err;
    if(result.affectedRows>0){
      res.send({code:1,msg:"注册成功"})
    }
  })
})
//2.3手机号检验是否被注册
router.get("/phoneCheck",(req,res)=>{
  var phone=req.query.phone;
  var sql="SELECT uid FROM mt_user WHERE phone=?";
  pool.query(sql,[phone],(err,result)=>{
    if(err) throw err;
    if(result.length>0){
      res.send({code:-1,msg:"该手机号已被注册"})
    }else{
      res.send({code:1,msg:"该手机号可使用"})
    }
  })
})


//3.用户修改
//4.用户注销
//SELECT uid FROM mt_user WHERE (uname='undefined' OR phone='13812341111') AND upwd='123456';
module.exports=router;