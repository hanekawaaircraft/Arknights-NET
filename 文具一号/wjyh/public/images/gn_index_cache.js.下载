$(function () {
	function getBannerTimeout(){
		var tempTime=$("#t",".DB_tab25").val();
		var bannerRollTime=parseInt(tempTime)*1000;
		return bannerRollTime;
	}
	
	
    /*Banner切换*/
    $('.DB_tab25').DB_tabMotionBanner({
        key: 'b28551',
        autoRollingTime: getBannerTimeout(),
        bgSpeed: 500,
        motion: { end: null }
    });

    $("#divHideTop").hide();
    $(window).scroll(function () {
        var $windowST = $(window).scrollTop();
        /*头部浮动搜索栏显示*/
        if ($windowST > 768) {
            $("#divHideTop").show();
        } else {
            $("#divHideTop").hide();
        }

        /*左边浮动显示*/
        if ($windowST > 550) {
            $("#float_louc_box").hide();
        } else {
            $("#float_louc_box").hide();
        }

        var loucList = $('#gn_main .w1190 .floor1[id^=louc]');
        if ($windowST < $('#gn_main').offset().top + $('#gn_main').height()) {//-loucList.eq(-1).height()
            for (var i = 0; i < loucList.length; i++) {
                if ($windowST > loucList.eq(i).offset().top - loucList.eq(i).height()) {
                    $('#float_louc_box>a').removeClass('hover').eq(i).addClass('hover');
                } else {
                    $('#float_louc_box>a').eq(i).removeClass('hover');
                }
            }
        } else {
            $('#float_louc_box>a').removeClass('hover');
        }
        /*左边浮动显示end */
    });

    //loadloucgg();//加载楼层

    /*商品分类显示效果*/
    // $("#nav .tit").slide({
    //     type: "menu",
    //     titCell: ".mod_cate",
    //     targetCell: ".mod_subcate",
    //     delayTime: 0,
    //     triggerTime: 10,
    //     defaultPlay: false,
    //     returnDefault: true
    // });
    
    $(document).on("mouseenter",".mod_cate",function(e){  
        this.className = 'mod_cate on';
    });
    $(document).on("mouseleave",".mod_cate",function(e){ 
        this.className = 'mod_cate';
    });



	$("#float_louc_box a").click(function () {
		$("html, body").animate({'scrollTop': $('#' + $(this).attr('loucid')).offset().top - 100}, 320);
	});

});




/*楼层左侧广告切换*/
function qh($this) {
    var sWidth = $this.width(); //获取焦点图的宽度（显示面积）
    var len = $("ul li", $this).length; //获取焦点图个数
    var index = 0;
    var picTimer;

    //以下代码添加数字按钮和按钮后的半透明条，还有上一页、下一页两个按钮
    var btn = "<div class='btn'>";
    for (var i = 0; i < len; i++) {
        btn += "<span></span>";
    }
    btn += "</div>";
    $this.append(btn);

    //为小按钮添加鼠标滑入事件，以显示相应的内容
    $(".btn span", $this).css("opacity", 0.4).mouseenter(function () {
        index = $(this).parents('.btn').find('span').index(this);
        showPics(index);
    }).eq(0).trigger("mouseenter");

    //本例为左右滚动，即所有li元素都是在同一排向左浮动，所以这里需要计算出外围ul元素的宽度
    $("ul", $this).css("width", sWidth * (len));

    //鼠标滑上焦点图时停止自动播放，滑出时开始自动播放
    $this.hover(function () {
        clearInterval(picTimer);
    },function () {
        picTimer = setInterval(function () {
            showPics(index);
            index++;
            if (index == len) {
                index = 0;
            }
        }, 4000); //此4000代表自动播放的间隔，单位：毫秒
    }).trigger("mouseleave");

    //显示图片函数，根据接收的index值显示相应的内容
    function showPics(index) { //普通切换
        var nowLeft = -index * sWidth; //根据index值计算ul元素的left值
        $("ul", $this).stop(true, false).animate({"left": nowLeft}, 300); //通过animate()调整ul元素滚动到计算出的position
        //$("#focus .btn span").removeClass("on").eq(index).addClass("on"); //为当前的按钮切换到选中的效果
        $(".btn span", $this).stop(true, false).animate({"opacity": "0.4"}, 300).eq(index).stop(true, false).animate({"opacity": "1"}, 300); //为当前的按钮切换到选中的效果
    }
}

qh($('#louc1 .focus'));//实现广告切换
qh($('#louc2 .focus'));//实现广告切换
qh($('#louc3 .focus'));//实现广告切换
qh($('#louc4 .focus'));//实现广告切换
qh($('#louc5 .focus'));//实现广告切换
qh($('#louc6 .focus'));//实现广告切换
qh($('#louc7 .focus'));//实现广告切换

//$('img').lazyload({ placeholder: "views/mall/images/grey.gif", effect: showeffect, failurelimit: 10 });//图片延后加载