package net.zhenghao.zh.wechat.message.request;

import com.thoughtworks.xstream.annotations.XStreamAlias;

/**
 * 🙃
 * 🙃 普通类型消息基类
 * 🙃
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date :2018/4/25 10:40
 * CommonRequestMessage.java
 */
public class CommonRequestMessage extends BaseRequestMessage {

    /**
     * 消息id，64位整型
     */
    @XStreamAlias("MsgId")
    private Long msgId;

    public Long getMsgId() {
        return msgId;
    }

    public void setMsgId(Long msgId) {
        this.msgId = msgId;
    }
}
