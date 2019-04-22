SET NAMES UTF8;
DROP DATABASE IF EXISTS mtime;
CREATE DATABASE mtime CHARSET=UTF8;
USE mtime;

/*用户信息*/
CREATE TABLE mt_user(
  uid INT PRIMARY KEY AUTO_INCREMENT,
  uname VARCHAR(32),
  upwd VARCHAR(32),
  phone VARCHAR(16),
  email VARCHAR(64),
  user_name VARCHAR(32),  #用户姓名
  gender TINYINT          #性别 1-男 0-女
);

/*影片列表*/
CREATE TABLE mt_movie(
  mid INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(64), #标题
  duration SMALLINT, #时长 139分钟
  mtype VARCHAR(16), #类型 动作 犯罪
  score DECIMAL(3,1), #评分 7.9
  scene VARCHAR(64), #26家影院上映213场
  subtitle VARCHAR(64), #副标题 调音师假扮盲人意外目睹凶案
  img VARCHAR(128)
);

/*影片详情*/
CREATE TABLE mt_movie_detail(
  did INT PRIMARY KEY AUTO_INCREMENT,
  movie_id INT, 
  title VARCHAR(64),
  mversion VARCHAR(32), #版本 2D/3D
  director VARCHAR(32), #导演
  country VARCHAR(32), #国家地区 中国
  intro VARCHAR(512), #剧情简介
  imgs VARCHAR(5120),
  FOREIGN KEY(movie_id) REFERENCES mt_movie(mid)
);

/*影院信息*/
CREATE TABLE mt_cinema(
  cid INT PRIMARY KEY AUTO_INCREMENT,
  cname VARCHAR(64), #影院名
  caddress VARCHAR(128), #地址
  pic VARCHAR(128), #照片
  sp DECIMAL(3,1) #start price ¥37.9元起
);

/*首页轮播*/
CREATE TABLE mt_home_carousel(
  hcid INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(64),
  img VARCHAR(128),
  href VARCHAR(128)
);

/*首页今日热点*/
CREATE TABLE mt_home_hot(
  hhid INT PRIMARY KEY AUTO_INCREMENT,
  tilte VARCHAR(64),
  subtitle VARCHAR(64),
  img VARCHAR(128)
);

/********************/
/******数据导入*******/
/********************/

/*用户信息*/
INSERT INTO mt_user VALUES
(null,'tom','123456',13812341111,'tom@qq.com','汤姆',1),
(null,'jerry','123456',13812342222,'jerry@163.com','杰瑞',1),
(null,'lucy','123456',13812343333,'lucy@qq.com','露西',0),
(null,'lily','123456',13812344444,'lily@163.com','莉莉',0),
(null,'lilei','123456',13812345555,'lilei@sina.com','李雷',1),
(null,'hmm','123456',13812346666,'hmm@qq.com','韩梅梅',0);


