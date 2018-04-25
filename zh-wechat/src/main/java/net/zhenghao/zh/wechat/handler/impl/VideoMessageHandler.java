package net.zhenghao.zh.wechat.handler.impl;

import net.zhenghao.zh.wechat.annotation.Message;
import net.zhenghao.zh.wechat.enums.MessageType;
import net.zhenghao.zh.wechat.handler.MessageHandler;
import net.zhenghao.zh.wechat.message.request.BaseRequestMessage;
import net.zhenghao.zh.wechat.message.request.VideoRequestMessage;
import net.zhenghao.zh.wechat.message.response.BaseResponseMessage;
import net.zhenghao.zh.wechat.message.response.Video;
import net.zhenghao.zh.wechat.utils.MessageUtils;
import org.springframework.stereotype.Component;

/**
 * 🙃
 * 🙃 视频消息处理器
 * 🙃
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date :2018/4/25 16:07
 * VideoMessageHandler.java
 */
@Component
@Message(message = MessageType.VIDEO)
public class VideoMessageHandler implements MessageHandler {
    @Override
    public BaseResponseMessage dealMessage(BaseRequestMessage requestMessage) {
        //视频消息业务逻辑
        VideoRequestMessage videoRequestMessage = (VideoRequestMessage) requestMessage;
        /*Video video = new Video();
        video.setTitle("标题");
        video.setDescription("描述");
        video.setMediaId(videoRequestMessage.getMediaId());
        return MessageUtils.buildVideoResponseMessage(videoRequestMessage, video);*/
        String content = "您发送的视频mediaId:%s \t,ThumbMediaId:%s ";
        content = String.format(content,videoRequestMessage.getMediaId(),videoRequestMessage.getThumbMediaId());
        return MessageUtils.buildTextResponseMessage(videoRequestMessage, content);
    }
}
