/**
 *  微信网页授权js
 *
 * */
var jwt = store.get('jwt');//获取本地jwt
var openid = store.get('openid');//获取本地openid
var redirect_url = store.get('redirect_url');//获取本地redirect_url

$(function(){

    //如果本地没有jwt,则说明没有登录过
    if(isNullOrEmpty(jwt)) {

        //如果本地没有openid,则说明没有授权过
        if(isNullOrEmpty(openid)) {
            //授权
            wechat_auth();
        } else {
            //有openid则说明授权过,则登录
            wechat_login();
        }
    }

    store.set('redirect_url', window.location.href);
});

//通过ajax请求后台，让后台请求微信授权页
wechat_auth = function() {
    window.location.href = "../wechat/web/redirectUrl";
}

//通过ajax请求后台登录
wechat_login = function() {
    $.ajax({
        type : "POST",
        url : "../wechat/web/login",
        data : {},
        cache: false,
        async: false,  // 与js同步
        dataType:"json",
        success:function(response){
            console.log(response);
        }
    });
}