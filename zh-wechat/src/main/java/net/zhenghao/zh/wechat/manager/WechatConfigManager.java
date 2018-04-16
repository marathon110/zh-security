package net.zhenghao.zh.wechat.manager;

import java.util.List;

import net.zhenghao.zh.common.entity.Page;
import net.zhenghao.zh.common.entity.Query;
import net.zhenghao.zh.wechat.entity.WechatConfigEntity;

/**
 * 微信基本配置表
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date  :2018年4月16日 下午2:02:55
 * WechatConfigManager.java
 */
 
 public interface WechatConfigManager {

	WechatConfigEntity getWechatConfig();

	int saveOrUpdate(WechatConfigEntity wechatConfig);
	
 }