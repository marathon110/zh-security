package net.zhenghao.zh.wechat.message.response;

import com.thoughtworks.xstream.annotations.XStreamAlias;

/**
 * 🙃 公众号  ---->  用户
 * 🙃 对响应消息的基类封装,各个类型的回复消息可继承该类实现扩展
 * 🙃
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date :2018/4/23 17:02
 * BaseResponseMessage.java
 */
public class BaseResponseMessage {

    /**
     * 接收方帐号（收到的OpenID）
     */
    @XStreamAlias("ToUserName")
    private String toUserName;

    /**
     * 开发者微信号
     */
    @XStreamAlias("FromUserName")
    private String fromUserName;

    /**
     * 消息创建时间 （整型）
     */
    @XStreamAlias("CreateTime")
    private long createTime;

    /**
     * 消息类型
     */
    @XStreamAlias("MsgType")
    private String msgType;

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
