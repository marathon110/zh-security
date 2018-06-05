package net.zhenghao.zh.wechat.entity;

/**
 * 🙃
 * 🙃 封装jsapi_ticket
 * 🙃
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date :2018/6/5 14:51
 * JsapiTicketEntity.java
 */
public class JsapiTicketEntity {

    /**
     * 微信access_token
     */
    private String ticket;

    /**
     * 凭证有效期，单位：秒
     */
    private Long expires_in;

    /**
     * 提前多少秒失效
     */
    private static final int TIMEDELTA = 200;

    /**
     * 有效期最大的时间毫秒值(单位：毫秒)
     */
    private Long deadTime;

    private String errcode;

    private String errmsg;

    public String getTicket() {
        return ticket;
    }

    public void setTicket(String ticket) {
        this.ticket = ticket;
    }

    public Long getExpires_in() {
        return expires_in;
    }

    /**
     * 在json转对象时该方法会被执行，从而为deadTime等属性设置了初始值
     * @param expires_in
     */
    public void setExpires_in(Long expires_in) {
        this.expires_in = expires_in - TIMEDELTA;
        long time = System.currentTimeMillis() + this.expires_in * 1000;
        setDeadTime(time);
    }

    public Long getDeadTime() {
        return deadTime;
    }

    public void setDeadTime(Long deadTime) {
        this.deadTime = deadTime;
    }

    public String getErrcode() {
        return errcode;
    }

    public void setErrcode(String errcode) {
        this.errcode = errcode;
    }

    public String getErrmsg() {
        return errmsg;
    }

    public void setErrmsg(String errmsg) {
        this.errmsg = errmsg;
    }
}
