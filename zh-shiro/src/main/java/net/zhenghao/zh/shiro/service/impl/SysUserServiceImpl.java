package net.zhenghao.zh.shiro.service.impl;

import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.zhenghao.zh.common.entity.Page;
import net.zhenghao.zh.common.entity.Query;
import net.zhenghao.zh.common.entity.R;
import net.zhenghao.zh.common.entity.SysUserEntity;
import net.zhenghao.zh.common.utils.CommonUtils;
import net.zhenghao.zh.common.utils.MD5Utils;
import net.zhenghao.zh.shiro.manager.SysUserManager;
import net.zhenghao.zh.shiro.service.SysUserService;

/**
 *
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date  :2017年12月7日 上午9:10:21
 * SysUserServiceImpl.java
 */
@Service("sysUserService")
public class SysUserServiceImpl implements SysUserService {
	
	@Autowired
	private SysUserManager sysUserManager;

	@Override
	public Page<SysUserEntity> listUser(Map<String, Object> params) {
		// TODO Auto-generated method stub
		Query form = new Query(params);
		Page<SysUserEntity> page = new Page<>(form);
		sysUserManager.listUser(page, form);
		return page;
	}

	@Override
	public R saveUser(SysUserEntity user) {
		// TODO Auto-generated method stub
		user.setPassword(MD5Utils.encrypt(user.getUsername(), user.getPassword()));
		int count = sysUserManager.saveUser(user);
		return CommonUtils.msg(count);
	}

	@Override
	public R getUserById(Long userId) {
		// TODO Auto-generated method stub
		SysUserEntity user = sysUserManager.getById(userId);
		return CommonUtils.msg(user);
	}

	@Override
	public R updateUser(SysUserEntity user) {
		// TODO Auto-generated method stub
		int count = sysUserManager.updateUser(user);
		return CommonUtils.msg(count);
	}

	@Override
	public R batchRemove(Long[] id) {
		// TODO Auto-generated method stub
		int count = sysUserManager.batchRemove(id);
		return CommonUtils.msg(id, count);
	}

	@Override
	public R listUserPerms(Long userId) {
		// TODO Auto-generated method stub
		Set<String> perms = sysUserManager.listUserPerms(userId);//得到用户下所有的按钮权限等
		return CommonUtils.msgNotNull(perms);
	}

	@Override
	public R updatePswdByUser(SysUserEntity user) {
		// TODO Auto-generated method stub
		String username = user.getUsername();
		String pswd = user.getPassword();
		String newPswd = user.getEmail();
		pswd = MD5Utils.encrypt(username, pswd);
		newPswd = MD5Utils.encrypt(username, newPswd);
		Query query = new Query();
		query.put("userId", user.getUserId());
		query.put("pswd", pswd);
		query.put("newPswd", newPswd);
		int count = sysUserManager.updatePswdByUser(query);
		if(!CommonUtils.isIntThanZero(count)) {
			return R.error("原密码错误");
		}
		return CommonUtils.msg(count);
	}

	@Override
	public R updateUserEnable(Long[] id) {
		// TODO Auto-generated method stub
		int count = sysUserManager.updateUserEnable(id);
		return CommonUtils.msg(id, count);
	}

	@Override
	public R updateUserDisable(Long[] id) {
		// TODO Auto-generated method stub
		int count = sysUserManager.updateUserDisable(id);
		return CommonUtils.msg(id, count);
	}

	@Override
	public R updatePswd(SysUserEntity user) {
		// TODO Auto-generated method stub
		SysUserEntity currUser = sysUserManager.getUserById(user.getUserId());
		user.setPassword(MD5Utils.encrypt(currUser.getUsername(), user.getPassword()));
		int count = sysUserManager.updatePswd(user);
		return CommonUtils.msg(count);
	}

}
