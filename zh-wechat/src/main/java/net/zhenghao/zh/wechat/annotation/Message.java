package net.zhenghao.zh.wechat.annotation;

import net.zhenghao.zh.wechat.enums.EventType;
import net.zhenghao.zh.wechat.enums.MessageType;

import java.lang.annotation.*;

/**
 * 🙃
 * 🙃 微信消息注解
 * 🙃 根据消息类型分配需要处理消息的类
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date :2018/4/23 13:43
 * Message.java
 */
@Target(ElementType.TYPE)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface Message {

    /**
     * 消息类型
     * @return
     */
    MessageType message() default MessageType.TEXT;

    /**
     * 事件类型
     * @return
     */
    EventType event() default EventType.NULL;

}
