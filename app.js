const express = require('express');
const session = require("express-session");
const bodyParser = require('body-parser');
const cors=require("cors");
/*引入路由模块*/
var home=require("./routes/home.js"); 
var user=require("./routes/user.js");


var app = express();
app.listen(3000);
app.use(cors({
  origin:'http://127.0.0.1:6600',
  credentials:true
}))
//使用body-parser中间件
app.use(bodyParser.urlencoded({extended:false}));
//托管静态资源到public目录下
app.use(express.static('public'));
app.use(session({
  secret:'随机字符串',
  cookie:{maxAge:60*1000*30},//过期时间ms
  resave:false,
  saveUninitialized:true
}));//将服务器的session，放在req.session中
/*使用路由器来管理路由*/
app.use("/home",home);
app.use("/user",user);




