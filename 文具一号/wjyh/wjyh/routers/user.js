const express=require("express");
const pool=require("../pool.js");
const router=express.Router();

router.get("/v1/login/:uname&:upwd",function(req,res){
    var $uname=req.params.uname;
    var $upwd=req.params.upwd;
    var sql="select uname,upwd from wjyh_user where uname=? and upwd=?";
    pool.query(sql,[$uname,$upwd],(err,result)=>{
        if(err)throw err;
        if(result.length>0){
            res.send("1");
        }else{
            res.send("0");
        };
    });
});
router.post("/v1/reg",function(req,res){
	var $uname=req.body.uname;
	var $upwd=req.body.upwd;
	var $email=req.body.email;
	var $phone=req.body.phone;
	var $user_name=req.body.user_name;
	var $gender=req.body.gender;
	var $obj={uname:$uname,upwd:$upwd,email:$email,phone:$phone,user_name:$user_name,gender:$gender}
	
	var sql="insert into wjyh_user set ?";
	pool.query(sql,[$obj],(err,result)=>{
		if(err)throw err;
		res.send(result);
	});
});
//6.注册验证
router.get("/v1/check/:uname",function(req,res){
	 var $uname=req.params.uname;
	 var sql="select uname from wjyh_user where uname=?";
	 pool.query(sql,[$uname],(err,result)=>{
		 if (err)throw err;
		 if(result.length>0){
			 res.send("1");
		 }else {
			 res.send("0");
		 }
	 });

});
module.exports=router;