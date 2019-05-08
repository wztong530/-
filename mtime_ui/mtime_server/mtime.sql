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
CREATE TABLE mt_movie_details(
  did INT PRIMARY KEY AUTO_INCREMENT,
  mid INT, 
  title VARCHAR(64),
  mversion VARCHAR(32), #版本 2D/3D
  director VARCHAR(32), #导演
  country VARCHAR(32), #国家地区 中国
  intro VARCHAR(512), #剧情简介
  imgs VARCHAR(5120),
  FOREIGN KEY(mid) REFERENCES mt_movie(mid)
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

/*插入影院信息列表*/
INSERT INTO mt_cinema VALUES
(null,'金逸影城厦门洋塘店','厦门市翔安区鼓锣一里61号119号闽篮城市广场三楼','share07.png',39),
(null,'厦门明发金逸IMAX影城','厦门市思明区莲坂明发商业广场B区二楼百安居后侧','share07.png',24),
(null,'厦门金逸海沧悦实店','厦门市海沧区新阳街道新盛路19号悦实广场5号楼6层','share07.png',35),
(null,'厦门文化艺术中心金逸影城','厦门体育路文化艺术中心科技馆一楼','share07.png',24),
(null,'金逸影城厦门名汇全激光店','厦门市霞溪路28号名汇广场三楼','share07.png',24),
(null,'金逸国际影城 厦门明发店','厦门市莲坂明发商业广场东区381号C区三楼','share07.png',29),
(null,'厦门万达影城SM广场店','SM广场二期B座3层','share07.png',38),
(null,'厦门湖里万达广场店','厦门湖里区仙岳路4666号万达广场娱乐楼4层','share07.png',33),
(null,'中影数字梦工坊影城','福建省厦门市思明区莲前东路123号加州城市广场4F东侧','share07.png',39),
(null,'厦门集美万达广场店','厦门市集美区银江路137号万达广场4层','share07.png',38),
(null,'厦门万达影城世茂海峡广场店','厦门市思明区演武西路世茂海峡大厦6楼','share07.png',38),
(null,'金逸影城厦门洋塘店','厦门市翔安区鼓锣一里61号119号闽篮城市广场三楼','share07.png',39),
(null,'厦门明发金逸IMAX影城','厦门市思明区莲坂明发商业广场B区二楼百安居后侧','share07.png',24),
(null,'厦门金逸海沧悦实店','厦门市海沧区新阳街道新盛路19号悦实广场5号楼6层','share07.png',35),
(null,'厦门文化艺术中心金逸影城','厦门体育路文化艺术中心科技馆一楼','share07.png',24),
(null,'金逸影城厦门名汇全激光店','厦门市霞溪路28号名汇广场三楼','share07.png',24),
(null,'金逸国际影城 厦门明发店','厦门市莲坂明发商业广场东区381号C区三楼','share07.png',29),
(null,'厦门万达影城SM广场店','SM广场二期B座3层','share07.png',38),
(null,'厦门湖里万达广场店','厦门湖里区仙岳路4666号万达广场娱乐楼4层','share07.png',33),
(null,'中影数字梦工坊影城','福建省厦门市思明区莲前东路123号加州城市广场4F东侧','share07.png',39),
(null,'厦门集美万达广场店','厦门市集美区银江路137号万达广场4层','share07.png',38),
(null,'厦门万达影城世茂海峡广场店','厦门市思明区演武西路世茂海峡大厦6楼','share07.png',38),
(null,'金逸影城厦门洋塘店','厦门市翔安区鼓锣一里61号119号闽篮城市广场三楼','share07.png',39),
(null,'厦门明发金逸IMAX影城','厦门市思明区莲坂明发商业广场B区二楼百安居后侧','share07.png',24),
(null,'厦门金逸海沧悦实店','厦门市海沧区新阳街道新盛路19号悦实广场5号楼6层','share07.png',35),
(null,'厦门文化艺术中心金逸影城','厦门体育路文化艺术中心科技馆一楼','share07.png',24),
(null,'金逸影城厦门名汇全激光店','厦门市霞溪路28号名汇广场三楼','share07.png',24),
(null,'金逸国际影城 厦门明发店','厦门市莲坂明发商业广场东区381号C区三楼','share07.png',29),
(null,'厦门万达影城SM广场店','SM广场二期B座3层','share07.png',38),
(null,'厦门湖里万达广场店','厦门湖里区仙岳路4666号万达广场娱乐楼4层','share07.png',33),
(null,'中影数字梦工坊影城','福建省厦门市思明区莲前东路123号加州城市广场4F东侧','share07.png',39),
(null,'厦门集美万达广场店','厦门市集美区银江路137号万达广场4层','share07.png',38),
(null,'厦门万达影城世茂海峡广场店','厦门市思明区演武西路世茂海峡大厦6楼','share07.png',38);

/*创建商品系列列表*/
CREATE TABLE mt_pro_family(
  family_id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(64),
  en_title VARCHAR(64),
  logo VARCHAR(128),
  bg VARCHAR(128)
);
/*插入商品系列列表*/
INSERT INTO mt_pro_family VALUES
(null,"星球大战","Star Wars","pic_front1.jpg","pic_bg1.jpg"),
(null,"复仇者联盟","Avengers","pic_front2.jpg","pic_bg2.jpg"),
(null,"魔兽","Warcraft","pic_front3.jpg","pic_bg3.jpg"),
(null,"变形金刚","Transformers","pic_front4.jpg","pic_bg4.jpg"),
(null,"正义联盟","Justice League","pic_front5.jpg","pic_bg5.jpg");
INSERT INTO mt_pro_family VALUES
(null,"玩具模型",null,null,null),
(null,"数码配件",null,null,null),
(null,"服饰配件",null,null,null),
(null,"家居生活",null,null,null);

/*创建商品列表*/
CREATE TABLE mt_products(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  pname VARCHAR(64),
  price DECIMAL(8,2),
  img VARCHAR(128),
  family_id INT,
  FOREIGN KEY(family_id) REFERENCES mt_pro_family(family_id)
);
/*插入商品列表*/
INSERT INTO mt_products VALUES
(null,"星球大战LOGO款马克杯",69,"pic1_1.jpg",1),
(null,"星球大战 Q萌形象T恤",109,"pic1_2.jpg",1),
(null,"Hot toys侠盗一号 琴·厄索1:6人偶",1380,"pic1_3.jpg",1),
(null,"星球大战长飘带棒球帽",69,"pic1_4.jpg",1),
(null,"星球大战 暴风兵炫酷3D背包",399,"pic1_5.jpg",1),
(null,"星球大战 风暴兵3D手机壳",45,"pic1_6.jpg",1),
(null,"黑豹款平沿棒球帽",69,"pic2_1.jpg",2),
(null,"漫威LOGO便携移动电源",188,"pic2_2.jpg",2),
(null,"漫威LOGO时尚双肩背包",139,"pic2_3.jpg",2),
(null,"复仇者联盟毛绒玩偶",45,"pic2_4.jpg",2),
(null,"钢铁侠气囊手机支架",19,"pic2_5.jpg",2),
(null,"钢铁侠金属钥匙扣",35,"pic2_6.jpg",2),
(null,"奥格瑞姆1:9珍藏模型",1299,"pic3_1.jpg",3),
(null,"毁灭之锤1:6模型",299,"pic3_2.jpg",3),
(null,"杜隆坦4.25英寸可动人偶",99,"pic3_3.jpg",3),
(null,"魔兽热血LOGO阵营T恤",99,"pic3_4.jpg",3),
(null,"联盟狮头3D立体背包",499,"pic3_5.jpg",3),
(null,"联盟部落logo便携充电宝",159,"pic3_6.jpg",3),
(null,"变形金刚Logo刺绣T恤",99,"pic4_1.jpg",4),
(null,"汽车人酷炫轮胎充电宝",169,"pic4_2.jpg",4),
(null,"变形金刚5 博派黑金马克杯",79,"pic4_3.jpg",4),
(null,"变形金刚5 擎天柱黑科技笔记本",79,"pic4_4.jpg",4),
(null,"擎天柱限量蓝牙音箱",1499,"pic4_5.jpg",4),
(null,"汽车人手机支架充电宝",169,"pic4_6.jpg",4),
(null,"正义联盟迷你人偶套装",598,"pic5_1.jpg",5),
(null,"蝙蝠侠战车充电宝",188,"pic5_2.jpg",5),
(null,"正义联盟超人马克杯",79,"pic5_3.jpg",5),
(null,"神奇女侠Q版硅胶手机壳",69,"pic5_4.jpg",5),
(null,"正义联盟 Q萌钥匙扣",25,"pic5_5.jpg",5),
(null,"暗黑蝙蝠侠笔记本",49,"pic5_6.jpg",5);
INSERT INTO mt_products VALUES
(null,"aniplex+ 1/8加藤恵和服ver.",1040,"cart0_1.jpg",6),
(null,"野兽国 钢铁侠 MARK1",589,"cart0_2.jpg",6),
(null,"魔兽 杜隆坦4.25英寸可动人偶",99,"cart0_3.jpg",6),
(null,"复联4漫画风手机壳",49,"cart1_1.jpg",7),
(null,"死侍2 Q萌头像指环支架",29,"cart1_2.jpg",7),
(null,"复仇者联盟4 英雄形象USB数据线",29,"cart1_3.jpg",7),
(null,"复联4英雄人物合集潮款T恤",109,"cart2_1.jpg",8),
(null,"哈利波特 金色飞贼钥匙扣",29,"cart2_2.jpg",8),
(null,"漫威LOGO长带棒球帽",69,"cart2_3.jpg",8),
(null,"漫威钢铁侠镭射马克杯",119,"cart3_1.jpg",9),
(null,"哈利波特学院风白色保温杯",99,"cart3_2.jpg",9),
(null,"九又四分之三站台马克杯",59,"cart3_3.jpg",9);


