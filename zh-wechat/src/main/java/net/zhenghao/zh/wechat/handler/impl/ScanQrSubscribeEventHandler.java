package net.zhenghao.zh.wechat.handler.impl;

import net.zhenghao.zh.wechat.handler.MessageHandler;
import net.zhenghao.zh.wechat.message.request.BaseRequestMessage;
import net.zhenghao.zh.wechat.message.request.ScanQrSubscribeEventRequestMessage;
import net.zhenghao.zh.wechat.message.response.BaseResponseMessage;

/**
 * 🙃
 * 🙃 带参数的二维码扫描处理器
 * 🙃 用户扫描带场景值二维码时,
 * 🙃    如果用户已经关注公众号，则微信会将带场景值扫描事件推送给开发者。
 * 🙃    如果用户还未关注公众号，则用户可以关注公众号，关注后微信会将带场景值关注事件推送给开发者。
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date :2018/4/27 10:35
 * ScanQrSubscribeEventHandler.java
 */
public class ScanQrSubscribeEventHandler implements MessageHandler {

    @Override
    public BaseResponseMessage dealMessage(BaseRequestMessage requestMessage) {
        //带参数的二维码扫描业务逻辑
        ScanQrSubscribeEventRequestMessage scanQrSubscribeEventRequestMessage = (ScanQrSubscribeEventRequestMessage) requestMessage;
        System.out.println(scanQrSubscribeEventRequestMessage.getEventKey());
        return null;
    }
}
