var contentType = "application/x-www-form-urlencoded; charset=utf-8";
$(function(){
	//页面初始化
	utils.initPage();
	hashChange();
});

function hashChange(){
	var hash = location.hash.replace('#','');
	$('.sub-nav li').removeClass('active');
	$('a[href="#'+hash+'"]').parent('li').addClass('active');
	switch(hash){
		case 'common':
			initCommon();
			break;
		case 'contract':
			initContract();
			break;
		case 'noun':
			initNoun();
			break;
		default : initProduct();$('a[href="#product"]').parent('li').addClass('active');
		break;
	};
}

/*产品介绍*/
function initProduct(){
	$.ajax({
	    url: 'product.html',
	    type: "get",
	    dataType: "html",
	    contentType:contentType,
	    success: function (data) {
	    	$('.account-right').empty();
	    	$('.account-right').html(data);
	    	$('.content').hide().eq(0).show();
	    	$('.sub-a-nav a').click(function(){
	    		if($(this).hasClass('active')){
	    			return;
	    		}
	    		var index = $(this).index();
	    		$('.em-line').animate({'left':index*120+'px'},500);
	    		$(this).addClass('active').siblings('a').removeClass('active');
	    		$('.content').hide().eq(index).show();
	    	})
	    }
	});
}

/*常见问题*/
function initCommon(){
	$.ajax({
	    url: 'common.html',
	    type: "get",
	    dataType: "html",
	    contentType:contentType,
	    success: function (data) {
	    	$('.account-right').empty();
	    	$('.account-right').html(data);
	    	$('.content').hide().eq(0).show();
	    	$('.content .text-que').click(function(){
	    		$(this).next('.text-ans').slideToggle();
	    	});
	    	$('.sub-a-nav a').click(function(){
	    		if($(this).hasClass('active')){
	    			return;
	    		}
	    		var index = $(this).index();
	    		$('.em-line').animate({'left':index*120+'px'},500);
	    		$(this).addClass('active').siblings('a').removeClass('active');
	    		$('.content').hide().eq(index).show();
	    	})
	    }
	});
}
/*合同范本*/
function initContract(){
	$.ajax({
	    url: 'contract.html',
	    type: "get",
	    dataType: "html",
	    contentType:contentType,
	    success: function (data) {
	    	$('.account-right').empty();
	    	$('.account-right').html(data);
	    	$('.content').hide().eq(0).show();
	    	$("img.lazy").lazyload({effect: "fadeIn"});
	    	$('.sub-a-nav a').click(function(){
	    		if($(this).hasClass('active')){
	    			return;
	    		}
	    		var index = $(this).index();
	    		$('.em-line').animate({'left':index*120+'px'},500);
	    		$(this).addClass('active').siblings('a').removeClass('active');
	    		$('.content').hide().eq(index).show();
	    	})
	    }
	});
}

/*名词解释*/
function initNoun(){
	$.ajax({
	    url: 'nonu.html',
	    type: "get",
	    dataType: "html",
	    contentType:contentType,
	    success: function (data) {
	    	$('.account-right').empty();
	    	$('.account-right').html(data);
	    	$('.nonu-list a').click(function(){
	    		if($(this).hasClass('active')){
	    			return;
	    		}
	    		var index = $(this).index();
	    		$(this).addClass('active').siblings('a').removeClass('active');
	    		$('.nonu-list-answer p').eq(index).show().siblings('p').hide();
	    	})
	    }
	});
}