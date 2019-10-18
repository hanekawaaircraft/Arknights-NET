$(".title").click(function(){
	$(this).addClass("curr").siblings(".title").removeClass("curr");
	$(".content>div").eq($(this).index()).removeClass("dn").siblings().addClass("dn");
})


/*
 * 左右滚动
 */






/*
 * $(".arrow_left")
$(".sameproduct_content1 ul li")
{
	_options.jqDom:,//li对象
	_options.leftClickBtn:,//左按钮
	_options.rightClickBtn:,//右按钮
	_options.rollClass//滚动对象的class
	_options.rollWidth//滚动的宽度
}
*/
function rollMove(options){
	var _options=options;
	var num=0;
	//图片的页数
	var count=_options.jqDom.size()/6;
	
	_options.leftClickBtn.click(function(){
		if(count<1){
			return ;
		}
		num++;
		if(num>=count){
			num-=1;
			return;
		}
//		console.log("num:"+num)
//		console.log("count"+count)
		$(this).siblings(_options.rollClass).animate({
			left:-(_options.rollWidth*num)+"px"
		},1000)
	})
	
	_options.rightClickBtn.click(function(){
	num--;
//	console.log("右按钮num："+num)
//	console.log("右按钮页数："+count)
	if(num<0){
		num=0;
	};
	$(this).siblings(_options.rollClass).animate({
		left:-(_options.rollWidth*num)+"px"
	},1000)
})
}

//rollMove({
//	jqDom:$(".sameproduct_content1 ul li"),
//	rollClass:".same_active",
//	rollWidth:972,
//	leftClickBtn:$(".arrow_left"),
//	rightClickBtn:$(".arrow_right")
//});



//滚动2
var num2=0;
//图片的页数
var count2=$(".sameproduct_content2 ul li").size()/6;

$(".arrow_left2").click(function(){
	if(count2<1){
		return ;
	}
	num2++;
	if(num2>=count2){
		num2-=1;
		return;
	}
//	console.log("num:"+num2)
//	console.log("count"+count2)
//	if(num>count){
//		num=count-1;
//	};
	$(this).siblings(".same_active").animate({
		left:-(972*num2)+"px"
	},1000)
})

$(".arrow_right2").click(function(){
	num2--;
//	console.log("右按钮num："+num2)
//	console.log("右按钮页数："+count2)
	if(num2<0){
		num2=0;
	};
	$(this).siblings(".same_active").animate({
		left:-(972*num2)+"px"
	},1000)
})