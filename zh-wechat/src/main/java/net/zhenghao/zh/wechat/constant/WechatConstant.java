package net.zhenghao.zh.wechat.constant;

/**
 * 🙃
 * 🙃 微信常量
 * 🙃
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date :2018/4/17 15:57
 * WechatConstant.java
 */
public class WechatConstant {

    /**
     * 获取access_token的url
     */
    public static final String ACCESS_TOKEN_FETCH_URL = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=APPID&secret=APPSECRET";

    /**
     * 提交菜单
     */
    public static final String MENU_UPDATE_FETCH_URL = "https://api.weixin.qq.com/cgi-bin/menu/create?access_token=ACCESS_TOKEN";

    /**
     * 删除菜单
     */
    public static final String MENU_DELETE_FETCH_URL = "https://api.weixin.qq.com/cgi-bin/menu/delete?access_token=ACCESS_TOKEN";

    /**
     * 获取用户信息
     */
    public static final String USER_INFO_URL = "https://api.weixin.qq.com/cgi-bin/user/info?access_token=ACCESS_TOKEN&openid=OPENID&lang=LANG";

    /**
     * 网页授权
     * appid
     *      公众号的唯一标识
     * redirect_uri
     *      授权后重定向的回调链接地址， 请使用 urlEncode 对链接进行处理
     * response_type
     *      返回类型，请填写code
     * scope
     *      snsapi_base （不弹出授权页面，直接跳转，只能获取用户openid）
     *      snsapi_userinfo （弹出授权页面，可通过openid拿到昵称、性别、所在地。并且， 即使在未关注的情况下，只要用户授权，也能获取其信息 ）
     * state
     *      重定向后会带上state参数，开发者可以填写a-zA-Z0-9的参数值，最多128字节
     * #wechat_redirect
     *      无论直接打开还是做页面302重定向时候，必须带此参数
     *
     */
    public static final String AUTHORIZE_URL = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=APPID&redirect_uri=REDIRECT_URI&response_type=code&scope=SCOPE&state=STATE#wechat_redirect";

    /**
     * 通过code换取网页授权access_token
     */
    public static final String AUTHORIZE_ACCESS_TOKEN = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=APPID&secret=SECRET&code=CODE&grant_type=authorization_code";

    /**
     * 拉取用户信息(需scope为 snsapi_userinfo)
     * 如果网页授权作用域为snsapi_userinfo，则此时开发者可以通过access_token和openid拉取用户信息了。
     */
    public static final String AUTHORIZE_USER_INFO = "https://api.weixin.qq.com/sns/userinfo?access_token=ACCESS_TOKEN&openid=OPENID&lang=zh_CN";


    public static final String JSAPI_TICKET_FETCH_URL = "https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token=ACCESS_TOKEN&type=jsapi";
}
