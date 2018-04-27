package net.zhenghao.zh.wechat.message.request;

import com.thoughtworks.xstream.annotations.XStreamAlias;

/**
 * 🙃
 * 🙃 点击菜单选择位置发送事件
 * 🙃
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date :2018/4/27 14:21
 * LocationSelectMenuEventRequestMessage.java
 */
@XStreamAlias("xml")
public class LocationSelectMenuEventRequestMessage extends EventRequestMessage {

    @XStreamAlias("SendLocationInfo")
    private SendLocationInfo sendLocationInfo;

    public SendLocationInfo getSendLocationInfo() {
        return sendLocationInfo;
    }

    public void setSendLocationInfo(SendLocationInfo sendLocationInfo) {
        this.sendLocationInfo = sendLocationInfo;
    }
}
