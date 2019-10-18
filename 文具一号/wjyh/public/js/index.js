$(function(){
    $("#byzq").on("click","li",function(){
        var $li=$(this);
        $li.children(":first-child").addClass("gift-first").parent().siblings().children(":first-child").removeClass("gift-first");
        
        var i=parseInt($li.attr("data-byzq"))
       
        $(`#gift${i}`).addClass("show").siblings().removeClass("show");
    })


    $("#gn-fr-dl").on("click","a",function(){
        var $a=$(this);
        $a.addClass("gonggao").siblings().removeClass("gonggao");
        var i=parseInt($a.attr("data-gonggao"));
        $(`#gn-fr-dl-${i}`).addClass("show").siblings().removeClass("show")
    })
    

})