package net.zhenghao.zh.wechat.message.request;

import com.thoughtworks.xstream.annotations.XStreamAlias;

/**
 * 🙃
 * 🙃 地理位置消息封装
 * 🙃
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date :2018/4/26 15:25
 * LocationRequestMessage.java
 */
@XStreamAlias("xml")
public class LocationRequestMessage extends CommonRequestMessage {

    /**
     * 地理位置维度
     */
    @XStreamAlias("Location_X")
    private String location_X;

    /**
     * 地理位置经度
     */
    @XStreamAlias("Location_Y")
    private String location_Y;

    /**
     * 地图缩放大小
     */
    @XStreamAlias("Scale")
    private String scale;

    /**
     * 地理位置信息
     */
    @XStreamAlias("Label")
    private String label;

    public String getLocation_X() {
        return location_X;
    }

    public void setLocation_X(String location_X) {
        this.location_X = location_X;
    }

    public String getLocation_Y() {
        return location_Y;
    }

    public void setLocation_Y(String location_Y) {
        this.location_Y = location_Y;
    }

    public String getScale() {
        return scale;
    }

    public void setScale(String scale) {
        this.scale = scale;
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }
}
