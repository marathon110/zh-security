package net.zhenghao.zh.wechat.handler.impl;

import net.zhenghao.zh.wechat.annotation.Message;
import net.zhenghao.zh.wechat.enums.EventType;
import net.zhenghao.zh.wechat.enums.MessageType;
import net.zhenghao.zh.wechat.handler.MessageHandler;
import net.zhenghao.zh.wechat.message.request.BaseRequestMessage;
import net.zhenghao.zh.wechat.message.request.UnsubscribeEventRequestMessage;
import net.zhenghao.zh.wechat.message.response.BaseResponseMessage;
import org.springframework.stereotype.Component;

/**
 * 🙃
 * 🙃 取消关注事件处理器
 * 🙃
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date :2018/4/27 10:02
 * UnsubscribeEventHandler.java
 */
@Component
@Message(message = MessageType.EVENT, event = EventType.UNSUBSCRIBE)
public class UnsubscribeEventHandler implements MessageHandler {
    @Override
    public BaseResponseMessage dealMessage(BaseRequestMessage requestMessage) {
        //取消关注事件业务逻辑
        UnsubscribeEventRequestMessage unsubscribeEventRequestMessage = (UnsubscribeEventRequestMessage) requestMessage;
        return null;
    }
}
