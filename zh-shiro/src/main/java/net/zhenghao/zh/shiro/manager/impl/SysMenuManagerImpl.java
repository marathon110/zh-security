package net.zhenghao.zh.shiro.manager.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import net.zhenghao.zh.common.constant.SystemConstant.MenuType;
import net.zhenghao.zh.common.entity.Query;
import net.zhenghao.zh.shiro.dao.SysMenuMapper;
import net.zhenghao.zh.shiro.dao.SysRoleMenuMapper;
import net.zhenghao.zh.shiro.dao.SysUserMapper;
import net.zhenghao.zh.shiro.entity.SysMenuEntity;
import net.zhenghao.zh.shiro.manager.SysMenuManager;

/**
 * 系统菜单
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date  :2017年12月6日 下午3:45:23
 * SysMenuManagerImpl.java
 */
@Component("sysMenuManager")
public class SysMenuManagerImpl implements SysMenuManager {
	
	@Autowired
	private SysUserMapper sysUserMapper;
	
	@Autowired
	private SysMenuMapper sysMenuMapper;
	
	@Autowired
	private SysRoleMenuMapper sysRoleMenuMapper;

	/**
	 * 查询该用户所能得到的菜单
	 * @param userId
	 * @return
	 */
	@Override
	public List<SysMenuEntity> listUserMenu(Long userId) {
		// TODO Auto-generated method stub
		List<Long> menuIdList = sysUserMapper.listAllMenuId(userId);
		return getAllMenuList(menuIdList);
	}
	
	private List<SysMenuEntity> getAllMenuList(List<Long> menuIdList) {
		//查询根菜单列表
		List<SysMenuEntity> menuList = listParentId(0L, menuIdList);
		//递归查询子菜单,将子菜单信息set到menuList中
		getMenuTreeList(menuList, menuIdList);
		
		return menuList;
	}
	
	/**
	 * 递归查询菜单
	 * @param menuList
	 * @param menuIdList
	 * @return
	 */
	private List<SysMenuEntity> getMenuTreeList(List<SysMenuEntity> menuList, List<Long> menuIdList) {
		List<SysMenuEntity> subMenuList = new ArrayList<SysMenuEntity>();
		
		for(SysMenuEntity menu : menuList){
			if (menu.getType() == MenuType.CATALOG.getValue()) {
				//如果当前循环的菜单是一个目录,则递归继续查询
				menu.setList(getMenuTreeList(listParentId(menu.getMenuId(), menuIdList),menuIdList));
			}
			subMenuList.add(menu);
		}
		return subMenuList;
	}
	
	

	/**
	 * 根据父id 查询改id下所有菜单
	 * @param parentId
	 * @param menuIdList
	 * @return
	 */
	@Override
	public List<SysMenuEntity> listParentId(Long parentId, List<Long> menuIdList) {
		// TODO Auto-generated method stub
		List<SysMenuEntity> menuList = sysMenuMapper.listParentId(parentId);
		if (menuIdList == null) {
			return menuList;
		}
		List<SysMenuEntity> userMenuList = new ArrayList<>();
		for (SysMenuEntity menu : menuList) {
			if (menuIdList.contains(menu.getMenuId())) {
				userMenuList.add(menu);
			}
		}
		return userMenuList;
	}

	@Override
	public List<SysMenuEntity> listMenu(Query search) {
		// TODO Auto-generated method stub
		return sysMenuMapper.list(search);
	}

	@Override
	public List<SysMenuEntity> listNotButton() {
		// TODO Auto-generated method stub
		return sysMenuMapper.listNotButton();
	}
	
	@Override
	public int saveMenu(SysMenuEntity menu) {
		return sysMenuMapper.save(menu);
	}

	@Override
	public SysMenuEntity getMenuById(Long id) {
		// TODO Auto-generated method stub
		return sysMenuMapper.getObjectById(id);
	}

	@Override
	public int updateMenu(SysMenuEntity menu) {
		// TODO Auto-generated method stub
		return sysMenuMapper.update(menu);
	}

	@Override
	public int batchRemove(Long[] id) {
		// TODO Auto-generated method stub
		int count = sysMenuMapper.batchRemove(id);
		sysRoleMenuMapper.batchRemoveByMenuId(id);
		return count;
	}

}
