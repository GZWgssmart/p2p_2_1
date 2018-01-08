//标的详情
function getDetail(obj){
    if($(obj).hasClass('active')){
        return;
    };
    $('.em-line').animate({'left':'40px'},500);
    $('.sub-a-box').hide();
    $(obj).addClass('active').siblings().removeClass('active');
    $('#project').show();
}
//获取相关文件
function getFile(obj){
    if($(obj).hasClass('active')){
        return;
    };
    $('.em-line').animate({'left':'160px'},500);
    $('.sub-a-box').hide();
    $(obj).addClass('active').siblings().removeClass('active');
    $('#files').show();
}

function dangger(obj){
    if($(obj).hasClass('active')){
        return;
    };
    if($('.plan').is(':visible')){
        $('.em-line').animate({'left':'520px'},500);
    }else{
        $('.em-line').animate({'left':'400px'},500);
    }

    $('.sub-a-box').hide();
    $(obj).addClass('active').siblings().removeClass('active');
    $('#tips').show();
}