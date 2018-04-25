package net.zhenghao.zh.wechat.message.request;

import com.thoughtworks.xstream.annotations.XStreamAlias;

/**
 * 🙃
 * 🙃 语音消息封装
 * 🙃
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date :2018/4/25 14:47
 * VoiceRequestMessage.java
 */
@XStreamAlias("xml")
public class VoiceRequestMessage extends CommonRequestMessage {

    /**
     * 语音消息媒体id，可以调用多媒体文件下载接口拉取该媒体
     */
    @XStreamAlias("MediaId")
    private String mediaId;

    /**
     * 语音格式，如amr，speex等
     */
    @XStreamAlias("Format")
    private String format;

    /**
     * 语音识别结果，UTF8编码
     */
    @XStreamAlias("Recognition")
    private String recognition;

    public String getMediaId() {
        return mediaId;
    }

    public void setMediaId(String mediaId) {
        this.mediaId = mediaId;
    }

    public String getFormat() {
        return format;
    }

    public void setFormat(String format) {
        this.format = format;
    }

    public String getRecognition() {
        return recognition;
    }

    public void setRecognition(String recognition) {
        this.recognition = recognition;
    }
}
