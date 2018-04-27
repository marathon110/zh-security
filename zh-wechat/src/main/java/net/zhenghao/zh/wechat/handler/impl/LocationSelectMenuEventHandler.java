package net.zhenghao.zh.wechat.handler.impl;

import net.zhenghao.zh.wechat.annotation.Message;
import net.zhenghao.zh.wechat.enums.EventType;
import net.zhenghao.zh.wechat.enums.MessageType;
import net.zhenghao.zh.wechat.handler.MessageHandler;
import net.zhenghao.zh.wechat.message.request.BaseRequestMessage;
import net.zhenghao.zh.wechat.message.request.LocationSelectMenuEventRequestMessage;
import net.zhenghao.zh.wechat.message.response.BaseResponseMessage;
import net.zhenghao.zh.wechat.utils.MessageUtils;
import org.springframework.stereotype.Component;

/**
 * 🙃
 * 🙃 点击菜单选择位置发送事件处理器
 * 🙃
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date :2018/4/27 14:25
 * LocationSelectMenuEventHandler.java
 */
@Component
@Message(message = MessageType.EVENT, event = EventType.LOCATION_SELECT)
public class LocationSelectMenuEventHandler implements MessageHandler {
    @Override
    public BaseResponseMessage dealMessage(BaseRequestMessage requestMessage) {
        //点击菜单选择位置发送事件业务逻辑
        LocationSelectMenuEventRequestMessage locationSelectMenuEventRequestMessage = (LocationSelectMenuEventRequestMessage) requestMessage;
        return MessageUtils.buildTextResponseMessage(locationSelectMenuEventRequestMessage, "您点击了[发送位置按钮]");
    }
}
