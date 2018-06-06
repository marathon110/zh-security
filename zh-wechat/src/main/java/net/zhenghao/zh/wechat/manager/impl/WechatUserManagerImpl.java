package net.zhenghao.zh.wechat.manager.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import net.zhenghao.zh.common.entity.Page;
import net.zhenghao.zh.common.entity.Query;
import net.zhenghao.zh.wechat.dao.WechatUserMapper;
import net.zhenghao.zh.wechat.entity.WechatUserEntity;
import net.zhenghao.zh.wechat.manager.WechatUserManager;

/**
 * 微信授权页用户表
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date  :2018年5月21日 下午4:31:14
 * WechatUserManagerImpl.java
 */
@Component("wechatUserManager")
public class WechatUserManagerImpl implements WechatUserManager {

	@Autowired
	private WechatUserMapper wechatUserMapper;
	
	@Override
	public List<WechatUserEntity> listWechatUser(Page<WechatUserEntity> page, Query search) {
		return wechatUserMapper.listForPage(page, search);
	}

	@Override
	public int saveWechatUser(WechatUserEntity wechatUser) {
		return wechatUserMapper.save(wechatUser);
	}

	@Override
	public WechatUserEntity getWechatUserById(Long id) {
		WechatUserEntity wechatUser = wechatUserMapper.getObjectById(id);
		return wechatUser;
	}

	@Override
	public int updateWechatUser(WechatUserEntity wechatUser) {
		return wechatUserMapper.update(wechatUser);
	}

	@Override
	public int batchRemove(Long[] id) {
		int count = wechatUserMapper.batchRemove(id);
		return count;
	}

	@Override
	public WechatUserEntity getWechatUserByOpenid(String openid) {
		WechatUserEntity wechatUser = wechatUserMapper.getObjectByOpenid(openid);
		return wechatUser;
	}

	@Override
	public List<Map<String, Object>> wechatUserCount() {
		return wechatUserMapper.wechatUserCount();
	}

}