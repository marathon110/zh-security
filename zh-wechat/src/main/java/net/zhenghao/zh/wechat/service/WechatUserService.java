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

	/**
	 * 微信用户授权
	 * 若用户之前不存在，则新增
	 * 若用户之前存在，则更新
	 * @param wechatUser
	 * @return
	 */
	R saveOrupdateWechatUserAuth(WechatUserEntity wechatUser);


	/**
	 * 微信用户授权
	 * 若openid在数据库中则生成token
	 * 若openid不在数据库中则返回错误，让前端跳转授权
	 * @param openid
	 * @return
	 */
	R wechatLogin(String openid);

	R getWechatUserByOpenId(String openid);
}