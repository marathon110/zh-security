package net.zhenghao.zh.shiro.listener;

import org.apache.shiro.session.Session;
import org.apache.shiro.session.SessionListener;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * session监听器
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date  :2018年1月8日 上午10:23:15
 * UserSessionListener.java
 */
public class UserSessionListener implements SessionListener {

	private static final Logger logger = LoggerFactory.getLogger(UserSessionListener.class);
	
	@Override
	public void onStart(Session session) {
		// TODO Auto-generated method stub
		logger.debug("会话创建：{}", session.getId());
	}

	@Override
	public void onStop(Session session) {
		// TODO Auto-generated method stub
		logger.debug("会话停止：{}", session.getId());
	}

	@Override
	public void onExpiration(Session session) {
		// TODO Auto-generated method stub
		logger.debug("会话过期：{}", session.getId());
	}

}
