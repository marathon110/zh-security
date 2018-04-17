package net.zhenghao.zh.wechat.controller;

import net.zhenghao.zh.common.constant.SystemConstant;
import net.zhenghao.zh.wechat.entity.AccessTokenEntity;
import net.zhenghao.zh.wechat.entity.WechatConfigEntity;
import net.zhenghao.zh.wechat.service.WechatConfigService;
import net.zhenghao.zh.wechat.utils.AccessTokenUtil;
import net.zhenghao.zh.wechat.utils.SignUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;

/**
 * 🙃
 * 🙃 微信消息处理器的入口
 * 🙃
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date :2018/4/17 11:19
 * WechatController.java
 */
@RestController
@RequestMapping(value = "/wechat")
public class WechatController {

    @Autowired
    private WechatConfigService wechatConfigService;

    /**
     * 接收微信服务器的get请求
     * @param signature 微信加密签名，signature结合了开发者填写的token参数和请求中的timestamp参数、nonce参数。
     * @param timestamp 时间戳
     * @param nonce     随机数
     * @param echostr   随机字符串
     * @return
     */
    @RequestMapping(method = RequestMethod.GET)
    public void doGet(@RequestParam(value = "signature") String signature,
                        @RequestParam(value = "timestamp") String timestamp,
                        @RequestParam(value = "nonce") String nonce,
                        @RequestParam(value = "echostr") String echostr,
                        HttpServletResponse response) {
        WechatConfigEntity config = (WechatConfigEntity) wechatConfigService.getWechatConfig().get(SystemConstant.DATA_ROWS);
        if (SignUtil.checkSignature(config.getToken(), signature, timestamp, nonce)) {
            OutputStream os = null;
            try {
                os = response.getOutputStream();
                os.write(echostr.getBytes("UTF-8"));
                os.flush();
                os.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    @RequestMapping("/test")
    public AccessTokenEntity test(){
        System.out.println("hhah");
        AccessTokenEntity accessTokenEntity = AccessTokenUtil.getAccessToken();
        return accessTokenEntity;
    }
}
