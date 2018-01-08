package net.zhenghao.zh.shiro.session;

import java.io.Serializable;

import javax.servlet.ServletRequest;

import org.apache.shiro.session.Session;
import org.apache.shiro.session.UnknownSessionException;
import org.apache.shiro.session.mgt.SessionKey;
import org.apache.shiro.web.session.mgt.DefaultWebSessionManager;
import org.apache.shiro.web.session.mgt.WebSessionKey;

/**
 * 会话管理器
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date  :2018年1月5日 下午4:42:46
 * UserSessionManager.java
 */
public class UserSessionManager extends DefaultWebSessionManager {

	/**
	 * 获取session
	 * 优化单次请求需要多次访问redis的问题
	 * @param sessionKey
	 * @return
	 * @throws UnknownSessionException
	 */
	@Override
	protected Session retrieveSession(SessionKey sessionKey) throws UnknownSessionException {
		// TODO Auto-generated method stub
		Serializable sessionId = getSessionId(sessionKey);
		
		ServletRequest request = null;
		if (sessionKey instanceof WebSessionKey) {
			request = ((WebSessionKey) sessionKey).getServletRequest();
		}
		
		if (request != null && null != sessionId) {
			Object sessionObj = request.getAttribute(sessionId.toString());
			if (sessionObj != null) {
				return (Session) sessionObj;
			}
		}
		
		Session session = super.retrieveSession(sessionKey);
		if (request != null && null != sessionId) {
			request.setAttribute(sessionId.toString(), session);
		}
		return session;
	}

}
