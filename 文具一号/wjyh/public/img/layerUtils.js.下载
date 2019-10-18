//弹窗
/*
 * width:弹框宽度   number类型
 * contentClass：弹框类型的class选择器 string
 * text：弹框中的文字	string
 * callback：回调（确定按钮） 
 * options:标题的开关  bool类型  
 * skin:添加自定义样式     string  ||skin不仅允许你传入layer内置的样式class名，还可以传入您自定义的class名
*/

function showLayer(width, contentClass,text,callback,options,skin,title_text) {//娘的,参数越来越多了,有空改成对象
	var sSkin=skin?skin:"";
	if(typeof title_text=='string'){
		var options_title='<div class="popup-title-wrapper"><div class="popup_title login_hd mb20">'+title_text+'<img class="login_close" src="views/mall/images/popupImages/close.png" onmousedown="hidePop(event)"/></div></div>';
	}else{
		var options_title='<div class="popup_title login_hd mb20"><img class="login_close" src="views/mall/images/popupImages/close.png" onmousedown="hidePop(event)"/></div>';
	}
	
	if(options==false){
		options_title=options;
	}
	
	var _content = contentClass || "popup_content";
//		$("#change_lock1,.mobile_lock_box ").css({
//			"display": "block !important",
//			"z-index": "99999999"
//		});

	$("." + _content).children("span").html(text);
	
	var ww=$(window).width();
	var PosX=(ww-width)/2;
	
	layer.open({
		type: 1,
		move:'.popup_title',
		skin: sSkin ,//添加自定义样式
		moveType: 1, 
		area: width + 'px',
		shade: 0.2,
		shift: -1,
		title: options_title,//设置标题开关
		content: $("." + _content)
	});
	
	$("." + _content).parent().parent().css({
		"display": "block"
		// "z-index": "99999999"
	});
	
	//每次点击解绑事件
	$(".sEnter,.iEnter").unbind("click");
	$(".sEnter,.iEnter,.second_btn,.iSaveF,.checkcorrect").bind("click",callback);
//	$(".sEnter,.iEnter,.second_btn,.iSaveF,.checkcorrect","." + _content).bind("click",callback);
	
	_content = "";
}


function removeLayer() {
	$(".layui-layer-page").remove();
	$(".layui-layer-shade").remove();
}
function removeAlert(){
	$(".popup_content_alert").remove();
}
function removePopupContent() {
	$(".popup_content").remove();
}

function addPopupContent() {
	var popupContent = $('<div class="popup_content "><form action="" method="post" class="zForm w375 pb26"><span class="login_tig mb8">验证身份</span><div class="login_border mb22 w375"><div class="login_border_left w250"></div><div class="login_border_right w125"></div></div><p class="sf red pl62 mb15">为了保障你的账户安全,请先帮助我们验证你的身份</p>	<div class="ovh"><label class="red2 fl mr5 special25">*</label><label class="w88 h35 sf tar mr16">验证方式:</label><label class="secrity_color sf"><input type="radio" class="hidden-input" name="" /><span class="your style about checkbox"></span> 手机验证</label></div><div class="sf ovh h35 mb13">	<span class="red2 fl mr5 special19">*</span><span class="fl w88 mr16 tar">原手机号码:</span><span class="mr10 fl six">1233333</span></div><div class=" mb13 w375 ovh"><label class="red2 fl mr5 special19">*</label><label class="fl sf w88 mr16 tar">手机效验码:</label><input type="text" class="checkcode_txt td2 mr8 w125" placeholder="请输入6校验码" /><span class="fl w120 h35 freeCode_bg  strong curp"></span></div><div class="checkcode mb44 w375"><label class="red2 fl mr5 special43">*</label><label class=" sf w88 mr16 tar">验证码:</label><input type="text" class="iTextWidth89 checkcode_txt mr4" /><div class="checkcode_pic mr8">验证码</div><span class="r40 fl">看不清换一张</span></div><div class="ovh w224 center"><div class="fl mr19"><input type="submit" class="iSubmit w102 h34 sEnter" value="" /></div><div class="fl"><input type="button" class="iSubmit w102 h34 sChannel" onclick="hidePop()"value="" /></div></div></form></div>');
	$("body").append(popupContent);
}

//取消事件冒泡
function stopEvent(event) {
	var e = arguments.callee.caller.arguments[0] || event;
	if (e && e.stopPropagation) {
		e.stopPropagation();
	} else if (window.event) {
		window.event.cancelBubble = true;
	}
}

//关闭弹窗
function hidePop(removePop) {
	stopEvent();
		$(".layui-layer-page").css("display", "none");
		$(".layui-layer-shade").css("display", "none");
		$("html").removeAttr("style");
//	$(".layui-layer-page").remove();
}

function showPass() {
	var len = $(".popup_content").length;
	if (len > 0) {
		removePopupContent();
		showLayer(410, "popup_content_pass");
	} else {
		showLayer(410, "popup_content_pass");
	}
	addPopupContent();
}

function delOneItem(_this){
	var nowDom=$(_this).attr("index");
	$("[gdata-recid="+nowDom+"]").remove();
	hidePop();
}
function center(dom){
	var BW=$(".layui-layer-page").width();
	var BH=$(".layui-layer-page").height();
	var WW=$(window).width();
	var WH=$(window).height();
	var PosW=(WW-BW)/2;
}
