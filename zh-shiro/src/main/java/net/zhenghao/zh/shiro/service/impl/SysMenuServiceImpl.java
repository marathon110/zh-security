package net.zhenghao.zh.shiro.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.zhenghao.zh.common.entity.Query;
import net.zhenghao.zh.common.entity.R;
import net.zhenghao.zh.common.utils.CommonUtils;
import net.zhenghao.zh.shiro.entity.SysMenuEntity;
import net.zhenghao.zh.shiro.manager.SysMenuManager;
import net.zhenghao.zh.shiro.service.SysMenuService;

/**
 * 系统菜单
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date  :2017年12月7日 下午2:51:12
 * SysMenuServiceImpl.java
 */
@Service("sysMenuService")
public class SysMenuServiceImpl implements SysMenuService {
	
	@Autowired
	private SysMenuManager sysMenuManager;

	@Override
	public R listUserMenu(Long userId) {
		// TODO Auto-generated method stub
		return R.ok().put("menuList", sysMenuManager.listUserMenu(userId));
	}

	@Override
	public List<SysMenuEntity> listMenu(Map<String, Object> params) {
		// TODO Auto-generated method stub
		Query query = new Query(params);
		List<SysMenuEntity> menuList = sysMenuManager.listMenu(query);
		return menuList;
	}

	@Override
	public R listNotButton() {
		// TODO Auto-generated method stub
		List<SysMenuEntity> menuList = sysMenuManager.listNotButton();
		SysMenuEntity root = new SysMenuEntity();
		root.setMenuId(0L);
		root.setName("一级菜单");
		root.setParentId(-1L);
		root.setOpen(true);
		menuList.add(root);
		return CommonUtils.msgNotNull(menuList);
	}

	@Override
	public R saveMenu(SysMenuEntity menu) {
		// TODO Auto-generated method stub
		int count = sysMenuManager.saveMenu(menu);
		return CommonUtils.msg(count);
	}

	@Override
	public R getMenuById(Long id) {
		// TODO Auto-generated method stub
		SysMenuEntity menu = sysMenuManager.getMenuById(id);
		return CommonUtils.msg(menu);
	}

	@Override
	public R updateMenu(SysMenuEntity menu) {
		// TODO Auto-generated method stub
		int count = sysMenuManager.updateMenu(menu);
		return CommonUtils.msg(count);
	}

	@Override
	public R batchRemove(Long[] id) {
		// TODO Auto-generated method stub
		int count = sysMenuManager.batchRemove(id);
		return CommonUtils.msg(id, count);
	}

}
