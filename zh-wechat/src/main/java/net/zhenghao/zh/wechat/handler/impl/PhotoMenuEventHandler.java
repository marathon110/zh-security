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
 * 🙃 系统拍照发图事件推送处理器
 * 🙃
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date :2018/4/27 15:31
 * PhotoMenuEventHandler.java
 */
@Component
@Message(message = MessageType.EVENT, event = EventType.PIC_SYS_PHOTO)
public class PhotoMenuEventHandler implements MessageHandler {
    @Override
    public BaseResponseMessage dealMessage(BaseRequestMessage requestMessage) {
        //系统拍照发图事件推送业务逻辑
        return null;
    }
}
