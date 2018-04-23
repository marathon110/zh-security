package net.zhenghao.zh.wechat.core;

import net.zhenghao.zh.wechat.annotation.Message;
import net.zhenghao.zh.wechat.entity.ReceiveXmlEntity;
import net.zhenghao.zh.wechat.enums.EventType;
import net.zhenghao.zh.wechat.enums.MessageType;
import net.zhenghao.zh.wechat.handler.MessageHandler;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;

import java.util.Map;

/**
 * 🙃 消息处理适配器
 * 🙃 从spring容器中查找消息处理器,将不同类型的消息分发给不同的处理器
 * 🙃
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date :2018/4/23 15:17
 * MessageHandlerAdapter.java
 */
@Component
public class MessageHandlerAdapter implements ApplicationContextAware {

    private ApplicationContext applicationContext;

    public MessageHandler findMessageHandler(ReceiveXmlEntity receiveXmlEntity) {

        MessageType messageType = MessageType.valueBy(receiveXmlEntity.getMsgType());
        EventType eventType = null;
        if (StringUtils.isNotBlank(receiveXmlEntity.getEvent())) {
            eventType = EventType.valueBy(receiveXmlEntity.getEvent());
        }

        Map<String, Object> beansWithAnnotation = this.applicationContext.getBeansWithAnnotation(Message.class);

        for (Map.Entry<String,Object> entry : beansWithAnnotation.entrySet()) {
            Object messageHandlerInstance = entry.getValue();
            Class<?> messageHandlerClass = messageHandlerInstance.getClass();
            //isAssignableFrom()返回true说明是括号里的类的父类或父接口。
            if (!MessageHandler.class.isAssignableFrom(messageHandlerClass)) {
                continue;
            }
            Message annotition = messageHandlerClass.getAnnotation(Message.class);
            //在枚举类中，重写了equals方法，方法里面比较就是直接使用==
            if (annotition.message() == MessageType.EVENT) {
                //事件类型
                if (annotition.event() == eventType) {
                    return (MessageHandler) messageHandlerInstance;
                }
            } else {
                //普通类型
                if (annotition.message() == messageType) {
                    return (MessageHandler) messageHandlerInstance;
                }
            }
        }
        return null;
    }

    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        this.applicationContext = applicationContext;
    }
}
