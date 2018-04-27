package net.zhenghao.zh.wechat.message.request;

import com.thoughtworks.xstream.annotations.XStreamAlias;

/**
 * 🙃
 * 🙃 图片封装
 * 🙃
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date :2018/4/27 15:14
 * Picture.java
 */
@XStreamAlias("item")
public class Picture {

    /**
     * 图片的MD5值，开发者若需要，可用于验证接收到图片
     */
    @XStreamAlias("PicMd5Sum")
    private String picMd5Sum;

    public String getPicMd5Sum() {
        return picMd5Sum;
    }

    public void setPicMd5Sum(String picMd5Sum) {
        this.picMd5Sum = picMd5Sum;
    }
}
