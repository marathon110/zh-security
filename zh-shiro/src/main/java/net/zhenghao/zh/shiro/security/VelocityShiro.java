package net.zhenghao.zh.shiro.security;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;

/**
 * shiro权限标签(Velocity版)
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date  :2017年12月8日 上午11:13:40
 * VelocityShiro.java
 */
public class VelocityShiro {

	/**
	 * 是否拥有该权限
	 * @param permission 权限标识
	 * @return true：是     false：否
	 * subject.isPermitted(permission)
	 * 这个权限标识在不在这个subject 中
	 */
	public boolean hasPermission(String permission) {
		Subject subject = SecurityUtils.getSubject();
		return subject != null && subject.isPermitted(permission);
	}
}
