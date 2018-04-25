package net.zhenghao.zh.wechat.message.request;

import com.thoughtworks.xstream.annotations.XStreamAlias;

/**
 * 🙃 用户  ---->  公众号
 * 🙃 用户发送给公众号消息封装
 * 🙃
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date :2018/4/25 10:35
 * BaseRequestMessage.java
 */
public class BaseRequestMessage {

    /**
     * 开发者微信号
     */
    @XStreamAlias("ToUserName")
    protected String toUserName;

    /**
     * 发送方帐号（一个OpenID）
     */
    @XStreamAlias("FromUserName")
    protected String fromUserName;

    /**
     * 消息创建时间 （整型）
     */
    @XStreamAlias("CreateTime")
    protected long createTime;

    /**
     * 消息类型
     */
    @XStreamAlias("MsgType")
    protected String msgType;

    public String getToUserName() {
        return toUserName;
    }

    public void setToUserName(String toUserName) {
        this.toUserName = toUserName;
    }

    public String getFromUserName() {
        return fromUserName;
    }

    public void setFromUserName(String fromUserName) {
        this.fromUserName = fromUserName;
    }

    public long getCreateTime() {
        return createTime;
    }

    public void setCreateTime(long createTime) {
        this.createTime = createTime;
    }

    public String getMsgType() {
        return msgType;
    }

    public void setMsgType(String msgType) {
        this.msgType = msgType;
    }
}
