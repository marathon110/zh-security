package net.zhenghao.zh.wechat.manager.impl;

import net.zhenghao.zh.common.constant.SystemConstant.MenuType;
import net.zhenghao.zh.common.entity.Query;
import net.zhenghao.zh.wechat.dao.WechatMenuMapper;
import net.zhenghao.zh.wechat.entity.WechatMenuEntity;
import net.zhenghao.zh.wechat.manager.WechatMenuManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

/**
 * 微信菜单
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date  :2018年4月18日 下午3:45:23
 * SysMenuManagerImpl.java
 */
@Component("wechatMenuManager")
public class WechatMenuManagerImpl implements WechatMenuManager {
	
	@Autowired
	private WechatMenuMapper wechatMenuMapper;

	@Override
	public List<WechatMenuEntity> listMenu(Query search) {
		return wechatMenuMapper.list(search);
	}

	@Override
	public List<WechatMenuEntity> listButton() {
		return wechatMenuMapper.listButton();
	}
	
	@Override
	public int saveMenu(WechatMenuEntity menu) {
		return wechatMenuMapper.save(menu);
	}

	@Override
	public WechatMenuEntity getMenuById(Long id) {
		return wechatMenuMapper.getObjectById(id);
	}

	@Override
	public int updateMenu(WechatMenuEntity menu) {
		return wechatMenuMapper.update(menu);
	}

	@Override
	public int batchRemove(Long[] id) {
		int count = wechatMenuMapper.batchRemove(id);
		return count;
	}

}
