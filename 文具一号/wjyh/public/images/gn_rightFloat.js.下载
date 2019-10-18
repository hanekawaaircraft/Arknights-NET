$(window).load(function () {
    $(window).scroll(function () {
        var $windowST = $(window).scrollTop();
        /*右边浮动显示*/
        if ($windowST > 450) {
            $(".float_box").fadeIn();
        } else {
            $(".float_box").hide();
        }
    });

    /*右边浮动返回顶部按钮*/
    $('.float_box .backTop').click(function () {
        $("html, body").animate({'scrollTop': 0}, 320);
    });

   //右边浮动事件
    var $showDiv = $('.quick_links_pop');
    $anshow('.gbook_fk', $('.quick_leave_message'));
    $anshow('.kf', $('.quick_my_qlinks'));
   /* $('.float_box').on('click.quick_links', function (e) {
        e.stopPropagation();
    });*/
    function $anshow(an, $show) {
        $('.float_box ' + an).on('click', function (e) {
            if ($show.is(':hidden')) {
                $(document).unbind('click.quick_links').one('click.quick_links', function () {
//                    $showDiv.hide();
                });
                $showDiv.not($show).hide();
                $show.show();
                $("#validate_code_img_id_1").attr("src","./?app=mall/MDefault&act=verification&"+(new Date()).getTime());

            } else {
                $showDiv.hide();
            }
            return false;
        });
    }

    //$('img').lazyload({ placeholder: "views/mall/images/grey.gif", effect: showeffect,  failurelimit: 10 });//图片延后加载
});

function getValidateCode() {
    $('#token_txt').val("");
    $('#token_txt').focus();
    var validateCodeUrl = 'index.php?app=mall/MDefault&act=verification&t=' + Math.random();
    $('#validate_code_img_id_1').attr('src', validateCodeUrl);
    return;
}
//在线反馈 begin
var $feedbackForm = $("#feedbackForm");
var feedback = {
    $type: $("input[name=type]", $feedbackForm),
    $msg: $("textarea[name=msg]", $feedbackForm),
    $token_txt: $("input[name=token_txt]", $feedbackForm),
    flag1: true,
    flag2: true
};
feedback.$msg.blur(validate);
feedback.$token_txt.blur(validate);

function feedbackSubmit() {
    var type = $("input[name='type']:checked").val();
    var msg = $("#msg").val();
    var token_txt = $("#token_txt").val();
    if (msg == '' || msg == '客服你好，我想问一下...') {
        $('#err_txt').show();
        $('#err_txt').html('请填写反馈内容！');
        return false;
    }
    if (token_txt == '') {
        //反馈事件
//        $('#token_txt').bind('blur',function(){if(this.value=='') $('#code_txt').show(); else $('#code_txt').hide(); });
        $('#err_txt').show();
        $('#err_txt').html('请输入验证码！');
        return false;
    }
    else {
        $.get('index.php?app=mall/MDefault&act=getCode', {}, function (data) {
            if (data != token_txt.toLowerCase()) {
                $('#err_txt').show();
                $('#err_txt').html('输入验证码不正确！');
                return false;
            }
            else {
                // 提交表单
                function checkSub()
                {
                    $.post('index.php?app=mall/MDefault&act=onlineFeedback', {"type": type,"msg":msg}, function (data) {
                        if (data == 1) {
                            alert('提交成功');
                            $(".sidebar_hover_feedback").fadeOut(0);
							$("#msg").val('');
							$("#token_txt").val('');
                        }else{
                            alert('提交失败');
                        }
                    })
                }

                $.post('index.php?app=mall/MDefault&act=checkSensitiveWord', {"msg":msg}, function (data) {
                    if (data == 1) {
                        alert("内容中含有敏感词");
                    }
                    else
                    {
                        checkSub();
                    }
                })
            }
        })
    }
}

function validate() {
    $('#err_txt').show();
    $('#err_txt').html('');
}