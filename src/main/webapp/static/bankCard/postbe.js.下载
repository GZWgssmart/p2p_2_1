var postbeData;
var postbeUrl;

var Browsers ;
//var Browsers = detect.parse(navigator.userAgent);

function supportUnload() {
   /* if(Browsers.device.type && Browsers.device.type.indexOf("tablet")>-1  //Tablet
      ){
        return false;
    }

    if(Browsers.device.type && Browsers.device.type.indexOf("mobile")>-1  //Mobile
        ){
        return false;
    }*/
    return true;
}

function makeMd5() {
    var md5str = ($.md5(
        postbeData.version
            + postbeData.app_client
            + postbeData.app_platform
            + ""
            + postbeData.function_id
            + ""
            + postbeData.datetime
            + postbeData.uid
            + "chinapnr_postbe"
    ));

    postbeData.checkvalue = md5str;
}

//专为ie9-ie11获取版本
function getBrowserInfo() {
	var agent = navigator.userAgent.toLowerCase();
	var regStr_ie = /msie [\d.]+;/gi;
		// IE
	if (agent.indexOf("msie") > 0) {
		return agent.match(regStr_ie);
	}
	//IE11
	if (agent.indexOf("rv") > 0) {
		return "IE11.0";
	}
	
    return "";
}

function initPostbeData(ipaddr,version,function_id,uid,mer_id,user_no,url,appClient,strArray){
    Browsers = new UserAgents(navigator.userAgent);
    postbeUrl= url;
   /* var Browsers = detect.parse(navigator.userAgent);*/

    /*var app_platform = (Browsers.device.type)
        +"_"+ (Browsers.os.family)
        +"_"+ (Browsers.os.version);

    var model = (Browsers.device.family);
    var channel = (Browsers.browser.family)
        +"_"+(Browsers.browser.version);*/


   /*var Browsers = new UserAgents(navigator.userAgent);*/
   var app_platform = (Browsers.device.type ? Browsers.device.type : '')
        +"_"+ (Browsers.os.name ? Browsers.os.name : '')
        +"_"+ (Browsers.os.version ? Browsers.os.version.toString() : '');
    var model = (Browsers.device.model ? Browsers.device.model : '');
    var channel = (Browsers.browser.name ? Browsers.browser.name : 'Other')
        +"_"+(Browsers.browser.version ? Browsers.browser.version.toString() : '');
    if(channel=="Other_"){
	    var browser = getBrowserInfo() ;
	    if(browser=="IE11.0"){
	    	channel=browser;
	    }else if(browser!=''&& browser!=null) {
	    	 var verinfo = (browser+"").replace(/[^0-9.]/ig,""); 
	    	 channel="IE"+verinfo;
	    }
   }
   
    var inTime = new Date().format("yyyy-MM-dd hh:mm:ss");

    postbeData = {
        act:"postbe"
        ,ipaddr:ipaddr
        ,version:version
        ,app_client:appClient
        ,app_platform:app_platform
        ,function_id:function_id
        ,datetime:inTime
        ,uid:uid
        ,model:model
        ,channel:channel
        ,mer_id:mer_id
        ,user_no:user_no
        ,str_array:strArray
        ,checkvalue:""
    };

    makeMd5();
}
//sendPostbe方法不用了
/*function sendPostbe(outtime) {
    var asyncFlag =false;
    if(outtime==null){
        postbeData.str_array = new Date().format("yyyy-MM-dd hh:mm:ss");
    }else{
        postbeData.str_array = outtime;
        asyncFlag =true;
    }
    try {
        var toSendUrl = postbeUrl
               +"?callback=success_jsonpCallback"
            +"&act="+encodeURIComponent(postbeData.act)
            +"&ipaddr="+encodeURIComponent(postbeData.ipaddr)
            +"&version="+encodeURIComponent(postbeData.version)
                +"&app_client="+encodeURIComponent(postbeData.app_client)
                +"&app_platform="+encodeURIComponent(postbeData.app_platform)
                +"&function_id="+encodeURIComponent(postbeData.function_id)
                +"&datetime="+encodeURIComponent(postbeData.datetime)
                +"&uid="+encodeURIComponent(postbeData.uid)
                +"&model="+encodeURIComponent(postbeData.model)
                +"&channel="+encodeURIComponent(postbeData.channel)
                +"&mer_id="+encodeURIComponent(postbeData.mer_id)
                +"&user_no="+encodeURIComponent(postbeData.user_no)
                +"&str_array="+encodeURIComponent(postbeData.str_array)
                +"&checkvalue="+encodeURIComponent(postbeData.checkvalue)
            ;
        if(Browsers.browser.name && Browsers.browser.name.indexOf("Internet Explorer")>-1){
        //if(Browsers.browser.name && Browsers.browser.name.indexOf("IE")>-1){
            //if ie
            var xdr = new XDomainRequest();
            xdr.onload = function (e) {
                var data = $.parseJSON(xdr.responseText);
                if (data == null || typeof (data) == 'undefined') {
                    data = $.parseJSON(data.firstChild.textContent);
                }
                //success
            };
            xdr.onerror = function (e) {
                //error
            }
            xdr.open("GET", toSendUrl,asyncFlag);
            xdr.send();
        }else{
            $.ajax({
                type: "POST",
                url: toSendUrl,
                cache: false,
                async: asyncFlag,
                timeout:1000*3,
                complete: function (msg) {
                    console.log(msg);
                }
            });
        }
        
//        dataType: 'jsonp',
//            crossDomain: true,



    } catch (e) {
        console.log(e);
    }

}*/

var hadsend =false;
function smartSend() {
    if (!hadsend) {
        sendPostbe();
        hadsend = true;
    }
}



Date.prototype.format = function(format){
    var o = {
        "M+" : this.getMonth()+1, //month
        "d+" : this.getDate(), //day
        "h+" : this.getHours(), //hour
        "m+" : this.getMinutes(), //minute
        "s+" : this.getSeconds(), //second
        "q+" : Math.floor((this.getMonth()+3)/3), //quarter
        "S" : this.getMilliseconds() //millisecond
    }

    if(/(y+)/.test(format)) {
        format = format.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));
    }

    for(var k in o) {
        if(new RegExp("("+ k +")").test(format)) {
            format = format.replace(RegExp.$1, RegExp.$1.length==1 ? o[k] : ("00"+ o[k]).substr((""+ o[k]).length));
        }
    }
    return format;

}

//内部发送postbe PTPBC-1134
function javaSendUrl(url){
	 try {
		var data={"callback":"success_jsonpCallback","act":postbeData.act,"ipaddr":postbeData.ipaddr,"version":postbeData.version,
				"app_client":postbeData.app_client,"app_platform":postbeData.app_platform,"function_id":postbeData.function_id,
				"datetime":postbeData.datetime,"uid":postbeData.uid,"model":postbeData.model,"channel":postbeData.channel,
				"mer_id":postbeData.mer_id,"user_no":postbeData.user_no,"str_array":postbeData.str_array,
				"checkvalue":postbeData.checkvalue};
		$.ajax({
			 type: "POST",
	         url: url,
	         data:data,
	         cache: false,
	         async: true,
	         dataType: 'json',
	         timeout:1000*3,
	         complete: function (msg) {
	             //console.log(msg);
	         }
		});
	 } catch (e) {
	        console.log(e);
	    }
	
	}