package net.zhenghao.zh.wechat.controller;

import net.zhenghao.zh.common.entity.R;
import net.zhenghao.zh.common.utils.HttpClientUtils;
import net.zhenghao.zh.common.utils.JSONUtils;
import net.zhenghao.zh.wechat.constant.WechatConstant;
import net.zhenghao.zh.wechat.entity.JsapiTicketEntity;
import net.zhenghao.zh.wechat.entity.WechatAuthWebEntity;
import net.zhenghao.zh.wechat.entity.WechatConfigEntity;
import net.zhenghao.zh.wechat.entity.WechatUserEntity;
import net.zhenghao.zh.wechat.service.WechatConfigService;
import net.zhenghao.zh.wechat.service.WechatUserService;
import net.zhenghao.zh.wechat.utils.JsapiTicketUtils;
import net.zhenghao.zh.wechat.utils.SignUtils;
import net.zhenghao.zh.wechat.utils.WebAuthUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

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
@RequestMapping("/wechat/auth")
public class WechatAuthWebController {

    private static final String js_noncestr = "zhaozhenghao";//jssdk随机字符串

    @Autowired
    private WechatConfigService wechatConfigService;

    @Autowired
    private WechatUserService wechatUserService;

    @RequestMapping("/redirectUrl")
    public void authorizedLoginUrl(HttpServletResponse response) throws IOException {
        WechatConfigEntity wechatConfig = (WechatConfigEntity) wechatConfigService.getWechatConfig().get("rows");
        //重定向到微信授权页
        response.sendRedirect(WebAuthUtils.getRedirectUrl(wechatConfig));
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
    public ModelAndView getWechatAuthorizedUser(
            HttpServletResponse response,
            @RequestParam(name = "code") String code,
            @RequestParam(name = "state") String state) throws IOException {
        WechatConfigEntity wechatConfig = (WechatConfigEntity) wechatConfigService.getWechatConfig().get("rows");
        WechatUserEntity wechatUser = WebAuthUtils.getUserInfo(wechatConfig, code);
        wechatUserService.saveOrupdateWechatUserAuth(wechatUser);
        ModelAndView mv = new ModelAndView();
        mv.addObject("openid", wechatUser.getOpenid());
        mv.setViewName("/wechat_web/auth.html");
        return mv;
    }


    @RequestMapping("/login")
    @ResponseBody
    public R login(@RequestParam(name = "openid") String openid) {
        return wechatUserService.wechatLogin(openid);
    }

    @RequestMapping("/jssdk")
    @ResponseBody
    public Map<String, String> jssdk(@RequestParam(name = "url") String url) throws UnsupportedEncodingException {
        url = URLDecoder.decode(url, "UTF-8");
        JsapiTicketEntity jsapiTicketEntity = JsapiTicketUtils.getJsapiTicket();
        Map<String ,String> params = new HashMap<>(4);
        params.put("noncestr", js_noncestr);
        params.put("jsapi_ticket", jsapiTicketEntity.getTicket());
        params.put("timestamp", SignUtils.getSecondTimestampTwo(new Date()) + "");
        params.put("url", url);
        String signature = SignUtils.getJssdkSignature(params);
        params.remove("jsapi_ticket");
        params.remove("url");
        params.put("signature", signature);
        WechatConfigEntity wechatConfig = (WechatConfigEntity) wechatConfigService.getWechatConfig().get("rows");
        params.put("appId", wechatConfig.getAppId());
        return params;
    }
}
