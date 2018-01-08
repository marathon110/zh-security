package net.zhenghao.zh.shiro.session;

import java.io.Serializable;

import org.apache.commons.lang.StringUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.session.UnknownSessionException;
import org.apache.shiro.session.mgt.ValidatingSession;
import org.apache.shiro.session.mgt.eis.EnterpriseCacheSessionDAO;
import org.apache.shiro.subject.support.DefaultSubjectContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import net.zhenghao.zh.common.utils.RedisUtils;
import net.zhenghao.zh.shiro.utils.SerializableUtils;

/**
 * 基于redis的sessionDAO
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date  :2018年1月5日 下午4:44:55
 * UserSessionDao.java
 */
public class UserSessionDAO extends EnterpriseCacheSessionDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(UserSessionDAO.class);
	
	private static final String SHIRO_SESSION_ID = "zh-shiro-session-id_";

	/**
	 * 创建session，保存到redis
     * @param session
     * @return
	 */
	@Override
	protected Serializable doCreate(Session session) {
		// TODO Auto-generated method stub
		Serializable sessionId = super.doCreate(session);
		assignSessionId(session, sessionId);
		try {
			String sessionKey = generateSessionKey(sessionId);
			setSession(sessionKey, session);
			logger.debug("doCreate >>>>> sessionId:{}", session.getId());
		} catch (Exception e) {
			// TODO: handle exception
			logger.warn("创建session失败", e.getMessage());
		}
		return sessionId;
	}

	/**
	 * 获取session
     * @param sessionId
     * @return
	 */
	@Override
	protected Session doReadSession(Serializable sessionId) {
		// TODO Auto-generated method stub
		Session session = null;
		try {
			session = getSession(generateSessionKey(sessionId));
			logger.debug("doReadSession >>>>> sessionId：{}", session.getId());
		} catch (Exception e) {
			// TODO: handle exception
			logger.warn("读取session失败", e.getMessage());
		}
		return session;
	}

	/**
     * 更新session的最后一次访问时间
     * @param session
     */
	@Override
	protected void doUpdate(Session session) {
		try {
			//如果会话过期/停止 没必要更新
			if (session instanceof ValidatingSession && !((ValidatingSession)session).isValid()) {
				return;
			}
		} catch (Exception e) {
			// TODO: handle exception
			logger.warn("验证session失败", e.getMessage());
		}
		
		try {
			if (session instanceof UserSession) {
				//如果没有主要字段(除lastAccessTime以外其他字段)发生改变
				UserSession userSession = (UserSession) session;
				if (!userSession.isChanged()) {
					//说明除lastAccessTime以外其他字段没变
					return;
				}
				String sessionKey = generateSessionKey(session);
				setSession(sessionKey, session);
				logger.debug("doUpdate >>>>> sessionId:{}", session.getId());
			}
		} catch (Exception e) {
			// TODO: handle exception
			logger.warn("更新session失败", e.getMessage());
		}
	}

	/**
	 * 删除session
	 * @param session
	 */
	@Override
	protected void doDelete(Session session) {
		// TODO Auto-generated method stub
		try {
			super.doDelete(session);
			String sessionKey = generateSessionKey(session);
			RedisUtils.remove(sessionKey);
			logger.debug("doDelete >>>>> sessionId:{}", session.getId());
		} catch (Exception e) {
			// TODO: handle exception
			logger.warn("删除session失败", e.getMessage());
		}
	}

	/**
	 * 如果Session中没有登陆信息就调用doReadSession方法从Redis中重新读取
	 * @param sessionId
	 * @return
	 */
	@Override
	public Session readSession(Serializable sessionId) throws UnknownSessionException {
		// TODO Auto-generated method stub
		Session session = getCachedSession(sessionId);
		if (session == null || session.getAttribute(DefaultSubjectContext.PRINCIPALS_SESSION_KEY) == null) {
			session = this.doReadSession(sessionId);
			if (session == null) {
				throw new UnknownSessionException("There is no session with id: {" + sessionId + "}");
			} else {
				cache(session, session.getId());
			}
		}
		return session;
	}
	
	private Session getSession(String key) {
		String session = RedisUtils.get(key);
		if (StringUtils.isNotEmpty(session)) {
			return SerializableUtils.deserialize(session);
		} else {
			return null;
		}
	}
	
	private void setSession(String key, Session session) {
        RedisUtils.set(key, SerializableUtils.serialize(session), (int) session.getTimeout() / 1000);
    }
	
    private String generateSessionKey(Session session) {
        return SHIRO_SESSION_ID + session.getId();
    }

    private String generateSessionKey(Serializable sessionId) {
        return SHIRO_SESSION_ID + sessionId;
    }
}
