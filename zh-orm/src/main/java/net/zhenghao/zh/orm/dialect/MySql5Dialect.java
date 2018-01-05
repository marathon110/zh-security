package net.zhenghao.zh.orm.dialect;
/**
 * MySQL数据库方言
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date  :2017年12月5日 下午3:38:02
 * MySql5Dialect.java
 */
public class MySql5Dialect extends Dialect {

	protected static final String SQL_END_DELIMITER = ";";
	
	@Override
	public String getLimitString(String sql, int offset, int limit) {
		// TODO Auto-generated method stub
		return MySql5PageHepler.getLimitString(sql, offset, limit);
	}

	@Override
	public String getCountString(String sql) {
		// TODO Auto-generated method stub
		return MySql5PageHepler.getCountString(sql);
	}

}
