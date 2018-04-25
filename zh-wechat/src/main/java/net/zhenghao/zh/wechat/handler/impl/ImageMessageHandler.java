package net.zhenghao.zh.wechat.handler.impl;

import net.zhenghao.zh.wechat.annotation.Message;
import net.zhenghao.zh.wechat.enums.MessageType;
import net.zhenghao.zh.wechat.handler.MessageHandler;
import net.zhenghao.zh.wechat.message.request.BaseRequestMessage;
import net.zhenghao.zh.wechat.message.request.ImageRequestMessage;
import net.zhenghao.zh.wechat.message.response.BaseResponseMessage;
import net.zhenghao.zh.wechat.message.response.Image;
import net.zhenghao.zh.wechat.utils.MessageUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Component;

/**
 * 🙃
 * 🙃 图片消息处理器
 * 🙃
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date :2018/4/24 13:47
 * ImageMessageHandler.java
 */
@Component
@Message(message = MessageType.IMAGE)
public class ImageMessageHandler implements MessageHandler {
    @Override
    public BaseResponseMessage dealMessage(BaseRequestMessage requestMessage) {
        //这里实现业务逻辑

        ImageRequestMessage imageRequestMessage = (ImageRequestMessage) requestMessage;
        //构建图片,实现回复相同的图片给用户
        Image image = new Image();
        image.setMediaId(StringUtils.isNotBlank(imageRequestMessage.getMediaId()) ? imageRequestMessage.getMediaId() : "");
        return MessageUtils.buildImageResponseMessage(imageRequestMessage, image);
    }
}
