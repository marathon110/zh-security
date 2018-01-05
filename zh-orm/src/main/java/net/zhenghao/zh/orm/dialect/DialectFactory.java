package net.zhenghao.zh.orm.dialect;

import org.apache.ibatis.session.Configuration;

/**
 * 数据库方言工厂,产生方言对象
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date  :2017年12月6日 上午9:47:45
 * DialectFactory.java
 */
public class DialectFactory {

	public static String dialectClass = null;
	
	public static Dialect buildDialect(Configuration configuration) {
		if (dialectClass == null) {
			synchronized (DialectFactory.class) {
				if (dialectClass == null) {
					dialectClass = configuration.getVariables().getProperty("dialectClass");
				}
			}
		}
		
		Dialect dialect = null;
		
		try {
			dialect = (Dialect) Class.forName(dialectClass).newInstance();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
            System.err.println("请检查 mybatis-config.xml 中  dialectClass 是否配置正确?");
		}
		return dialect;
	}
}
