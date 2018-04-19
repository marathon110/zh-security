package net.zhenghao.zh.wechat.service.impl;

import net.zhenghao.zh.common.entity.R;
import net.zhenghao.zh.common.utils.CommonUtils;
import net.zhenghao.zh.common.utils.ShiroUtils;
import net.zhenghao.zh.wechat.entity.WechatConfigEntity;
import net.zhenghao.zh.wechat.manager.WechatConfigManager;
import net.zhenghao.zh.wechat.service.WechatConfigService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * 微信基本配置表
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date  :2018年4月16日 下午2:02:55
 * WechatConfigServiceImpl.java
 */
@Service("wechatConfigService")
public class WechatConfigServiceImpl implements WechatConfigService {

	@Autowired
	private WechatConfigManager wechatConfigManager;

	@Override
	public R getWechatConfig() {
		WechatConfigEntity wechatConfig = wechatConfigManager.getWechatConfig();
		if (wechatConfig == null) {
			wechatConfig = new WechatConfigEntity();
		}
		return CommonUtils.msgNotNull(wechatConfig);
	}

	@Override
	public R saveOrUpdate(WechatConfigEntity wechatConfig) {
        wechatConfig.setUserIdCreate(ShiroUtils.getUserEntity().getUserId());
		int count = wechatConfigManager.saveOrUpdate(wechatConfig);
		return CommonUtils.msg(count);
	}

}