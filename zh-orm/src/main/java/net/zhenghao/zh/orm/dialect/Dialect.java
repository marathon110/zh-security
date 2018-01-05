package net.zhenghao.zh.orm.dialect;
/**
 * 数据库方言抽象类
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date  :2017年12月5日 下午3:39:13
 * Dialect.java
 */
public abstract class Dialect {

	/**
	 * 得到分页sql
	 * @param sql
	 * @param offset 偏移量:第一条数据在表中的位置
	 * @param limit
	 * @return
	 */
	public abstract String getLimitString(String sql, int offset, int limit);
	
	/**
	 * 得到sql数量
	 * @param sql
	 * @return
	 */
	public abstract String getCountString(String sql);
}
