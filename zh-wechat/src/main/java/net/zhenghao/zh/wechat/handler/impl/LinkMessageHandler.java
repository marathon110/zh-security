package net.zhenghao.zh.wechat.handler.impl;

import net.zhenghao.zh.wechat.annotation.Message;
import net.zhenghao.zh.wechat.enums.MessageType;
import net.zhenghao.zh.wechat.handler.MessageHandler;
import net.zhenghao.zh.wechat.message.request.BaseRequestMessage;
import net.zhenghao.zh.wechat.message.request.LinkRequestMessage;
import net.zhenghao.zh.wechat.message.response.BaseResponseMessage;
import net.zhenghao.zh.wechat.utils.MessageUtils;
import org.springframework.stereotype.Component;

/**
 * 🙃
 * 🙃 接收链接消息处理器
 * 🙃
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date :2018/4/25 14:05
 * LinkMessageHandler.java
 */
@Component
@Message(message = MessageType.LINK)
public class LinkMessageHandler implements MessageHandler {
    @Override
    public BaseResponseMessage dealMessage(BaseRequestMessage requestMessage) {
        //接收链接消息处理业务逻辑
        LinkRequestMessage linkRequestMessage = (LinkRequestMessage) requestMessage;
        String content = String.format("您发送的链接消息如下：\n title:%s\n url:%s\n description:%s",
                linkRequestMessage.getTitle(), linkRequestMessage.getUrl(), linkRequestMessage.getDescription());
        return MessageUtils.buildTextResponseMessage(requestMessage, content);
    }
}
