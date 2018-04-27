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
 * 🙃 拍照或相册发图事件推送处理器
 * 🙃
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date :2018/4/27 15:29
 * PhotoOrAlbumMenuEventHandler.java
 */
@Component
@Message(message = MessageType.EVENT, event = EventType.PIC_PHOTO_OR_ALBUM)
public class PhotoOrAlbumMenuEventHandler implements MessageHandler {
    @Override
    public BaseResponseMessage dealMessage(BaseRequestMessage requestMessage) {
        //拍照或相册发图事件推送业务逻辑
        return null;
    }
}
