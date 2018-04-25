package net.zhenghao.zh.wechat.message.request;

import com.thoughtworks.xstream.annotations.XStreamAlias;

/**
 * 🙃
 * 🙃 短视频消息封装
 * 🙃
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date :2018/4/25 15:22
 * ShortVideoRequestMessage.java
 */
@XStreamAlias("xml")
public class ShortVideoRequestMessage extends CommonRequestMessage {

    /**
     * 短视频消息媒体id，可以调用多媒体文件下载接口拉取该媒体
     */
    @XStreamAlias("MediaId")
    private String mediaId;

    /**
     * 视频消息缩略图的媒体id，可以调用多媒体文件下载接口拉取数据。
     */
    @XStreamAlias("ThumbMediaId")
    private String thumbMediaId;

    public String getMediaId() {
        return mediaId;
    }

    public void setMediaId(String mediaId) {
        this.mediaId = mediaId;
    }

    public String getThumbMediaId() {
        return thumbMediaId;
    }

    public void setThumbMediaId(String thumbMediaId) {
        this.thumbMediaId = thumbMediaId;
    }
}
