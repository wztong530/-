const express=require("express");
const pool=require("../pool.js");
var router=express.Router();
//添加路由
//1.获取影院列表
router.get("/cinemaList",(req,res)=>{
  var pno=req.query.pno;
  var pageSize=req.query.pageSize;
  if(!pno) pno=1;
  if(!pageSize) pageSize=8;
  var sql="SELECT cid,cname,caddress,sp FROM mt_cinema LIMIT ?,?";
  var offset=(pno-1)*pageSize;
  pageSize=parseInt(pageSize);
  pool.query(sql,[offset,pageSize],(err,result)=>{
    if(err) throw err;
    res.send({code:1,data:result});
  })
});

//2.获取商品系列列表
router.get("/getfamily",(req,res)=>{
  var sql="SELECT family_id,title,en_title,logo,bg FROM mt_pro_family WHERE family_id<6";
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    res.send({code:1,data:result});
  })
});

//3.获取商品列表
router.get("/getproducts",(req,res)=>{
  var family_id=req.query.family_id;
  var sql="SELECT pid,pname,price,img FROM mt_products WHERE family_id = ?";
  pool.query(sql,[family_id],(err,result)=>{
    if(err) throw err;
    res.send({code:1,data:result});
  })
});

//4.获取推荐商品列表
router.get("/recommend",(req,res)=>{
  var pno=req.query.pno;
  var pageSize=req.query.pageSize;
  if(!pno) pno=1;
  if(!pageSize) pageSize=8;
  var offset=(pno-1)*pageSize;
  pageSize=parseInt(pageSize);
  var sql="SELECT pid,pname,price,img FROM mt_products LIMIT ?,?";
  pool.query(sql,[offset,pageSize],(err,result)=>{
    if(err) throw err;
    res.send({code:1,data:result});
  })
});

module.exports=router;