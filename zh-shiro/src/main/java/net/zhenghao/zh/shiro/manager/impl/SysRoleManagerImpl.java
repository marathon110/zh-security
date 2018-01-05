package net.zhenghao.zh.shiro.manager.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import net.zhenghao.zh.common.entity.Page;
import net.zhenghao.zh.common.entity.Query;
import net.zhenghao.zh.shiro.dao.SysRoleMapper;
import net.zhenghao.zh.shiro.dao.SysRoleMenuMapper;
import net.zhenghao.zh.shiro.dao.SysUserRoleMapper;
import net.zhenghao.zh.shiro.entity.SysRoleEntity;
import net.zhenghao.zh.shiro.manager.SysRoleManager;

/**
 * 系统角色
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date  :2017年12月6日 下午3:21:17
 * SysRoleManagerImpl.java
 */
@Component("sysRoleManager")
public class SysRoleManagerImpl implements SysRoleManager{
	
	@Autowired
	private SysRoleMapper sysRoleMapper;
	
	@Autowired
	private SysUserRoleMapper sysUserRoleMapper;
	
	@Autowired
	private SysRoleMenuMapper sysRoleMenuMapper;

	@Override
	public List<SysRoleEntity> listRole(Page<SysRoleEntity> page, Query search) {
		// TODO Auto-generated method stub
		return sysRoleMapper.listForPage(page, search);
	}

	@Override
	public int saveRole(SysRoleEntity role) {
		// TODO Auto-generated method stub
		return sysRoleMapper.save(role);
	}

	@Override
	public SysRoleEntity getRoleById(Long id) {
		// TODO Auto-generated method stub
		SysRoleEntity role = sysRoleMapper.getObjectById(id);
		List<Long> menuId = sysRoleMenuMapper.listMenuId(id);
		role.setMenuIdList(menuId);
		return role;
	}

	@Override
	public int updateRole(SysRoleEntity role) {
		// TODO Auto-generated method stub
		return sysRoleMapper.update(role);
	}

	@Override
	public int batchRemove(Long[] id) {
		// TODO Auto-generated method stub
		int count = sysRoleMapper.batchRemove(id);
		sysUserRoleMapper.batchRemoveByRoleId(id);
		sysRoleMenuMapper.batchRemoveByRoleId(id);
		return count;
	}

	@Override
	public List<SysRoleEntity> listRole() {
		// TODO Auto-generated method stub
		return sysRoleMapper.list();
	}

	/**
	 * 重新给角色授权
	 * @param role
	 * @return
	 */
	@Override
	public int updateRoleAuthorization(SysRoleEntity role) {
		// TODO Auto-generated method stub
		Long roleId = role.getRoleId();
		sysRoleMenuMapper.remove(roleId);
		Query query = new Query();
		query.put("roleId", roleId);
		query.put("menuIdList", role.getMenuIdList());
		int count = sysRoleMenuMapper.save(query);
		return count;
	}

}
