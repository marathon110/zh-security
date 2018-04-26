package net.zhenghao.zh.wechat.message.request;

import com.thoughtworks.xstream.annotations.XStreamAlias;

/**
 * 🙃
 * 🙃 事件类型消息基类
 * 🙃
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date :2018/4/26 16:36
 * EventRequestMessage.java
 */
public class EventRequestMessage extends BaseRequestMessage {

    /**
     * 事件类型
     */
    @XStreamAlias("Event")
    private String event;

    /**
     * 事件类型
     */
    @XStreamAlias("EventKey")
    private String eventKey;

    public String getEvent() {
        return event;
    }

    public void setEvent(String event) {
        this.event = event;
    }

    public String getEventKey() {
        return eventKey;
    }

    public void setEventKey(String eventKey) {
        this.eventKey = eventKey;
    }
}
