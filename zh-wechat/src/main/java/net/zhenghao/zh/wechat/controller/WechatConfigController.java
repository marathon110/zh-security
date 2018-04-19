package net.zhenghao.zh.wechat.controller;

import net.zhenghao.zh.common.annotation.SysLog;
import net.zhenghao.zh.common.constant.SystemConstant;
import net.zhenghao.zh.common.controller.AbstractController;
import net.zhenghao.zh.common.entity.R;
import net.zhenghao.zh.wechat.entity.WechatConfigEntity;
import net.zhenghao.zh.wechat.service.WechatConfigService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

/**
 * 微信基本配置表
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date  :2018年4月16日 下午2:02:55
 * WechatConfigController.java
 */
@RestController
@RequestMapping("/wechat/config")
public class WechatConfigController extends AbstractController {

	@Autowired
	private WechatConfigService wechatConfigService;

	/**
	 * 配置微信基础配置，数据库不存在就插入，存在就更新
	 * @param wechatConfig
	 * @return
	 */
	@SysLog(value = "新增或更新微信基本配置", type = "WECHAT")
	@RequestMapping("/save")
	public R saveOrUpdate(@RequestBody WechatConfigEntity wechatConfig) {
		return wechatConfigService.saveOrUpdate(wechatConfig);
	}

	/**
	 * 数据库已经写死id
	 * @param
	 * @return
	 */
	@RequestMapping("/info")
	public R getWechatConfig() {
		return wechatConfigService.getWechatConfig();
	}

}