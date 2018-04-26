package net.zhenghao.zh.wechat.controller;

import net.zhenghao.zh.common.constant.SystemConstant;
import net.zhenghao.zh.common.utils.XMLUtils;
import net.zhenghao.zh.wechat.converter.MessageConvert;
import net.zhenghao.zh.wechat.core.MessageHandlerAdapter;
import net.zhenghao.zh.wechat.entity.MessageTypeEntity;
import net.zhenghao.zh.wechat.entity.WechatConfigEntity;
import net.zhenghao.zh.wechat.handler.MessageHandler;
import net.zhenghao.zh.wechat.message.request.BaseRequestMessage;
import net.zhenghao.zh.wechat.message.response.BaseResponseMessage;
import net.zhenghao.zh.wechat.service.WechatConfigService;
import net.zhenghao.zh.wechat.utils.MessageUtils;
import net.zhenghao.zh.wechat.utils.SignUtils;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;
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

    @Autowired
    private MessageConvert messageConvert;

    @Autowired
    private MessageHandlerAdapter messageHandlerAdapter;

    /**
     * 接收微信服务器的get请求
     * @param signature 微信加密签名，signature结合了开发者填写的token参数和请求中的timestamp参数、nonce参数。
     * @param timestamp 时间戳
     * @param nonce     随机数
     * @param echostr   随机字符串
     */
    @RequestMapping(method = RequestMethod.GET)
    public void doGet(@RequestParam(value = "signature") String signature,
                        @RequestParam(value = "timestamp") String timestamp,
                        @RequestParam(value = "nonce") String nonce,
                        @RequestParam(value = "echostr") String echostr,
                        HttpServletResponse response) {
        WechatConfigEntity config = (WechatConfigEntity) wechatConfigService.getWechatConfig().get(SystemConstant.DATA_ROWS);
        if (SignUtils.checkSignature(config.getToken(), signature, timestamp, nonce)) {
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

    /**
     * 接收微信服务器的post请求并响应
     */
    @RequestMapping(method = RequestMethod.POST, produces = "text/xml;charset=utf-8")
    public void doPost(HttpServletRequest request, HttpServletResponse response) {
        try {
            ServletInputStream inputStream = request.getInputStream();
            String xml = IOUtils.toString(inputStream, "UTF-8");
            System.out.println(xml);
            /** 解析xml数据 */
            String msgType = MessageUtils.getMessageType(xml);
            String eventType = MessageUtils.getEventType(xml);
            System.out.println(msgType);
            System.out.println(eventType);
            MessageTypeEntity messageTypeEntity = new MessageTypeEntity(msgType, eventType);
            BaseRequestMessage requestMessage = messageConvert.doConvert(xml, messageTypeEntity);
            MessageHandler messageHandler = messageHandlerAdapter.findMessageHandler(messageTypeEntity);
            BaseResponseMessage responseMessage = messageHandler.dealMessage(requestMessage);
            //构造给用户的响应消息
            String responseXml = XMLUtils.beanToXml(responseMessage);
            OutputStream os = response.getOutputStream();
            os.write(responseXml.getBytes("UTF-8"));
            os.flush();
            os.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
