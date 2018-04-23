package net.zhenghao.zh.wechat.handler.impl;

import net.zhenghao.zh.wechat.annotation.Message;
import net.zhenghao.zh.wechat.entity.ReceiveXmlEntity;
import net.zhenghao.zh.wechat.enums.MessageType;
import net.zhenghao.zh.wechat.handler.MessageHandler;
import net.zhenghao.zh.wechat.message.response.BaseResponseMessage;
import net.zhenghao.zh.wechat.message.response.TextResponseMessage;
import net.zhenghao.zh.wechat.utils.MessageUtils;
import org.springframework.stereotype.Component;

/**
 * 🙃
 * 🙃 文本消息处理器
 * 🙃
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date :2018/4/23 14:31
 * TextMessageHandler.java
 */
@Component
@Message(message = MessageType.TEXT)
public class TextMessageHandler implements MessageHandler {

    @Override
    public BaseResponseMessage dealMessage(ReceiveXmlEntity receiveXmlEntity) {
        //这里实现业务逻辑
        return MessageUtils.buildTextResponseMessage(receiveXmlEntity, receiveXmlEntity.getContent());
    }
}
