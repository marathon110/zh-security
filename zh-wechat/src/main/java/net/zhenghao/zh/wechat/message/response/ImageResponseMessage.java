package net.zhenghao.zh.wechat.message.response;

import com.thoughtworks.xstream.annotations.XStreamAlias;

/**
 * 🙃
 * 🙃 回复图片消息的封装
 * 🙃
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date :2018/4/24 13:54
 * ImageResponseMessage.java
 */
@XStreamAlias("xml")
public class ImageResponseMessage extends BaseResponseMessage {

    @XStreamAlias("Image")
    private Image image;

    public Image getImage() {
        return image;
    }

    public void setImage(Image image) {
        this.image = image;
    }
}
