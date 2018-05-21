package net.zhenghao.zh.wechat.entity;

import java.io.Serializable;
import java.util.Date;


/**
 * 微信基本配置表
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date  :2018年4月16日 下午2:02:55
 * WechatConfigEntity.java
 */
public class WechatConfigEntity implements Serializable {

	private static final long serialVersionUID = 1L;
	
	/**
	 * 
	 */
	private Long id;
	
	/**
	 * 微信appid
	 */
	private String appId;
	
	/**
	 * 微信appsecret
	 */
	private String appsecret;

	/**
	 * 微信令牌(Token)
	 */
	private String token;

	/**
	 * 消息加解密密钥(EncodingAESKey)
	 */
	private String encodingAesKey;

	private String redirectUri;
	
	/**
	 * 创建用户id
	 */
	private Long userIdCreate;
	
	/**
	 * 创建时间
	 */
	private Date gmtCreate;
	
	/**
	 * 修改时间
	 */
	private Date gmtModified;
	
	
	public WechatConfigEntity() {
		super();
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	
	public Long getId() {
		return id;
	}
	
	public void setAppId(String appId) {
		this.appId = appId;
	}
	
	public String getAppId() {
		return appId;
	}
	
	public void setAppsecret(String appsecret) {
		this.appsecret = appsecret;
	}
	
	public String getAppsecret() {
		return appsecret;
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public String getEncodingAesKey() {
		return encodingAesKey;
	}

	public void setEncodingAesKey(String encodingAesKey) {
		this.encodingAesKey = encodingAesKey;
	}

	public String getRedirectUri() {
		return redirectUri;
	}

	public void setRedirectUri(String redirectUri) {
		this.redirectUri = redirectUri;
	}

	public void setUserIdCreate(Long userIdCreate) {
		this.userIdCreate = userIdCreate;
	}
	
	public Long getUserIdCreate() {
		return userIdCreate;
	}
	
	public void setGmtCreate(Date gmtCreate) {
		this.gmtCreate = gmtCreate;
	}
	
	public Date getGmtCreate() {
		return gmtCreate;
	}
	
	public void setGmtModified(Date gmtModified) {
		this.gmtModified = gmtModified;
	}
	
	public Date getGmtModified() {
		return gmtModified;
	}
	
}