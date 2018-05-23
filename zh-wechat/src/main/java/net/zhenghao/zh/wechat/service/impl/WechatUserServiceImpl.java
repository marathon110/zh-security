package net.zhenghao.zh.wechat.service.impl;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

import net.zhenghao.zh.wechat.jwt.JwtToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.zhenghao.zh.common.entity.Page;
import net.zhenghao.zh.common.entity.Query;
import net.zhenghao.zh.common.entity.R;
import net.zhenghao.zh.common.utils.CommonUtils;
import net.zhenghao.zh.wechat.entity.WechatUserEntity;
import net.zhenghao.zh.wechat.manager.WechatUserManager;
import net.zhenghao.zh.wechat.service.WechatUserService;

/**
 * 微信授权页用户表
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date  :2018年5月21日 下午4:31:14
 * WechatUserServiceImpl.java
 */
@Service("wechatUserService")
public class WechatUserServiceImpl implements WechatUserService {

	@Autowired
	private WechatUserManager wechatUserManager;
	
	@Override
	public Page<WechatUserEntity> listWechatUser(Map<String, Object> params) {
		Query query = new Query(params);
		Page<WechatUserEntity> page = new Page<>(query);
		wechatUserManager.listWechatUser(page, query);
		return page;
	}

	@Override
	public R saveWechatUser(WechatUserEntity wechatUser) {
		int count = wechatUserManager.saveWechatUser(wechatUser);
		return CommonUtils.msg(count);
	}

	@Override
	public R getWechatUserById(Long id) {
		WechatUserEntity wechatUser = wechatUserManager.getWechatUserById(id);
		return CommonUtils.msg(wechatUser);
	}

	@Override
	public R updateWechatUser(WechatUserEntity wechatUser) {
		int count = wechatUserManager.updateWechatUser(wechatUser);
		return CommonUtils.msg(count);
	}

	@Override
	public R batchRemove(Long[] id) {
		int count = wechatUserManager.batchRemove(id);
		return CommonUtils.msg(id, count);
	}

	/**
	 * 微信用户授权
	 * 若用户之前不存在，则新增
	 * 若用户之前存在，则更新
	 * @param wechatUser
	 * @return
	 */
	@Override
	public R saveOrupdateWechatUserAuth(WechatUserEntity wechatUser) {
		int count = 0;
		WechatUserEntity user = wechatUserManager.getWechatUserByOpenid(wechatUser.getOpenid());
		if (user == null) {
			count = wechatUserManager.saveWechatUser(wechatUser);
		} else {
			wechatUser.setId(user.getId());
			count = wechatUserManager.updateWechatUser(wechatUser);
		}
		return CommonUtils.msg(count);
	}

	@Override
	public R wechatLogin(String openid) {
		WechatUserEntity user = wechatUserManager.getWechatUserByOpenid(openid);
		if (user == null) {
			return R.error(500, "openid未找到该用户，请重新授权");
		} else {
			String token = "";
			try {
				token = JwtToken.createToken(openid);
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("token", token);
			return R.ok(map);
		}
	}

}