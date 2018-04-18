package net.zhenghao.zh.wechat.service.impl;

import net.zhenghao.zh.common.entity.Query;
import net.zhenghao.zh.common.entity.R;
import net.zhenghao.zh.common.utils.CommonUtils;
import net.zhenghao.zh.wechat.entity.WechatMenuEntity;
import net.zhenghao.zh.wechat.manager.WechatMenuManager;
import net.zhenghao.zh.wechat.service.WechatMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * 微信菜单
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date  :2017年12月7日 下午2:51:12
 * SysMenuServiceImpl.java
 */
@Service("wechatMenuService")
public class WechatMenuServiceImpl implements WechatMenuService {
	
	@Autowired
	private WechatMenuManager wechatMenuManager;

	@Override
	public List<WechatMenuEntity> listMenu(Map<String, Object> params) {
		Query query = new Query(params);
		List<WechatMenuEntity> menuList = wechatMenuManager.listMenu(query);
		return menuList;
	}

	@Override
	public R listButton() {
		List<WechatMenuEntity> menuList = wechatMenuManager.listButton();
		WechatMenuEntity root = new WechatMenuEntity();
		root.setId(0L);
		root.setName("一级菜单");
		root.setParentId(-1L);
		root.setOpen(true);
		menuList.add(root);
		return CommonUtils.msgNotNull(menuList);
	}

	@Override
	public R saveMenu(WechatMenuEntity menu) {
		int count = wechatMenuManager.saveMenu(menu);
		return CommonUtils.msg(count);
	}

	@Override
	public R getMenuById(Long id) {
		WechatMenuEntity menu = wechatMenuManager.getMenuById(id);
		return CommonUtils.msg(menu);
	}

	@Override
	public R updateMenu(WechatMenuEntity menu) {
		int count = wechatMenuManager.updateMenu(menu);
		return CommonUtils.msg(count);
	}

	@Override
	public R batchRemove(Long[] id) {
		int count = wechatMenuManager.batchRemove(id);
		return CommonUtils.msg(id, count);
	}

}
