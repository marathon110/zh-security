package net.zhenghao.zh.wechat.manager.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import net.zhenghao.zh.common.entity.Page;
import net.zhenghao.zh.common.entity.Query;
import net.zhenghao.zh.wechat.dao.WechatConfigMapper;
import net.zhenghao.zh.wechat.entity.WechatConfigEntity;
import net.zhenghao.zh.wechat.manager.WechatConfigManager;

/**
 * 微信基本配置表
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date  :2018年4月16日 下午2:02:55
 * WechatConfigManagerImpl.java
 */
@Component("wechatConfigManager")
public class WechatConfigManagerImpl implements WechatConfigManager {

	@Autowired
	private WechatConfigMapper wechatConfigMapper;

	@Override
	public WechatConfigEntity getWechatConfig() {
		WechatConfigEntity wechatConfig = wechatConfigMapper.getWechatConfig();
		return wechatConfig;
	}

	@Override
	public int saveOrUpdate(WechatConfigEntity wechatConfig) {
		return wechatConfigMapper.saveOrUpdate(wechatConfig);
	}

}