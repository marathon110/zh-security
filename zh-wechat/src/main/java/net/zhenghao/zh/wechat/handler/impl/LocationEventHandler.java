package net.zhenghao.zh.wechat.handler.impl;

import net.zhenghao.zh.wechat.annotation.Message;
import net.zhenghao.zh.wechat.enums.EventType;
import net.zhenghao.zh.wechat.enums.MessageType;
import net.zhenghao.zh.wechat.handler.MessageHandler;
import net.zhenghao.zh.wechat.message.request.BaseRequestMessage;
import net.zhenghao.zh.wechat.message.request.LocationEventRequestMessage;
import net.zhenghao.zh.wechat.message.response.BaseResponseMessage;
import org.springframework.stereotype.Component;

/**
 * 🙃
 * 🙃 上报地理位置事件处理器
 * 🙃
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date :2018/4/27 14:01
 * LocationEventHandler.java
 */
@Component
@Message(message = MessageType.EVENT, event = EventType.LOCATION)
public class LocationEventHandler implements MessageHandler {
    @Override
    public BaseResponseMessage dealMessage(BaseRequestMessage requestMessage) {
        //上报地理位置事件业务逻辑
        LocationEventRequestMessage locationEventRequestMessage = (LocationEventRequestMessage) requestMessage;
        return null;
    }
}
