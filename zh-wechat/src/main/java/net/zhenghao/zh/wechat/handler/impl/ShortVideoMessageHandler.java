package net.zhenghao.zh.wechat.handler.impl;

import net.zhenghao.zh.wechat.annotation.Message;
import net.zhenghao.zh.wechat.enums.MessageType;
import net.zhenghao.zh.wechat.handler.MessageHandler;
import net.zhenghao.zh.wechat.message.request.BaseRequestMessage;
import net.zhenghao.zh.wechat.message.request.ShortVideoRequestMessage;
import net.zhenghao.zh.wechat.message.response.BaseResponseMessage;
import net.zhenghao.zh.wechat.message.response.Video;
import net.zhenghao.zh.wechat.utils.MessageUtils;
import org.springframework.stereotype.Component;

/**
 * 🙃
 * 🙃 短视频消息处理器
 * 🙃
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date :2018/4/25 15:29
 * ShortVideoMessageHandler.java
 */
@Component
@Message(message = MessageType.SHORT_VIDEO)
public class ShortVideoMessageHandler implements MessageHandler {
    @Override
    public BaseResponseMessage dealMessage(BaseRequestMessage requestMessage) {
        //短视频消息业务逻辑
        ShortVideoRequestMessage shortVideoRequestMessage = (ShortVideoRequestMessage) requestMessage;
        Video video = new Video();
        video.setMediaId(shortVideoRequestMessage.getMediaId());
        return MessageUtils.buildVideoResponseMessage(shortVideoRequestMessage, video);
    }
}
