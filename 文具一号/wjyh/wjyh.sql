#设置客户端连接服务器使用UTF8字符集
SET NAMES UTF8;
#丢弃数据库by如果存在的话
DROP DATABASE IF EXISTS wjyh;
#创建一个新的kongfz表使用UTF8字符集
CREATE DATABASE wjyh CHARSET=UTF8;
use wjyh;


/******************用户模块相关的表**********************/
#用户信息表
CREATE TABLE wjyh_user (
    uid int(11) NOT NULL auto_increment,
    uname varchar(32) default NULL,
    upwd varchar(32) default NULL,
    email varchar(64) default NULL,
    phone varchar(16) default NULL,
    avatar varchar(128) default NULL,
    user_name varchar(32) default NULL,
    gender int(11) default NULL,
    PRIMARY KEY  (uid)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8;

INSERT INTO wjyh_user VALUES
('1', 'abc','123456','94433541@qq.com','13012347895','img/avatar/default.png', '卡兹', '0'),
('2', 'geili','123456','333453789@qq.com','18702332212','img/avatar/default.png', '波罗地', '1'),
('3', 'sangtana','123456','113432789@qq.com','19603692541','img/avatar/default.png', '米斯达', '1'),
('4', 'sikate','123456','113456111@qq.com','18958663244','img/avatar/default.png', '强森', '0');

/**********************轮播图*********************************/
#首页轮播图模块
CREATE TABLE index_carousel (
    cid int(11) NOT NULL auto_increment,
    img varchar(128) default NULL,
    title varchar(64) default NULL,
    href varchar(64) default NULL,
    PRIMARY KEY (cid)
)ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

INSERT INTO index_carousel VALUES
('1','img/banner/01.jpg','轮播广告1','01.html'),
('2','img/banner/02.jpg','轮播广告2','02.html'),
('3','img/banner/03.jpg','轮播广告3','03.html'),
('4','img/banner/04.jpg','轮播广告4','04.html'),
('5','img/banner/05.jpg','轮播广告5','05.html');



/**************************购物车**********************/
CREATE TABLE wjyh_shoppingcart(
    iid int(11) NOT NULL auto_increment,
    user_id int(11) default NULL,
    product_id int(11) default NULL,
    is_checked tinyint(1) default NULL,
    PRIMARY KEY (iid)
)ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8;

INSERT INTO wjyh_shoppingcart VALUES
('1', '1', '17',  '0'),
('2', '2', '11',  '0'),
('3', '3', '1',  '1'),
('4', '3', '3',  '0'),
('5', '3', '1',  '0'),
('13', '4', '1',  '1'),
('14', '4', '17',  '1'),
('15', '2', '28',  '0'),
('16', '2', '2',  '1'),
('17', '1', '28',  '1'),
('18', '2', '14', '1');
/***************************用户订单******************/
CREATE TABLE wjyh_order_detail(
  did INT PRIMARY KEY AUTO_INCREMENT,
  order_id INT,           #订单编号
  product_id INT,         #产品编号
  count INT ,              #购买数量
  status INT,             #订单状态1-等待付款2-等待发货3-运输中4-已签收5-已取消
  order_time BIGINT,      #下单时间
  pay_time BIGINT,        #付款时间
  deliver_time BIGINT,    #发货时间
  received_time BIGINT    #签收时间
);

/******************首页商品列表************************/
#书写用品表
CREATE TABLE index_product_write(
    pid INT PRIMARY KEY AUTO_INCREMENT,  #编号
    title VARCHAR(64),                   #标题
    pic VARCHAR(128),                    #图片
    price DECIMAL(10,2),                 #价格
    href VARCHAR(128),                   #链接
    seq_top_sale TINYINT                 #首页推荐
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8;
INSERT INTO index_product_write VALUES
('1','金万年 中性笔 0.5mm 水笔 水笔 签字笔 G-1009 12支装','product1.jpg','9.41','product_write.html?pid=1','1'),
('2','斑马（zebra）大双头记号笔 油性记号笔 MO-150-MC','product2.jpg','63.80','product_write.html?pid=2','2'),
('3','金万年白板笔 梅花后塞白板笔 办公型大容量易擦白板笔G-0611 10支装','product3.jpg','11.22','product_write.html?pid=3','3'),
('4','三菱（Uni）UB-150 直液式 中性笔 签字笔 0.5mm 10支装','product4.jpg','64.90','product_write.html?pid=4','4');

#文件储存
CREATE TABLE index_product_file(
    pid INT PRIMARY KEY AUTO_INCREMENT,  #编号
    title VARCHAR(64),                   #标题
    pic VARCHAR(128),                    #图片
    price DECIMAL(10,2),                 #价格
    href VARCHAR(128),                   #链接
    seq_top_sale TINYINT                 #首页推荐
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8;
INSERT INTO index_product_file VALUES
('1','得力 A4文件夹 单强力夹+插袋 5301','product2_1.jpg','9.41','product_file.html?pid=1','5'),
('2','树德 VOA彩色资料册 A4/40页 V40B 单个装','product2_2.jpg','15.68','product_file.html?pid=2', '6');

/*****************************分类*********************************/
CREATE TABLE biy_wjyh_family (
  fid int(11) NOT NULL auto_increment,
  fname varchar(32) default NULL,
  PRIMARY KEY  (fid)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

INSERT INTO biy_wjyh_family VALUES
('1', '书写用品'),
('2', '文件储存'),
('3', '桌面文具'),
('4', '办公消耗'),
('5', '薄本纸张'),
('6', '学生幼教'),
('7', '美术画册');
/*********************************商品******************************/
CREATE TABLE wjyh_laptop(
  lid INT PRIMARY KEY AUTO_INCREMENT,
  family_id INT,              #所属型号家族编号
  title VARCHAR(128),         #主标题
  subtitle VARCHAR(128),      #副标题
  price DECIMAL(10,2),        #价格
  promise VARCHAR(64),        #服务承诺
  spec VARCHAR(64),           #规格/颜色

  lname VARCHAR(32),          #商品名称

  details VARCHAR(1024),      #产品详细说明

  shelf_time BIGINT,          #上架时间
  sold_count INT,             #已售出的数量
  is_onsale BOOLEAN           #是否促销中
);
/***********************收货地址信息******/
CREATE TABLE wjyh_address(
  aid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,                #用户编号
  receiver VARCHAR(16),       #接收人姓名
  province VARCHAR(16),       #省
  city VARCHAR(16),           #市
  county VARCHAR(16),         #县
  address VARCHAR(128),       #详细地址
  cellphone VARCHAR(16),      #手机
  fixedphone VARCHAR(16),     #固定电话
  postcode CHAR(6),           #邮编
  tag VARCHAR(16),            #标签名

  is_default BOOLEAN          #是否为当前用户的默认收货地址
);





