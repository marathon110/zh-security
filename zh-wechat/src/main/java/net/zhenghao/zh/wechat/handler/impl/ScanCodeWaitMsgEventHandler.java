package net.zhenghao.zh.wechat.handler.impl;

import net.zhenghao.zh.wechat.annotation.Message;
import net.zhenghao.zh.wechat.enums.EventType;
import net.zhenghao.zh.wechat.enums.MessageType;
import net.zhenghao.zh.wechat.handler.MessageHandler;
import net.zhenghao.zh.wechat.message.request.BaseRequestMessage;
import net.zhenghao.zh.wechat.message.request.ScanCodeEventRequestMessage;
import net.zhenghao.zh.wechat.message.response.BaseResponseMessage;
import net.zhenghao.zh.wechat.utils.MessageUtils;
import org.springframework.stereotype.Component;

/**
 * 🙃
 * 🙃 扫码带提示事件处理器
 * 🙃
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date :2018/4/27 11:31
 * ScanCodeWaitMsgEventHandler.java
 */
@Component
@Message(message = MessageType.EVENT, event = EventType.SCAN_CODE_WAIT_MSG)
public class ScanCodeWaitMsgEventHandler implements MessageHandler {
    @Override
    public BaseResponseMessage dealMessage(BaseRequestMessage requestMessage) {
        //扫码带提示事件业务处理
        ScanCodeEventRequestMessage scanCodeEventRequestMessage = (ScanCodeEventRequestMessage) requestMessage;
        String content = String.format("您的扫描结果是:%s", scanCodeEventRequestMessage.getScanCodeInfo().getScanResult());
        return MessageUtils.buildTextResponseMessage(scanCodeEventRequestMessage, content);
    }
}
