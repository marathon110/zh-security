package net.zhenghao.zh.wechat.message.response;

import com.thoughtworks.xstream.annotations.XStreamAlias;

/**
 * 🙃
 * 🙃 视频消息类
 * 🙃
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date :2018/4/25 15:35
 * Video.java
 */
public class Video {

    /**
     * 通过素材管理中的接口上传多媒体文件，得到的id
     */
    @XStreamAlias("MediaId")
    private String mediaId;

    /**
     * 视频消息的标题
     */
    @XStreamAlias("Title")
    private String title;

    /**
     * 视频消息的描述
     */
    @XStreamAlias("Description")
    private String description;

    public String getMediaId() {
        return mediaId;
    }

    public void setMediaId(String mediaId) {
        this.mediaId = mediaId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
