package net.zhenghao.zh.wechat.service;

import net.zhenghao.zh.common.entity.R;
import net.zhenghao.zh.wechat.entity.WechatConfigEntity;

import java.util.Map;

/**
 * 微信基本配置表
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date  :2018年4月16日 下午2:02:55
 * WechatConfigService.java
 */
public interface WechatConfigService {

	R getWechatConfig();

	R saveOrUpdate(WechatConfigEntity wechatConfig);
	
}