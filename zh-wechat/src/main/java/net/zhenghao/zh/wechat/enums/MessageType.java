package net.zhenghao.zh.wechat.enums;

/**
 * 🙃
 * 🙃 消息类型的枚举
 * 🙃
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date :2018/4/23 14:58
 * MessageType.java
 */
public enum MessageType {

    /**
     * 文本消息
     */
    TEXT("text"),
    /**
     * 图片消息
     */
    IMAGE("image"),
    /**
     * 语音消息
     */
    VOICE("voice"),
    /**
     * 视频消息
     */
    VIDEO("video"),
    /**
     * 短视频消息
     */
    SHORT_VIDEO("shortvideo"),
    /**
     * 位置消息
     */
    LOCATION("location"),
    /**
     * 链接消息
     */
    LINK("link"),

    /**
     * 音乐消息
     */
    MUSIC("music"),

    /**
     * 图文消息
     */
    NEWS("news"),

    /**
     * 事件消息
     */
    EVENT("event");

    private String type;

    public String getType() {
        return this.type;
    }

    private MessageType(String type) {
        this.type = type;
    }

    public static MessageType valueBy(String typeStr) {
        for (MessageType messageType : MessageType.values()) {
            if (messageType.getType().equalsIgnoreCase(typeStr)) {
                return messageType;
            }
        }
        return null;
    }
}
