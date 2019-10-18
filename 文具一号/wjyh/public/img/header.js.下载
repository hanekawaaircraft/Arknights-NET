/**
 * Created with JetBrains WebStorm.
 * User: kxl
 * Date: 13-9-26
 * Time: 下午3:20
 */
//头部公用JS
$(function () {
    function hover(hoverObj, obj, cls) {
        var timer1;
        var timer2;
        hoverObj.hover(function () {
            clearTimeout(timer2);
            $(this).addClass(cls);
            obj.show();
        }, function () {
            timer1 = setTimeout(function () {
                hoverObj.removeClass(cls);
                obj.hide();
            }, 100)
        });
        obj.hover(function () {
            clearTimeout(timer1);
            hoverObj.addClass(cls);
            obj.show();
        }, function () {
            timer2 = setTimeout(function () {
                obj.hide();
                hoverObj.removeClass(cls)
            }, 100)

        })
    }

    hover($('.main-info'), $(".extra-info"), "hover");
///////适应不同屏幕分辨率支持窗口缩放
    var screen = window.screen.width;
    var win_w = $(window).width();

    function ltIE9() {
        if ($.browser.msie && ($.browser.version < "9.0")) {
            return true;
        }
    }//判断是否是IE 浏览器并且版本小于IE9；
    function sizeReset(media) {
        if (ltIE9() && media < 1190) {
            $("html").attr("id", "msie");
        }
    }

    sizeReset(screen);
    sizeReset(win_w);
    $(window).resize(winResize);
    function winResize() {
        var win = $(window).width();
        if (win < 1190 && ltIE9()) {
            $("html").attr("id", "msie");
        } else {
            if (ltIE9()) {
                $("html").attr("id", "");
            }
        }
    }

    /*$(".hd_tab").hover(function () {
     $(this).find("p").show();
     }, function () {
     $(this).find("p").hide();
     });
     $('.hd_tab').hover(function () {
     $(this).addClass("hover")
     }, function () {
     $(this).removeClass("hover");
     });*/
    /*搜索*/
    //首页搜索
    var $floatSearch=$("#float_search");
    if($floatSearch.length){
        var $floatSearchBtn=$("#btnSearchtrack");
        $floatSearchBtn.click(onSearchSubmit);//搜索表单提交
        $floatSearch.focus(onSearchFocus)
            .blur(onSearchBlur);
        $floatSearch.keyup(onSearchGoodsTips);//提示提交
    }
    var $form = $("#frmSearchGoods");
    var $searchInput = $('#search_ipt');
    var $searchBtn = $('#btnSearch');
    $searchBtn.click(onSearchSubmit);//搜索表单提交
    $searchInput.focus(onSearchFocus)
        .blur(onSearchBlur);
    $searchInput.keyup(onSearchGoodsTips);//提示提交
    $(document).on("mousedown", ".searchTips dd", onJumpGoodDetail);
    /*方法 函数*/
    function onJumpGoodDetail() {//点击搜索结果跳转
        window.location.href = $(this).attr("data-href");
    }

    function onSearchBlur() {
        if (!this.value) {
            $(this).val($(this).attr("data-default"));
        }
        if($floatSearch.length){//浮动的搜索
            if (!$floatSearch[0].value) {
                $floatSearch.val($floatSearch.attr("data-default"));
            }
        }
        $(".searchTips").hide(0);
    }

    function onSearchFocus() {
//        this.value = '';
//        if($floatSearch.length){//浮动的搜索
//            $floatSearch.val("");
//        }
    }

    function onSearchSubmit() {
        $('#frmSearchGoods').submit();
    }

    function onSearchGoodsTips() {
        var val = $(this).val();
        var $searchTips = $(".searchTips:first", $form);
        $searchTips.css({"width":"414px"});
        if($(this).attr("id")=="float_search"){
            $searchTips = $(".searchTips:last",$("#frmSearchtrack"));
            $searchTips.css({"width":$("#float_search").width()+8+"px"})
        }
        $searchTips.empty().hide(0);
        var host=$("body").attr("data-chaosite");
        $.get("/index.php", {app: "mall/MSearchGoods",act: "ajaxSearchGoods",keywords: val}, function (data) {
            if (data.status == 1) return false;
            var ddArr = [];
            var data = data.data;
            for (var i in data) {
                ddArr.push('<dd data-href="' + data[i]["href"] + '">' +
                    '<span class="goodname">' + data[i]["name"] + '</span>' +
                    '<span class="goodnum">约' + data[i]["num"] + '个结果</span>' +
                    '</dd>');
                if (ddArr.length >= 10) break;
            }
            if (ddArr.length < 1) return;
            $searchTips.empty().append(ddArr.join(""));
            $searchTips.show(0);
        }, "json")
    }


    $("#search_ipt").focus(function(){
        // if($(this).val() == "单笔满百元 即送好礼"){
        //     $(this).val("");
        // }
        $(this).prop({'placeholder':''});
    });
    $("#search_ipt").blur(function(){
        // if($(this).val() == ""){
        //     $(this).val("单笔满百元 即送好礼");
        // }
        if(index_keywords != ''){
            $(this).prop({'placeholder':index_keywords});
        }
    });
});