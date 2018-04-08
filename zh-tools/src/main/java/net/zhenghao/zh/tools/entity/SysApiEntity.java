package net.zhenghao.zh.tools.entity;

import java.util.Date;
import java.util.Map;

/**
 * 🙃
 * 🙃请求API实体类
 * 🙃
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date :2018/4/8 15:46
 * SysApiEntity.java
 */
public class SysApiEntity {

    /**
     * 请求方式POST GET
     */
    private String method;

    /**
     * 请求url
     */
    private String url;

    /**
     * 请求参数
     */
    private Map<String, Object> params;

    /**
     * 请求日期
     */
    private Date date;

    /**
     * 请求响应时间ms
     */
    private Long time;

    /**
     * 响应结果
     */
    private String body;

    public String getMethod() {
        return method;
    }

    public void setMethod(String method) {
        this.method = method;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Map<String, Object> getParams() {
        return params;
    }

    public void setParams(Map<String, Object> params) {
        this.params = params;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Long getTime() {
        return time;
    }

    public void setTime(Long time) {
        this.time = time;
    }

    public String getBody() {
        return body;
    }

    public void setBody(String body) {
        this.body = body;
    }
}
