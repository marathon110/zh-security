package net.zhenghao.zh.shiro.session;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.session.Session;
import org.apache.shiro.session.mgt.SessionContext;
import org.apache.shiro.session.mgt.SessionFactory;
import org.apache.shiro.web.session.mgt.DefaultWebSessionContext;

import net.zhenghao.zh.common.utils.IPUtils;

/**
 * session工厂
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date  :2018年1月8日 上午10:14:13
 * UserSessionFactory.java
 */
public class UserSessionFactory implements SessionFactory {

	@Override
	public Session createSession(SessionContext initData) {
		// TODO Auto-generated method stub
		UserSession session = new UserSession();
		HttpServletRequest request = (HttpServletRequest) initData.get(DefaultWebSessionContext.class.getName() + ".SERVLET_REQUEST");
		session.setHost(IPUtils.getIpAddr(request));
		return session;
	}

}
