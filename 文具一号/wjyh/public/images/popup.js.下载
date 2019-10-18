$(function(){
    //$('body').append('<link rel="stylesheet" href="./views/mall/style/popup.css"/>');
    //$('body').append('<div class="popup_bg" style="display:none;"><div class="popup_m"><div><img src="/static/popup/popupimage.jpg" /></div><div class="money">1000</div><div class="close"></div></div></div>');

    $.ajax({
        url : "./bBMember-ajaxPopup.html",
        type : 'post',
        data : "r=lipin",//{"r": 'lipin'},
        dataType : 'json',
        async : false,
        success : function(json){            
            if(json.err === 0 && json.data.on == 1 && json.data.cont > 0){                  
                $('body').append('<link rel="stylesheet" type="text/css" href="/views/member/style/lpq.css" />');
                $('body').append('<div class="popup_bg"></div>');
                $('.popup_bg').load('bBMember-cardLpq.html',function(){
                    $('.popup_bg').css('display','block');

                    if(window.location.href.indexOf('bBMember-my_card.html') > -1){
                        //我的礼品券页面只显示3秒
                        var i = 0;
                        var t = setInterval(function(){
                            i++;
                            if(i>3){
                                clearInterval(t);
                                $('.popup_bg').hide();                            
                            }                     
                        },1000);

                    }else if(json.data.not_close == 0){
                        var i = 0;
                        var t = setInterval(function(){
                            i++;
                            if(i>json.data.time){
                                clearInterval(t);
                                $('.popup_bg').hide();                            
                            }                     
                        },1000);
                    }

                    $('.popup_bg .close').click(function(){
                        $('.popup_bg').hide();
                    });
                });
            }
        }
    });

    $.getScript("/views/member/scripts/jquery.cookie.js")
    .done(function() {
        if($.cookie('reg_popup')==1){
            regData();            
        }
    }).fail(function() {
        //console.log('fail1');
    });

    function regData(){
        $.ajax({
            url : "./bBMember-ajaxPopup.html",
            type : 'post',
            data : "r=reg",
            dataType : 'json',
            async : false,
            success : function(json){            
                if(json.err === 0 && json.data.isshow == 1 ){
                    $.cookie('reg_popup', '', { expires: -3600 });
                    $('body').append('<link rel="stylesheet" type="text/css" href="/views/mall/style/popup.css" />');
                    $('body').append('<div class="popup_bg reg_popup" style="display:none;"><div class="popup_m" style="padding:10px;"><div class="reg-title">恭喜您注册成功！</div><div class="reg-content">'+json.data.content+'</div><div><a href="'+json.data.url+'"><img src="/'+json.data.img+'" /></a></div><div class="close">X</div></div></div>');
                    $('.reg_popup').css('display','block');

                    if(json.data.not_close == 0){
                        var i = 0;
                        var t = setInterval(function(){
                            i++;
                            if(i>json.data.time){
                                clearInterval(t);
                                $('.reg_popup').hide();                            
                            }                     
                        },1000);
                    }
                    
                    $('.reg_popup .close').click(function(){
                        $('.reg_popup').hide();
                    });
                }
            }
        });
    }

    
    
    //$('.popup_bg').css('display','block');
   

    // $.ajax({
    //     url : "./bBMember-ajaxPopup.html",
    //     type : 'post',
    //     data : "r=lipin",//{"r": 'lipin'},
    //     dataType : 'json',
    //     async : false,
    //     success : function(json){            
    //         if(json.err === 0 && json.data.on == 1 && json.data.cont > 0){
    //             updatePopup(json.data.qid);
    //             $('.popup_bg .popup_m img').attr({'src':json.data.image});
    //             $('.popup_bg .popup_m .money').css({'top':json.data.pt+'px','left':json.data.pl+'px','color':json.data.color}).text(json.data.cont);
    //             $('.popup_bg').css({'display':'block'});               
    //             if(json.data.not_close == 0){
    //                 var i = 0;
    //                 var t = setInterval(function(){
    //                     i++;
    //                     if(i>json.data.time){
    //                         clearInterval(t);
    //                         $('.popup_bg').hide();                            
    //                     }                     
    //                 },1000);
    //             }
    //         }
    //     }
    // });

    

    // function updatePopup(id){
    //     $.post("./bBMember-ajaxUpdatePopup.html",{"id": id}, function (html) {
    //         //console.log(html);
    //     }, "html");
    // }


});
