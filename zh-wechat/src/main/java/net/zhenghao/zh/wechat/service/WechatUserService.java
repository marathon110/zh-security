package net.zhenghao.zh.wechat.service;

import java.util.Map;

import net.zhenghao.zh.common.entity.Page;
import net.zhenghao.zh.common.entity.R;
import net.zhenghao.zh.wechat.entity.WechatUserEntity;

/**
 * 微信授权页用户表
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date  :2018年5月21日 下午4:31:14
 * WechatUserService.java
 */
public interface WechatUserService {
	
	Page<WechatUserEntity> listWechatUser(Map<String, Object> params);
	
	R saveWechatUser(WechatUserEntity wechatUser);
	
	R getWechatUserById(Long id);
	
	R updateWechatUser(WechatUserEntity wechatUser);
	
	R batchRemove(Long[] id);
	
}