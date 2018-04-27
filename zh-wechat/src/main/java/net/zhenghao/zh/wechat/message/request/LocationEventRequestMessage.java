package net.zhenghao.zh.wechat.message.request;

import com.thoughtworks.xstream.annotations.XStreamAlias;

/**
 * 🙃
 * 🙃 上报地理位置事件
 * 🙃
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date :2018/4/27 13:59
 * LocationEventRequestMessage.java
 */
@XStreamAlias("xml")
public class LocationEventRequestMessage extends EventRequestMessage {

    /**
     * 地理位置纬度
     */
    @XStreamAlias("Latitude")
    private String latitude;

    /**
     * 地理位置经度
     */
    @XStreamAlias("Longitude")
    private String longitude;

    /**
     * 地理位置精度
     */
    @XStreamAlias("Precision")
    private String precision;

    public String getLatitude() {
        return latitude;
    }

    public void setLatitude(String latitude) {
        this.latitude = latitude;
    }

    public String getLongitude() {
        return longitude;
    }

    public void setLongitude(String longitude) {
        this.longitude = longitude;
    }

    public String getPrecision() {
        return precision;
    }

    public void setPrecision(String precision) {
        this.precision = precision;
    }
}
