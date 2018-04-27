package net.zhenghao.zh.wechat.handler.impl;

import net.zhenghao.zh.wechat.annotation.Message;
import net.zhenghao.zh.wechat.enums.EventType;
import net.zhenghao.zh.wechat.enums.MessageType;
import net.zhenghao.zh.wechat.handler.MessageHandler;
import net.zhenghao.zh.wechat.message.request.BaseRequestMessage;
import net.zhenghao.zh.wechat.message.request.ScanCodePushEventRequestMessage;
import net.zhenghao.zh.wechat.message.response.BaseResponseMessage;
import net.zhenghao.zh.wechat.utils.MessageUtils;
import org.springframework.stereotype.Component;

/**
 * 🙃
 * 🙃 扫码推事件
 * 🙃
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date :2018/4/27 11:36
 * ScanCodePushEventHandler.java
 */
@Component
@Message(message = MessageType.EVENT, event = EventType.SCAN_CODE_PUSH)
public class ScanCodePushEventHandler implements MessageHandler {
    @Override
    public BaseResponseMessage dealMessage(BaseRequestMessage requestMessage) {
        //扫码推事件业务处理
        ScanCodePushEventRequestMessage scanCodeEventRequestMessage = (ScanCodePushEventRequestMessage) requestMessage;
        String content = String.format("您的扫描结果是:%s", scanCodeEventRequestMessage.getScanCodeInfo().getScanResult());
        return MessageUtils.buildTextResponseMessage(scanCodeEventRequestMessage, content);
    }
}
