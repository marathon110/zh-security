package net.zhenghao.zh.shiro.utils;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;

import org.apache.commons.lang.StringUtils;
import org.apache.shiro.codec.Base64;
import org.apache.shiro.session.Session;

/**
 * session序列化工具
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date  :2018年1月5日 下午5:48:32
 * SerializableUtils.java
 */
public class SerializableUtils {

	public static String serialize(Session session) {
		if (null == session) {
			return null;
		}
		try {
			ByteArrayOutputStream bos = new ByteArrayOutputStream();
			ObjectOutputStream oos = new ObjectOutputStream(bos);
			oos.writeObject(session);
			return Base64.encodeToString(bos.toByteArray());
		} catch (Exception e) {
			// TODO: handle exception
			throw new RuntimeException("serialize session error", e);
		}
	}
	
	public static Session deserialize(String sessionStr) {
		if (StringUtils.isBlank(sessionStr)) {
			return null;
		}
		try {
			ByteArrayInputStream bis = new ByteArrayInputStream(Base64.decode(sessionStr));
			ObjectInputStream ois = new ObjectInputStream(bis);
			return (Session) ois.readObject();
		} catch (Exception e) {
			throw new RuntimeException("deserialize session error", e);
		}
	}
}
