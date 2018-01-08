package net.zhenghao.zh.shiro.session;

import java.io.Serializable;
import java.util.Date;
import java.util.Map;

import org.apache.shiro.session.mgt.SimpleSession;

/**
 * 由于SimpleSession lastAccessTime更改后也会调用SessionDao update方法，
 * 增加标识位，如果只是更新lastAccessTime SessionDao update方法直接返回
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date  :2018年1月5日 下午5:12:03
 * UserSession.java
 */
public class UserSession extends SimpleSession implements Serializable {

	private boolean isChanged;
	
	
	public UserSession() {
		super();
		this.setChanged(true);
	}

	@Override
	public void setId(Serializable id) {
		// TODO Auto-generated method stub
		super.setId(id);
		this.setChanged(true);
	}

	@Override
	public void setStartTimestamp(Date startTimestamp) {
		// TODO Auto-generated method stub
		super.setStartTimestamp(startTimestamp);
		this.setChanged(true);
	}

	@Override
	public void setExpired(boolean expired) {
		// TODO Auto-generated method stub
		super.setExpired(expired);
		this.setChanged(true);
	}

	@Override
	public void setTimeout(long timeout) {
		// TODO Auto-generated method stub
		super.setTimeout(timeout);
		this.setChanged(true);
	}

	@Override
	public void setHost(String host) {
		// TODO Auto-generated method stub
		super.setHost(host);
		this.setChanged(true);
	}

	@Override
	public void setAttributes(Map<Object, Object> attributes) {
		// TODO Auto-generated method stub
		super.setAttributes(attributes);
		this.setChanged(true);
	}

	@Override
	public void stop() {
		// TODO Auto-generated method stub
		super.stop();
		this.setChanged(true);
	}

	@Override
	protected void expire() {
		// TODO Auto-generated method stub
		super.expire();
		this.setChanged(true);
	}

	@Override
	public void setAttribute(Object key, Object value) {
		// TODO Auto-generated method stub
		super.setAttribute(key, value);
		this.setChanged(true);
	}

	@Override
	public Object removeAttribute(Object key) {
		// TODO Auto-generated method stub
		this.setChanged(true);
		return super.removeAttribute(key);
	}

	@Override
	public boolean equals(Object obj) {
		// TODO Auto-generated method stub
		return super.equals(obj);
	}

	@Override
	protected boolean onEquals(SimpleSession ss) {
		// TODO Auto-generated method stub
		return super.onEquals(ss);
	}

	@Override
	public int hashCode() {
		// TODO Auto-generated method stub
		return super.hashCode();
	}

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return super.toString();
	}

	public boolean isChanged() {
		return isChanged;
	}

	public void setChanged(boolean isChanged) {
		this.isChanged = isChanged;
	}
	
}
