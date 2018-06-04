package net.zhenghao.zh.wechat.controller;

import net.zhenghao.zh.common.entity.R;
import net.zhenghao.zh.wechat.service.WechatUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

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
@RequestMapping("/wechat/web/user")
public class WechatWebUserController {

    @Autowired
    private WechatUserService wechatUserService;

    @RequestMapping("/info")
    @ResponseBody
    public R info(HttpServletRequest request) {
        String openid = request.getAttribute("openid").toString();
        System.out.println("controller == openid=>" + openid);
        return wechatUserService.getWechatUserByOpenId(openid);
    }
}
