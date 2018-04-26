package net.zhenghao.zh.wechat.handler.impl;

import net.zhenghao.zh.wechat.annotation.Message;
import net.zhenghao.zh.wechat.enums.MessageType;
import net.zhenghao.zh.wechat.handler.MessageHandler;
import net.zhenghao.zh.wechat.message.request.BaseRequestMessage;
import net.zhenghao.zh.wechat.message.request.LocationRequestMessage;
import net.zhenghao.zh.wechat.message.response.BaseResponseMessage;
import net.zhenghao.zh.wechat.utils.MessageUtils;
import org.springframework.stereotype.Component;

/**
 * 🙃
 * 🙃 地理位置消息处理器
 * 🙃
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date :2018/4/26 15:28
 * LocationMessageHandler.java
 */
@Component
@Message(message = MessageType.LOCATION)
public class LocationMessageHandler implements MessageHandler {
    @Override
    public BaseResponseMessage dealMessage(BaseRequestMessage requestMessage) {
        //地理位置消息业务逻辑
        LocationRequestMessage locationRequestMessage = (LocationRequestMessage) requestMessage;
        String content = String.format("您发送的地理位置消息如下：\nlabel:%s,\nlocation_x:%s,\nlocation_y:%s,\nscale:%s ",
                locationRequestMessage.getLabel(), locationRequestMessage.getLocation_X(),
                locationRequestMessage.getLocation_Y(), locationRequestMessage.getScale());
        return MessageUtils.buildTextResponseMessage(locationRequestMessage, content);
    }
}
