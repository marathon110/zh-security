package net.zhenghao.zh.shiro.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.zhenghao.zh.common.entity.Page;
import net.zhenghao.zh.common.entity.Query;
import net.zhenghao.zh.common.entity.R;
import net.zhenghao.zh.common.utils.CommonUtils;
import net.zhenghao.zh.shiro.entity.SysRoleEntity;
import net.zhenghao.zh.shiro.manager.SysRoleManager;
import net.zhenghao.zh.shiro.service.SysRoleService;

/**
 * 系统角色
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date  :2017年12月7日 上午10:39:00
 * SysRoleServiceImpl.java
 */
@Service("sysRoleService")
public class SysRoleServiceImpl implements SysRoleService {
	
	@Autowired
	private SysRoleManager sysRoleManager;

	@Override
	public Page<SysRoleEntity> listRole(Map<String, Object> params) {
		// TODO Auto-generated method stub
		Query query = new Query(params);
		Page<SysRoleEntity> page = new Page<>(query);
		sysRoleManager.listRole(page, query);
		return page;
	}

	@Override
	public R saveRole(SysRoleEntity role) {
		// TODO Auto-generated method stub
		int count = sysRoleManager.saveRole(role);
		return CommonUtils.msg(count);
	}

	@Override
	public R getRoleById(Long id) {
		// TODO Auto-generated method stub
		SysRoleEntity role = sysRoleManager.getRoleById(id);
		return CommonUtils.msg(role);
	}

	@Override
	public R updateRole(SysRoleEntity role) {
		// TODO Auto-generated method stub
		int count = sysRoleManager.updateRole(role);
		return CommonUtils.msg(count);
	}

	@Override
	public R batchRemove(Long[] id) {
		// TODO Auto-generated method stub
		int count = sysRoleManager.batchRemove(id);
		return CommonUtils.msg(id, count);
	}

	@Override
	public R listRole() {
		// TODO Auto-generated method stub
		List<SysRoleEntity> roleList = sysRoleManager.listRole();
		return CommonUtils.msgNotNull(roleList);
	}

	@Override
	public R updateRoleAuthorization(SysRoleEntity role) {
		// TODO Auto-generated method stub
		int count = sysRoleManager.updateRoleAuthorization(role);
		return CommonUtils.msg(count);
	}

}
