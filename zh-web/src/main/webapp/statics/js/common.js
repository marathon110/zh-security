// 获取请求参数
// 使用示例
// location.href = http://localhost:8080/index.html?id=123
// T.p('id') --> 123;
var url = function(name) {
	var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
	var r = window.location.search.substr(1).match(reg);
	if(r!=null)return  unescape(r[2]); return null;
}

//根据url地址获取url后面的参数，转成json对象
urlToJson = function(url) {
    var obj = {};
    url.substring(url.indexOf('?') + 1)
        .replace(/[^\/]+/g, function(objstr) {
            var empty = false;
            objstr.replace(/([^\/&=]+)(=([^\/&=]+)?)?/g, function(s, a, b, c) {
                if(a && b && c){
                    obj[a] = c;
                }else if(a && !c){
                    obj[a] = '';
                }else{
                    empty = true;
                }
            });
        });
    return obj;
}


//全局配置,函数用于设置AJAX的全局默认设置
$.ajaxSetup({
	dataType: "json",
	cache: false,
	complete:function(XMLHttpRequest,textStatus){
        //拦截器实现超时跳转到登录页面
        // 通过xhr取得响应头
        var REDIRECT = XMLHttpRequest.getResponseHeader("REDIRECT");
        //如果响应头中包含 REDIRECT 则说明是拦截器返回的
        if (REDIRECT == "REDIRECT")
        {
            var win = window;
            while (win != win.top)
            {
                win = win.top;
            }
            //重新跳转到 login.html
            win.location.href = XMLHttpRequest.getResponseHeader("CONTENTPATH");
        }
		if(textStatus=="parsererror"){
            top.layer.open({
			  title: '系统提示',
			  area: '338px',
			  icon: 3,
			  move: false,
			  anim: -1,
			  isOutAnim: false,
			  content: '注：登录超时,请稍后重新登录.',
			  btn: ['立即退出'],
			  btnAlign: 'c',
			  yes: function(){
				  toUrl('../sys/logout?_' + $.now());
			  }
			});
			setTimeout(function(){
				toUrl('../sys/logout?_' + $.now());
			}, 2000);
        } else if(textStatus=="error"){
           dialogMsg("请求超时，请稍候重试...", "error");
        }
	}
})

//权限判断
function hasPermission(permission) {
    if(isNullOrEmpty(window.parent.perms)) {
    	return false;
    }
	if (window.parent.perms.indexOf(permission) > -1) {
        return true;
    } else {
        return false;
    }
}

toUrl = function(href) {
	window.location.href = href;
}

//公共bootstrapTable函数供其它调用
$.fn.bootstrapTableEx = function(opt){
	var defaults = {
		url: '',
		dataField: "rows",
		method: 'post',
		dataType: 'json',
		selectItemName: 'id',
		clickToSelect: true,
		pagination: true,
		smartDisplay: false,
		pageSize: 10,
		pageList: [10, 20, 30, 40, 50],
		paginationPreText: '上一页',
		paginationNextText: '下一页',
		sidePagination: 'server',
		queryParamsType : null,
		columns: []
	}
	var option = $.extend({}, defaults, opt);
	$(this).bootstrapTable(option);
}



formatDate = function (v, format) {
    if (!v) return "";
    var d = v;
    if (typeof v === 'string') {
        if (v.indexOf("/Date(") > -1)
            d = new Date(parseInt(v.replace("/Date(", "").replace(")/", ""), 10));
        else
            d = new Date(Date.parse(v.replace(/-/g, "/").replace("T", " ").split(".")[0]));//.split(".")[0] 用来处理出现毫秒的情况，截取掉.xxx，否则会出错
    }
    var o = {
        "M+": d.getMonth() + 1,
        "d+": d.getDate(),
        "h+": d.getHours(),
        "m+": d.getMinutes(),
        "s+": d.getSeconds(),
        "q+": Math.floor((d.getMonth() + 3) / 3),
        "S": d.getMilliseconds()
    };
    if (/(y+)/.test(format)) {
        format = format.replace(RegExp.$1, (d.getFullYear() + "").substr(4 - RegExp.$1.length));
    }
    for (var k in o) {
        if (new RegExp("(" + k + ")").test(format)) {
            format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k] : ("00" + o[k]).substr(("" + o[k]).length));
        }
    }
    return format;
}

function today() {
	var dd = new Date();
	return formatDate(dd, 'yyyy-MM-dd');
}

function countDay(dayCount) {
	var dd = new Date();
	dd.setDate(dd.getDate()+dayCount);//获取AddDayCount天后的日期
	var y = dd.getFullYear();
	var m = (dd.getMonth()+1)<10?"0"+(dd.getMonth()+1):(dd.getMonth()+1);//获取当前月份的日期，不足10补0
    var d = dd.getDate()<10?"0"+dd.getDate():dd.getDate();//获取当前几号，不足10补0
    return y+"-"+m+"-"+d;
}

function formatDayForZero(date) {
	var y = date.year;
	var m = (date.month)<10?"0"+(date.month):(date.month);//获取当前月份的日期，不足10补0
    var d = date.date<10?"0"+date.date:date.date;//获取当前几号，不足10补0
    return y+"-"+m+"-"+d;
}

//判断是空   为空true 非空false
isNullOrEmpty = function (obj) {
    if ((typeof (obj) == "string" && obj == "") || obj == null || obj == undefined) {
        return true;
    } else {
        return false;
    }
}

//判断不是空   为空false  非空true
isNotNullOrEmpty = function (obj) {
    if ((typeof (obj) == "string" && obj == "") || obj == null || obj == undefined) {
        return false;
    } else {
        return true;
    }
}

//判断字符串是否为json
isJSON = function (str) {
    if (typeof str == 'string') {
        try {
            var obj=JSON.parse(str);
            if(typeof obj == 'object' && obj ){
                return true;
            }else{
                return false;
            }

        } catch(e) {
            console.log('error：!!!'+e);
            return false;
        }
    }
    console.log('It is not a string!')
}

/*---------------------------------------
 * 清除字符串两端空格，包含换行符、制表符
 *---------------------------------------*/
String.prototype.trim = function () {
    return this.triml().trimr();
}

/*----------------------------------------
 * 清除字符串左侧空格，包含换行符、制表符
 * ---------------------------------------*/
String.prototype.triml = function () {
    return this.replace(/^[\s\n\t]+/g, "");
}

/*----------------------------------------
 * 清除字符串右侧空格，包含换行符、制表符
 *----------------------------------------*/
String.prototype.trimr = function () {
    return this.replace(/[\s\n\t]+$/g, "");
}

/*----------------------------------------
 * 清除字符串所有空格
 *----------------------------------------*/
String.prototype.trimAll = function () {
    return this.replace(/\s+/g, "");
}

checkedArray = function (id) {
    var isOK = true;
    if (id == undefined || id == "" || id == 'null' || id == 'undefined') {
        isOK = false;
        dialogMsg('您没有选中任何数据项！');
    }
    return isOK;
}



checkedRow = function (id) {
    var isOK = true;
    if (id == undefined || id == "" || id == 'null' || id == 'undefined') {
        isOK = false;
        dialogMsg('您没有选中任何数据项！');
    } else if (id.length > 1) {
        isOK = false;
        dialogMsg('您只能选择一条数据项！');
    }
    return isOK;
}


reload = function () {
    location.reload();
    return false;
}

isWindow = function() {
	var sUserAgent = navigator.userAgent.toLowerCase();
    var pc=sUserAgent.match(/windows/i) == "windows";
    return pc;
}

/*
 * 
 * $.extend
 * 
 * 它的含义是将src1,src2,src3...合并到dest中,
 * 返回值为合并后的dest,由此可以看出该方法合并后，
 * 是修改了dest的结构的。如果想要得到合并的结果却又不想修改dest的结构，可以如下使用：
 * var option=$.extend({},src1,src2,src3...)//也就是将"{}"作为dest参数。
 */
dialogOpen = function(opt){
	var defaults = {
		id : 'layerForm',
		title : '',
		width: '',
		height: '',
		url : null,
		scroll : false,
		offset: 'auto',//弹框位置 默认坐标，即垂直水平居中
		maxmin: false,//开启最大化最小化按钮
		shade : 0.3,//阴影
		shadeClose : false,//阴影关闭别处可以点击,默认关闭
		data : {},
		btn: ['确定', '取消'],
		success: function(){},
		yes: function(){},
		cancel: function(){}//点击X事件
	}
	if (!isWindow()){
		opt.width = '100%';
		opt.height = '80%';
	}
	var option = $.extend({}, defaults, opt), content = null;
	if(option.scroll){
		content = [option.url]
	}else{
		content = [option.url, 'no']//iframe的url，no代表不显示滚动条
	}
	top.layer.open({
	  	type : 2,
	  	id : option.id,
		title : option.title,
		closeBtn : 1,
		anim: -1,
		isOutAnim: false,
		shadeClose : false,
		shade : option.shade,
		shadeClose : option.shadeClose,
		area : [option.width, option.height],
		offset: option.offset,
		maxmin: option.maxmin,
		content : content,
		btn: option.btn,
		success: function(){
			option.success(option.id);
		},
		yes: function(){
			option.yes(option.id);
		},
		cancel : function() {
			return option.cancel(option.id);
		}
    });
}


dialogContent = function(opt){
	var defaults = {
		title : '系统窗口',
		width: '',
		height: '',
		content : null,
		data : {},
		btn: ['确定', '取消'],
		success: null,
		yes: null
	}
	if (!isWindow()){
		opt.width = '100%';
		opt.height = '80%';
	}
	var option = $.extend({}, defaults, opt);
	return top.layer.open({
	  	type : 1,
		title : option.title,
		closeBtn : 1,
		anim: -1,
		isOutAnim: false,
		shadeClose : false,
		shade : 0.3,
		area : [option.width, option.height],
		shift : 5,
		content : option.content,
		btn: option.btn,
		success: option.success,
		yes: option.yes
    });
}



dialogAjax = function(opt){
	var defaults = {
		title : '系统窗口',
		width: '',
		height: '',
		url : null,
		data : {},
		btn: ['确定', '取消'],
		success: null,
		yes: null
	}
	if (!isWindow()){
		opt.width = '100%';
		opt.height = '80%';
	}
	var option = $.extend({}, defaults, opt);
	$.post(option.url, null, function(content){
		layer.open({
		  	type : 1,
			title : option.title,
			closeBtn : 1,
			anim: -1,
			isOutAnim: false,
			shadeClose : false,
			shade : 0.3,
			area : [option.width, option.height],
			shift : 5,
			content : content,
			btn: option.btn,
			success: option.success,
			yes: option.yes
	    });
	});
}



dialogAlert = function (content, type) {
	var msgType = {
		success:1,
		error:2,
		warn:3,
		info:7
	};
	if(isNullOrEmpty(type)){
		type='info';
	}
	top.layer.alert(content, {
        icon: msgType[type],
        title: "系统提示",
        anim: -1,
        btnAlign: 'c',
		isOutAnim: false
    });
}




dialogConfirm = function (content, callBack) {
	top.layer.confirm(content, {
		area: '338px',
		icon: 7,
        anim: -1,
		isOutAnim: false,
        title: "系统提示",
        btn: ['确认', '取消'],
        btnAlign: 'c',
    	yes: callBack
    });
}


dialogMsg = function(msg, type) {
	var msgType = {
		success:1,
		error:2,
		warn:3,
		info:7
	};
	if(isNullOrEmpty(type)){
		type='info';
	}
	top.layer.msg(msg, {
		icon: msgType[type],
		time: 2000
	}); 
}


dialogClose = function() {
	var index = top.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
	top.layer.close(index); //再执行关闭 
}


dialogLoading = function(flag) {
	if(flag){
		top.layer.load(0, {
			shade: [0.1,'#fff'],
			time: 2000
		});
	}else{
		top.layer.closeAll('loading');
	}
}



$.fn.GetWebControls = function (keyValue) {
    var reVal = "";
    $(this).find('input,select,textarea').each(function (r) {
        var id = $(this).attr('id');
        var type = $(this).attr('type');
        switch (type) {
            case "checkbox":
                if ($("#" + id).is(":checked")) {
                    reVal += '"' + id + '"' + ':' + '"1",'
                } else {
                    reVal += '"' + id + '"' + ':' + '"0",'
                }
                break;
            default:
                var value = $("#" + id).val();
                if (value == "") {
                    value = "&nbsp;";
                }
                reVal += '"' + id + '"' + ':' + '"' + $.trim(value) + '",'
                break;
        }
    });
    reVal = reVal.substr(0, reVal.length - 1);
    if (!keyValue) {
        reVal = reVal.replace(/&nbsp;/g, '');
    }
    reVal = reVal.replace(/\\/g, '\\\\');
    reVal = reVal.replace(/\n/g, '\\n');
    var postdata = jQuery.parseJSON('{' + reVal + '}');
    return postdata;
};



$.fn.SetWebControls = function (data) {
    var $id = $(this)
    for (var key in data) {
        var id = $id.find('#' + key);
        if (id.attr('id')) {
            var type = id.attr('type');
            var value = $.trim(data[key]).replace(/&nbsp;/g, '');
            switch (type) {
                case "checkbox":
                    if (value == 1) {
                        id.attr("checked", 'checked');
                    } else {
                        id.removeAttr("checked");
                    }
                    break;
                default:
                    id.val(value);
                    break;
            }
        }
    }
}

tabiframeId = function () {
    var iframeId = top.$(".ZH_iframe:visible").attr("id");
    return iframeId;
}

$.currentIframe = function () {
    //return $(window.parent.document).contents().find('#main')[0].contentWindow;
	var tabId = tabiframeId();
	if(isNullOrEmpty(tabId)) {//单页iframe嵌套
		return $(window.parent.document).contents().find('#main')[0].contentWindow;
    }
    return $(window.parent.document).contents().find('#'+tabiframeId())[0].contentWindow;//多层tab页嵌套
}

$(document).ready(function(){  
	NProgress.configure({ showSpinner: false }); 
	NProgress.start();  
});  
$(window).load(function(){  
	NProgress.done();  
});  