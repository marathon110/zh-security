package net.zhenghao.zh.wechat.entity;

/**
 * 🙃
 * 🙃 封装AccessToken
 * 🙃
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date :2018/4/17 14:14
 * AccessTokenEntity.java
 */
public class AccessTokenEntity {

    /**
     * 微信access_token
     */
    private String access_token;

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

    public String getAccess_token() {
        return access_token;
    }

    public void setAccess_token(String access_token) {
        this.access_token = access_token;
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
}
