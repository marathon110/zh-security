package net.zhenghao.zh.wechat.entity;

/**
 * 🙃
 * 🙃 微信消息类型封装类
 * 🙃
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date :2018/4/25 11:33
 * MessageTypeEntity.java
 */
public class MessageTypeEntity {

    private String messageType;

    private String eventType;

    public MessageTypeEntity(String messageType, String eventType) {
        this.messageType = messageType;
        this.eventType = eventType;
    }

    public String getMessageType() {
        return messageType;
    }

    public void setMessageType(String messageType) {
        this.messageType = messageType;
    }

    public String getEventType() {
        return eventType;
    }

    public void setEventType(String eventType) {
        this.eventType = eventType;
    }
}
