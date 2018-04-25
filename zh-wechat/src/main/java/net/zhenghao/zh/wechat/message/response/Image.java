package net.zhenghao.zh.wechat.message.response;

import com.thoughtworks.xstream.annotations.XStreamAlias;

/**
 * 🙃
 * 🙃 图片封装
 * 🙃
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date :2018/4/24 13:59
 * Image.java
 */
public class Image {

    /**
     * 通过素材管理中的接口上传多媒体文件，得到的id
     */
    @XStreamAlias("MediaId")
    private String mediaId;

    public String getMediaId() {
        return mediaId;
    }

    public void setMediaId(String mediaId) {
        this.mediaId = mediaId;
    }
}
