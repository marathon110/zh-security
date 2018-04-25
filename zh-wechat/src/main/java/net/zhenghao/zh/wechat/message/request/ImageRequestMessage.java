package net.zhenghao.zh.wechat.message.request;

import com.thoughtworks.xstream.annotations.XStreamAlias;

/**
 * 🙃
 * 🙃 图片消息封装
 * 🙃
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date :2018/4/25 14:35
 * ImageRequestMessage.java
 */
@XStreamAlias("xml")
public class ImageRequestMessage extends CommonRequestMessage {

    /**
     * 图片链接（由系统生成）
     */
    @XStreamAlias("PicUrl")
    private String picUrl;

    /**
     * 图片消息媒体id，可以调用多媒体文件下载接口拉取数据。
     */
    @XStreamAlias("MediaId")
    private String mediaId;

    public String getPicUrl() {
        return picUrl;
    }

    public void setPicUrl(String picUrl) {
        this.picUrl = picUrl;
    }

    public String getMediaId() {
        return mediaId;
    }

    public void setMediaId(String mediaId) {
        this.mediaId = mediaId;
    }
}
