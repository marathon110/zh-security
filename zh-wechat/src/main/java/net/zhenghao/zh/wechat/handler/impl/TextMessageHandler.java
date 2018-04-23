package net.zhenghao.zh.wechat.handler.impl;

import net.zhenghao.zh.wechat.annotation.Message;
import net.zhenghao.zh.wechat.entity.ReceiveXmlEntity;
import net.zhenghao.zh.wechat.enums.MessageType;
import net.zhenghao.zh.wechat.handler.MessageHandler;
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
    public void dealMessage(ReceiveXmlEntity receiveXmlEntity) {
        System.out.println("接收普通消息类型");
        System.out.println(receiveXmlEntity.toString());
    }
}
