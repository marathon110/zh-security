package net.zhenghao.zh.wechat.message.request;

import com.thoughtworks.xstream.annotations.XStreamAlias;

/**
 * 🙃
 * 🙃 上报地图信息
 * 🙃
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date :2018/4/27 14:22
 * SendLocationInfo.java
 */
public class SendLocationInfo {

    /**
     * X坐标信息
     */
    @XStreamAlias("Location_X")
    private String location_X;

    /**
     * Y坐标信息
     */
    @XStreamAlias("Location_Y")
    private String location_Y;

    /**
     * 精度
     */
    @XStreamAlias("Scale")
    private String scale;

    /**
     * 地理位置的字符串信息
     */
    @XStreamAlias("Label")
    private String label;

    /**
     * 朋友圈POI的名字，可能为空
     */
    @XStreamAlias("Poiname")
    private String poiname;

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

    public String getPoiname() {
        return poiname;
    }

    public void setPoiname(String poiname) {
        this.poiname = poiname;
    }
}
