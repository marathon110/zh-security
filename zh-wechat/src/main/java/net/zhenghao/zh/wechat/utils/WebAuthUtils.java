package net.zhenghao.zh.wechat.utils;

import net.zhenghao.zh.common.entity.R;
import net.zhenghao.zh.common.utils.HttpClientUtils;
import net.zhenghao.zh.common.utils.JSONUtils;
import net.zhenghao.zh.wechat.constant.WechatConstant;
import net.zhenghao.zh.wechat.entity.WechatAuthWebEntity;
import net.zhenghao.zh.wechat.entity.WechatConfigEntity;
import net.zhenghao.zh.wechat.entity.WechatUserEntity;
import org.apache.commons.lang.StringUtils;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

/**
 * 🙃
 * 🙃 微信网页授权工具类
 * 🙃
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date :2018/5/21 14:18
 * WebAuthUtils.java
 */
public class WebAuthUtils {

    /**
     * 根据配置信息获取微信授权页面地址
     * @param wechatConfig
     * @return
     * @throws UnsupportedEncodingException
     */
    public static String getRedirectUrl(WechatConfigEntity wechatConfig) throws UnsupportedEncodingException {
        String redirect_uri = "";
        if (StringUtils.isNotBlank(wechatConfig.getRedirectUri())) {
            String backUrl = wechatConfig.getRedirectUri() + "/wechat/web/userInfo";  //拼接微信回调地址
            redirect_uri = java.net.URLEncoder.encode(backUrl, "utf-8");
            String oauth2Url = WechatConstant.AUTHORIZE_URL
                    .replaceAll("APPID", wechatConfig.getAppId()).replaceAll("REDIRECT_URI", redirect_uri)
                    .replaceAll("SCOPE", "snsapi_userinfo");
            return oauth2Url;
        } else {
            //这里写入报错后需要跳转的前端页面地址和错误信息
            redirect_uri = wechatConfig.getRedirectUri() + "/wechat_web/error.html?code=500&msg=未在后台配置回调域名";
        }
        return redirect_uri;
    }

    /**
     * 微信回调授权取得code获取用户信息
     * @param wechatConfig
     * @param code
     * @return
     * @throws IOException
     */
    public static WechatUserEntity getUserInfo(WechatConfigEntity wechatConfig, String code) throws IOException {
        //通过code换取网页授权access_token
        if (StringUtils.isNotBlank(code)) {
            // 替换字符串，获得请求access token URL
            String oauth2_access_token_url = WechatConstant.AUTHORIZE_ACCESS_TOKEN
                    .replaceAll("APPID", wechatConfig.getAppId()).replaceAll("SECRET", wechatConfig.getAppsecret())
                    .replaceAll("CODE", code);

            // 通过https方式请求获得web_access_token
            String response = HttpClientUtils.sendGet(oauth2_access_token_url, null, null);

            WechatAuthWebEntity wechatAuthWebEntity = (WechatAuthWebEntity) JSONUtils.jsonToBean(response, new WechatAuthWebEntity());

            if (null != wechatAuthWebEntity) {
                String WebAccessToken = wechatAuthWebEntity.getAccess_token();
                String openId = wechatAuthWebEntity.getOpenid();

                // 替换字符串，获得请求access token URL
                String oauth2_user_info_url = WechatConstant.AUTHORIZE_USER_INFO
                        .replaceAll("ACCESS_TOKEN", WebAccessToken).replaceAll("OPENID", openId);

                // 通过https方式请求获得用户信息响应
                String response_user_info = HttpClientUtils.sendGet(oauth2_user_info_url, null, null);

                WechatUserEntity wechatUserEntity = (WechatUserEntity) JSONUtils.jsonToBean(response_user_info, new WechatUserEntity());
                return wechatUserEntity;
            }
        }
        return null;
    }


}
