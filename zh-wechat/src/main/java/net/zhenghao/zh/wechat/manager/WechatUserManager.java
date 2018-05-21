package net.zhenghao.zh.wechat.manager;

import java.util.List;

import net.zhenghao.zh.common.entity.Page;
import net.zhenghao.zh.common.entity.Query;
import net.zhenghao.zh.wechat.entity.WechatUserEntity;

/**
 * 微信授权页用户表
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date  :2018年5月21日 下午4:31:14
 * WechatUserManager.java
 */
 
 public interface WechatUserManager {
 
 	List<WechatUserEntity> listWechatUser(Page<WechatUserEntity> page, Query search);
	
	int saveWechatUser(WechatUserEntity wechatUser);
	
	WechatUserEntity getWechatUserById(Long id);
	
	int updateWechatUser(WechatUserEntity wechatUser);
	
	int batchRemove(Long[] id);
	
 }