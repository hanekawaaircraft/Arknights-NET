; (function($) {
    $.fn.extend({
        PicPlay: function(setting) {
            var setting = setting || {};
            var config = {
                pic: ".pic",
                num: ".num",
                txt: ".txt",
                prev: ".prev",
                next: ".next",
                cursor: true,
                type: 1,  //默认横向切换
                time: 1000,
                speed: 800
            };
            var opt = $.extend(config, setting);
            // var panel =  this.length ? this : $(".picPanel");
            $(this).each(function() {
                var t = $(this),
                    pic = $(opt.pic, t),
                    num = $(opt.num, t),
                    txt = $(opt.txt, t),
                    prev = $(opt.prev, t),
                    next = $(opt.next, t),
//                    cursor = opt.cursor,
                    cn = "curr",
                    time = opt.time,
                    speed = opt.speed,
                    type = opt.type,
                    curIndex = 0,
                    timer = 0;
                var picList = $("ul", pic),
                    picItem = $("li", pic),
                    Item_len = picItem.length,
                    Item_w = picItem.outerWidth(true),
                    Item_h = picItem.outerHeight(true),
                    numItem = $("li", num),
                    txtItem = $("li", txt);
                var flash = {
                    setStyle: function() {
                        switch (type) {
                            case 2:
                                picList.css({
                                    position:
                                        "absolute",
                                    "height": Item_h * (Item_len + 1)
                                });
                                break;
                            case 3:
                                picItem.css({
                                    "position":"absolute",
                                    "z-index": 0,
                                    "opacity": 0
                                });
                                picItem.eq(0).css({
                                    "z-index": 1,
                                    "opacity": 1
                                });
                                break;
                            default:
                                picList.css({
                                    position:"absolute",
                                    "width": Item_w * (Item_len + 1)
                                });
                                picItem.css({
                                    "float": "left"
                                });
                        }
                    },
                    setNum: function() {
                        var ht = "";
                        for (var i = 1; i < Item_len + 1; i++) {
                            ht += "<li>•</li>";
                        }
                        num.append("<ul>" + ht + "</ul>");
                        numItem = $("li", num);
                        numItem.eq(0).addClass(cn);
                    },
                    play: function() {
                        switch (type) {
                            case 2:
                                picList.stop(true, false).animate({
                                        top: -curIndex * Item_h
                                    },
                                    speed);
                                break;
                            case 3:
                                picItem.eq(curIndex).stop().animate({
                                        "opacity": 1
                                    },
                                    1000).css('z-index',1).siblings().stop().animate({
                                        "opacity": 0
                                    },
                                    500).css('z-index',0);
                                break;
                            default:
                                picList.stop(true, false).animate({
                                        left: -curIndex * Item_w
                                    },
                                    speed);
                        }
                        numItem.removeClass(cn).eq(curIndex).addClass(cn);
                        txt.length && txtItem.eq(curIndex).show().siblings().hide();

                    },
                    clickAction: function() {
                        next.click(function() {
                            curIndex++;
                            if (curIndex == Item_len) {
                                flash.playLast(curIndex);
                                curIndex = 0;
                            } else {
                                flash.play();
                            }
                        });
                        prev.click(function() {
                            curIndex--;
                            if (curIndex == -1) {
                                flash.playFirst(curIndex);
                                curIndex = Item_len - 1;
                            } else {
                                flash.play();
                            }
                        });
                    },
                    playLast: function() {
                        switch (type) {
                            case 2:
                                picItem.first().css({
                                    "top":
                                        Item_h * Item_len,
                                    "position": "relative"
                                });
                                picList.stop().animate({
                                        "top": -Item_h * Item_len
                                    },
                                    800,
                                    function() {
                                        picList.css({
                                            "top": 0
                                        });
                                        picItem.first().css({
                                            "top": 0
                                        });
                                    });
                                break;
                            case 3:
                                picItem.eq(0).animate({
                                        "opacity": 1
                                    },
                                    1500).css("z-index",1).siblings().animate({
                                        "opacity": 0
                                    },
                                    1000).css("z-index",0);
                                break;
                            default:
                                picItem.first().css({
                                    "left":
                                        Item_w * Item_len,
                                    "position": "relative"
                                });
                                picList.stop().animate({
                                        "left": -Item_w * Item_len
                                    },
                                    800,
                                    function() {
                                        picList.css({
                                            "left": 0
                                        });
                                        picItem.first().css({
                                            "left": 0
                                        });
                                    });
                        }
                        numItem.eq(0).addClass(cn).siblings().removeClass(cn);
                    },
                    playFirst: function() {
                        switch (type) {
                            case 2:
                                picItem.last().css({
                                    "top":
                                        -Item_h * Item_len,
                                    "position": "relative"
                                });
                                picList.stop().animate({
                                        "top": Item_h
                                    },
                                    800,
                                    function() {
                                        picList.css({
                                            "top": -Item_h * (Item_len - 1)
                                        });
                                        picItem.last().css({
                                            "top": 0
                                        });
                                    });
                                break;
                            case 3:
                                picItem.eq(Item_len - 1).animate({
                                        "z-index": 1,
                                        "opacity": 1
                                    },
                                    1500).siblings().animate({
                                        "z-index": 0,
                                        "opacity": 0
                                    },
                                    1000);
                                break;
                            default:
                                picItem.last().css({
                                    "left":
                                        -Item_w * Item_len,
                                    "position": "relative"
                                });
                                picList.stop().animate({
                                        "left": Item_w
                                    },
                                    800,
                                    function() {
                                        picList.css({
                                            "left": -Item_w * (Item_len - 1)
                                        });
                                        picItem.last().css({
                                            "left": 0
                                        });
                                    });
                        }
                        numItem.eq(Item_len - 1).addClass(cn).siblings().removeClass(cn);
                    },

                    start: function() {
                        timer = Item_len && setInterval(function() {
                                curIndex++;
                                if (curIndex == Item_len) {
                                    flash.playLast(curIndex);
                                    curIndex = 0;
                                } else {
                                    flash.play();
                                }
                            },
                            time);
                    },
                    stop: function() {
                        clearInterval(timer);
                    }
                };
                flash.setStyle();
                flash.clickAction();
                pic.length && num.length && flash.setNum();
                flash.start();
                num.delegate("li", 'mouseover',
                    function() {
                        flash.stop();
                        curIndex = numItem.index($(this));
                        flash.play();
                    });
                t.hover(function() {
                        flash.stop();
                    },
                    function() {
                        flash.start();
                    });
            });
            return $(this);
        }
    });
})(jQuery);