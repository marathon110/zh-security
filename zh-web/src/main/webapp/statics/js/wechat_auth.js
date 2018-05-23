/**
 *  微信网页授权js
 *
 * */
$(function(){
    var token = store.get('token');//获取本地jwt
    var openid = store.get('openid');//获取本地openid
    var redirect_url = store.get('redirect_url');//获取本地redirect_url


    //如果本地没有jwt,则说明没有登录过
    if(isNullOrEmpty(token)) {
        //如果本地没有openid,则说明没有授权过
        if(isNullOrEmpty(openid)) {
            //授权
            wechat_auth();
        } else {
            //有openid则说明授权过,则登录
            wechat_login(openid);
        }
    }

    //store.set('redirect_url', window.location.href);
});

//通过ajax请求后台，让后台请求微信授权页
wechat_auth = function() {
    window.location.href = "../wechat/auth/redirectUrl";
}

//通过ajax请求后台登录
wechat_login = function(openid) {
    $.ajax({
        type : "POST",
        url : "../wechat/auth/login",
        data : {openid : openid},
        cache: false,
        async: false,  // 与js同步
        dataType:"json",
        success:function(response){
            if(response.code == 0) {
                store.set('openid', openid);
                store.set('token', response.token);
                //如果本地没有jwt,则说明没有登录过
                if(isNullOrEmpty(redirect_url)) {
                    //为空就定向到主页
                    window.location.href = path_index;
                } else {
                    window.location.href = redirect_url;
                }
            } else {
                window.location.href = path_auth;
            }
        }
    });
}