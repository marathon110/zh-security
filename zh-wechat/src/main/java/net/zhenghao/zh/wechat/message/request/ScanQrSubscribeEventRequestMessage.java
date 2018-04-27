package net.zhenghao.zh.wechat.message.request;

import com.thoughtworks.xstream.annotations.XStreamAlias;

/**
 * 🙃
 * 🙃 用户扫描带场景值二维码时,
 * 🙃    如果用户已经关注公众号，则微信会将带场景值扫描事件推送给开发者。
 * 🙃    如果用户还未关注公众号，则用户可以关注公众号，关注后微信会将带场景值关注事件推送给开发者。
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date :2018/4/27 10:28
 * ScanQrSubscribeEventRequestMessage.java
 */
@XStreamAlias("xml")
public class ScanQrSubscribeEventRequestMessage extends EventRequestMessage {

    /**
     * 二维码的ticket，可用来换取二维码图片
     */
    @XStreamAlias("Ticket")
    private String ticket;

    public String getTicket() {
        return ticket;
    }

    public void setTicket(String ticket) {
        this.ticket = ticket;
    }
}
