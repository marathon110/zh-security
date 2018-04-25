package net.zhenghao.zh.wechat.message.response;

import com.thoughtworks.xstream.annotations.XStreamAlias;

/**
 * 🙃
 * 🙃 回复语音消息封装
 * 🙃
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date :2018/4/25 15:08
 * VoiceResponseMessage.java
 */
@XStreamAlias("xml")
public class VoiceResponseMessage extends BaseResponseMessage {

    @XStreamAlias("Voice")
    private Voice voice;

    public Voice getVoice() {
        return voice;
    }

    public void setVoice(Voice voice) {
        this.voice = voice;
    }
}
