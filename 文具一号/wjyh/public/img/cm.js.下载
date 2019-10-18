$(function(){
    //$('body').append('<link rel="stylesheet" href="./views/mall/style/popup.css"/>');
    //$('body').append('<div class="popup_bg" style="display:none;"><div class="popup_m"><div><img src="/static/popup/popupimage.jpg" /></div><div class="money">1000</div><div class="close"></div></div></div>');

    $.ajax({
        url : "./bBMember-ajaxCityManage.html",
        type : 'post',
        data : "r=cm",
        async : false,
        success : function(html){            
            if(html == 1){
				$("#gn_nav ul li a[title='帮买人']").parent().remove();
				//$('.gn_wjSlogan').html('');
				//$('.gn_buycar p').html('');
            }
        }
    });

});
