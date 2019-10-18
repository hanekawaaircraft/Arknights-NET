!function(){
	function sidebarClick(jqDom){
		jqDom.click(function(event){
			var len=$(".sidebar_hover_bg_login").length;
			//登录状态
			if(len>0){
				$(".hover_hook").removeClass("now");
				$(".hover_hook_cart").removeClass("active"); 
				var selfclass=$(".hover_hook_cart").attr("class");
				var flag=selfclass.search(/active/);
				if(flag!= -1){
					$(".hover_hook_cart").css("background-color","#000").find(".wjyhui_tab_crat_num").removeClass("togg_bg");
				}
				//订单
				if(len>0){
					if($(this).siblings(".sidebar_hover_bg_login").css("display")=='none'){
			 			$(this).siblings(".sidebar_hover_bg_login").css("display","block");
			 			$(".sidebar_favirate_detail,.sidebar_foot_detail,.sidebar_brand_detail,.sidebar_hover_feedback,.sidebar_cart_detail").css("display","none");
			 		}else{
			 			$(this).siblings(".sidebar_hover_bg_login").css("display","none");
			 		}					
					if(!$(this).hasClass('not_show')){
						$(".hover_hook").css("background-color","#000");
						$(this).addClass("now").children(".sidebar_hover_bg_login").show();
						$(this).children(".sidebar_hover_bg").hide();
					}					
					$(".hover_hook_cart").css("background-color","#000").find(".wjyhui_tab_crat_num").removeClass("togg_bg");
				}else{
					$(this).css("background-color","#C40000");
				}
				//收藏
			 	if($(".sidebar_favirate_detail").length!=0){
//			 		有数据
			 		if($(this).siblings(".sidebar_favirate_detail").css("display")=='none'){
//						$(this).css("background-color","#C40000");
			 			$(this).siblings(".sidebar_favirate_detail").css("display","block");
//						$(".sidebar_hover_bg_login,.sidebar_foot_detail,.sidebar_brand_detail,.sidebar_hover_feedback,.sidebar_cart_detail").css("display","none");
			 		}else{
			 			$(this).siblings(".sidebar_favirate_detail").css("display","none");
			 		}
				}else if(!$(this).hasClass('not_show')){
					$(this).css("background-color","#C40000");
				}
			}else{
				// showLayer(420,"popup_content_start_buy");
				// $(".layui-layer-shade").css("z-index","9999");
			}
		})
	}
	function sideBarShow(jqDom){
		jqDom.mouseenter(function(){
			//全状态
			var selfclass=$(this).attr("class");
			var flag=selfclass.search(/now/);
			if(flag== -1){//没now
				$(this).css("background-color","#494949").children(".sidebar_hover_bg").show();
			}else{
				// 有 now
//				$(this).css("background-color","#494949").children(".sidebar_hover_bg,.two_code_hover_bg").show();
			}
		})
	}
	function sideBarHide(jqDom){
		jqDom.mouseleave(function(){
			var selfclass=$(this).attr("class");
			var flag=selfclass.search(/now/);
			if(flag== -1){//没now
				$(this).css("background-color","#000").children(".sidebar_hover_bg,.sidebar_hover_bg_special,.sidebar_hover_bg_login,.sidebar_favirate_detail,.sidebar_hover_feedback,.sidebar_brand_detail").hide();
			}else{
				$(this).css("background-color","#c40000").children(".sidebar_hover_bg").hide();
//				$(this).children(".sidebar_hover_feedback,.sidebar_brand_detail,.sidebar_hover_bg_login,.sidebar_favirate_detail,.sidebar_message_detail").hide();
			}
		})
	}
	
	function sideBarShowLogin(jqDom){
		jqDom.mouseenter(function(){
			$(this).css("background-color","#C40000").children(".sidebar_hover_bg_special,.sidebar_hover_bg_login,.sidebar_hover_feedback,.sidebar_foot_detail,.sidebar_brand_detail,.sidebar_favirate_detail ").show();
		})
	}
	//新的点击 两种状态：登录  未登录
	sidebarClick($(".hover_hook"));
	//触碰侧边栏
	sideBarShow($(".hover_hook"));
	sideBarHide($(".hover_hook"));
	
	//购物车
	$(".hover_hook_cart").mouseenter(function(){
		$(this).css("background-color","#C40000").find(".wjyhui_tab_crat_num").addClass("togg_bg");
		var len = $(".barcart").length;
	})
	
	$(".hover_hook_cart").mouseleave(function(){
		if($(this).attr("class").search(/active/)!=-1){
//			console.log("有")
			$(this).children(".sidebar_cart_detail").css("display","none");
			$(".hover_hook").css("background-color","#000")
		}else{//有
//			console.log("没有")
			$(this).css("background-color","#000").find(".wjyhui_tab_crat_num").removeClass("togg_bg");
		}
	})

	/*$(".sidebar_cart_detail").mouseleave(function(){
		$(this).hide();
	});*/
	$(document).click(function(){
		$('.sidebar_cart_detail').hide();
	});

	$('.sidebar_cart_detail').click(function(e){
		e.stopPropagation();
	});

	$(".hover_hook_cart").click(function(event){
		event.stopPropagation();
		var len=$(".sidebar_hover_bg_login").length;
		//登录状态
		if(len>0){
			resetDetailHeight();
			var cartLive=$(this).siblings(".sidebar_cart_detail");
			if(cartLive.css("display")=='none'){
				cartLive.css("display","block");

                var cartnum = parseInt($("#cartnum").html());
                if(cartnum == 0){
                    $('.scd_1_in').hide();
                    $('#submit-btn').hide();
                    $('.Clearing_btn').html('当前购物车空空如也，<br>快去挑选心仪的商品吧！').addClass("empty-css");
                }else{
                	 $('.Clearing_btn').removeClass("empty-css");
                }

				$(".sidebar_favirate_detail,.sidebar_hover_bg_login,.sidebar_brand_detail,.sidebar_hover_feedback,.sidebar_foot_detail").hide();
			}else{
				cartLive.css("display","none");
			}
			$(".hover_hook").removeClass("now");
			$(this).addClass("active");
			$(".hover_hook").css("background-color","#000");
		}else{
			// showLayer(420,"popup_content_start_buy");
			// $(".layui-layer-shade").css("z-index","9999");
		}
	})

	//触碰login
	$(".sidebar_hover_bg_special").mouseover(function(){
		$(this).show();
	})
	//取消事件冒泡
	function stopEvent(event) {
		var e = arguments.callee.caller.arguments[0] || event;
		if (e && e.stopPropagation) {
			e.stopPropagation();
		} else if (window.event) {
			window.event.cancelBubble = true;
		}
	}
	
	$(".login_close").click(function(event){
		stopEvent(event);
		$(this).parents(".sidebar_hover_bg_special").css("display","none");
	})
	
	$(".wjyh_ui_backtop").click(function(){
	   	var speed=200;//滑动的速度
	    $('body,html').animate({ scrollTop: 0 }, speed);
	    return false;
	})

	//拉动
	$(".sidebar_login_hd b").click(function(event){
		stopEvent(event)
		var len=$(".sidebar_hover_bg_login").length;
			//登录状态
		if(len>0){
			$(this).parent().parent().css("display","none");
		}
	})
	
	//自适应高度
	function resetDetailHeight(){
		var W=$(window).height();
		$(".sidebar_cart_detail,.sidebar_foot_detail,.sidebar_favirate_detail,.sidebar_brand_detail,.mui-mbar-tabs-mask,.mui-mbar-tabs-narrow").css("height",W);
	}
	$(window).resize(function(){
		resetDetailHeight();
	})
	
	$(".wjyh_ui_twocode").mouseenter(function(){
		$(this).css("background-color","#C40000").children(".two_code_hover_bg").show();
	})
	$(".wjyh_ui_twocode").mouseleave(function(){
		$(this).css("background-color","#000").children(".two_code_hover_bg").hide();
	})
}()




























