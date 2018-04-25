package net.zhenghao.zh.wechat.handler.impl;

import net.zhenghao.zh.wechat.annotation.Message;
import net.zhenghao.zh.wechat.enums.EventType;
import net.zhenghao.zh.wechat.enums.MessageType;
import net.zhenghao.zh.wechat.handler.MessageHandler;
import net.zhenghao.zh.wechat.message.request.BaseRequestMessage;
import net.zhenghao.zh.wechat.message.response.BaseResponseMessage;
import org.springframework.stereotype.Component;

/**
 * 🙃
 * 🙃 自定义菜单跳转事件处理器
 * 🙃
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date :2018/4/24 11:25
 * CustomMenuClickEventHandler.java
 */
@Component
@Message(message = MessageType.EVENT, event = EventType.CUSTOM_MENU_VIEW)
public class CustomMenulViewEventHandler implements MessageHandler {

    @Override
    public BaseResponseMessage dealMessage(BaseRequestMessage requestMessage) {
        //点击跳转view事件，业务逻辑代码
        return null;
    }
}
