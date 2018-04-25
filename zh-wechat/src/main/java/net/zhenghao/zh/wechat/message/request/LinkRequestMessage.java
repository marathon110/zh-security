package net.zhenghao.zh.wechat.message.request;

import com.thoughtworks.xstream.annotations.XStreamAlias;

/**
 * 🙃
 * 🙃 连接消息封装
 * 🙃
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date :2018/4/25 14:02
 * LinkRequestMessage.java
 */
@XStreamAlias("xml")
public class LinkRequestMessage extends CommonRequestMessage {

    /**
     * 消息标题
     */
    @XStreamAlias("Title")
    private String title;

    /**
     * 消息描述
     */
    @XStreamAlias("Description")
    private String description;

    /**
     * 消息链接
     */
    @XStreamAlias("Url")
    private String url;

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

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
}
