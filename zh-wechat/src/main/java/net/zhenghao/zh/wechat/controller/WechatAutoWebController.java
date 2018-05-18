package net.zhenghao.zh.wechat.controller;

import net.zhenghao.zh.common.utils.HttpClientUtils;
import net.zhenghao.zh.common.utils.JSONUtils;
import net.zhenghao.zh.wechat.constant.WechatConstant;
import net.zhenghao.zh.wechat.entity.WechatAuthUserEntity;
import net.zhenghao.zh.wechat.entity.WechatAuthWebEntity;
import net.zhenghao.zh.wechat.entity.WechatConfigEntity;
import net.zhenghao.zh.wechat.service.WechatConfigService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

/**
 * 🙃
 * 🙃 微信网页授权
 * 🙃
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date :2018/5/17 16:50
 * WechatAutoWebController.java
 */
@Controller
@RequestMapping("/wechat/web")
public class WechatAutoWebController {

    @Autowired
    private WechatConfigService wechatConfigService;

    @ResponseBody
    @RequestMapping("/redirectUrl")
    public String authorizedLoginUrl(){

        WechatConfigEntity wechatConfig = (WechatConfigEntity) wechatConfigService.getWechatConfig().get("rows");

        String redirect_uri = "";

        try {
            String backUrl ="http://tony.3w.dkys.org/zh-security/wechat/web/userInfo";  //拼接微信回调地址
            redirect_uri = java.net.URLEncoder.encode(backUrl, "utf-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        String oauth2Url = WechatConstant.AUTHORIZE_URL
                .replaceAll("APPID", wechatConfig.getAppId()).replaceAll("REDIRECT_URI", redirect_uri)
                .replaceAll("SCOPE", "snsapi_userinfo");

        return oauth2Url;
    }

    /**
     * 获取用户授权<br/>
     *
     * @param code
     *      微信授权之后返回的code
     * @param state
     *      微信授权之后返回的state
     * @return 授权用户信息
     */
    @GetMapping("/userInfo")
    @ResponseBody
    public WechatAuthUserEntity getWechatAuthorizedUser(
            @RequestParam(name = "code") String code, @RequestParam(name = "state") String state) throws IOException {

        System.out.println("name=>" + code);
        System.out.println("state=>" + state);

        WechatConfigEntity wechatConfig = (WechatConfigEntity) wechatConfigService.getWechatConfig().get("rows");

        // 2. 通过code换取网页授权access_token
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
                System.out.println("WebAccessToken=>" + WebAccessToken);
                System.out.println("openId=>" + openId);

                // 替换字符串，获得请求access token URL
                String oauth2_user_info_url = WechatConstant.AUTHORIZE_USER_INFO
                        .replaceAll("ACCESS_TOKEN", WebAccessToken).replaceAll("OPENID", openId);

                // 通过https方式请求获得用户信息响应
                String response_user_info = HttpClientUtils.sendGet(oauth2_user_info_url, null, null);

                WechatAuthUserEntity wechatAuthUserEntity = (WechatAuthUserEntity) JSONUtils.jsonToBean(response, new WechatAuthUserEntity());
                return wechatAuthUserEntity;
            }
        }

        return null;
    }
}
