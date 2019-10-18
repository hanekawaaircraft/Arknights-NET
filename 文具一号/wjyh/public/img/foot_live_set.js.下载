$(function(){
    $.post("./mMDefault-ajaxCookiePross.html", "n=live800", function (html) {
        if(html == 0){
            var i = 0;
            var t = setInterval(function(){
                if($("link[href='../views/mall/style/sidebar.css']").length > 0 ){
                    if($('.popup_bg').css('display')=='none' && ($('.pop-cover').length<1 || $('.pop-cover').css('display') == 'none')){                   
                        i++;                   
                        if(i>5){
                            $('.mui-mbar-tab-live800').css({'background-color':'rgb(73, 73, 73)'});
                            $('.sidebar_hover_bg53').fadeIn(500);
                            $.post("./mMDefault-ajaxCookiePross.html", "n=live800&v=1&t=2592000", function (html) {}, "html");
                            clearInterval(t);

                            i = 0;
                            var t2 = setInterval(function(){
                                i++;
                                if(i>3){
                                    $('.mui-mbar-tab-live800').css({'background-color':'rgb(0, 0, 0)'});
                                    $('.sidebar_hover_bg53').fadeOut(500);
                                    clearInterval(t2);
                                }
                            },1000);
                        }
                    }
                }                
            },1000);
        }
    }, "html");

    $.get("./mMDefault-buyAgainPopup.html", "", function(data){
        if (data == 1) {
            $("#cover").show();
        }
    });

    $(".r-btn,.l-btn,.close-btn").click(function(){
        if ($(".not_tip").attr('checked')) {
            $.get("./mMDefault-cancelAgainPopup.html", "", function(data){
                
            });
        }
        if ($(this).hasClass("l-btn")) {
            window.location.href = "bBMember-myGoodsLibrary.html&buy_status=bought";
        } else {
            $("#cover").hide();
        }
    });

});
function open_live(){
    var l,t;
    l = window.screen.width/2-400;
    t = window.screen.height/2-300;
    window.open('http://chat16.live800.com/live800/chatClient/chatbox.jsp?companyID=1141792&configID=152433&jid=2542307342', 'chatbox8155', 'toolbar=0,scrollbars=0,location=0,statusbar=0,menubar=0,resizable=1,left='+l+',top='+t+',width=800,height=540');
}