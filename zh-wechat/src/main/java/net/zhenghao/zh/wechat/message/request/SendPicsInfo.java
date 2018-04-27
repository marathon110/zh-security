package net.zhenghao.zh.wechat.message.request;

import com.thoughtworks.xstream.annotations.XStreamAlias;

import java.util.List;

/**
 * 🙃
 * 🙃 图片集合封装
 * 🙃
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date :2018/4/27 15:14
 * SendPicsInfo.java
 */
public class SendPicsInfo {

    /**
     * 发送图片的数量
     */
    @XStreamAlias("Count")
    private int count;

    /**
     * 图片列表
     */
    @XStreamAlias("PicList")
    private List<Picture> picList;

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public List<Picture> getPicList() {
        return picList;
    }

    public void setPicList(List<Picture> picList) {
        this.picList = picList;
    }
}
