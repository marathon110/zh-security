package net.zhenghao.zh.orm.db;

import org.springframework.jdbc.datasource.lookup.AbstractRoutingDataSource;

/**
 * 动态数据源
 * 使用方法
 * 配置所需数据源MultipleDataSource.setDataSource("slaveDataSource");
 * 然后在查询之后清除所有数据源MultipleDataSource.clearDataSource();
 * 可以考虑使用aop 切到在query*方法 设置读取数据源
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date  :2018年1月5日 上午10:55:13
 * DynamicDataSource.java
 */
public class MultipleDataSource extends AbstractRoutingDataSource {

	private static final ThreadLocal<String> CONTEXT_HOLDER = new ThreadLocal<>();
	
	@Override
	protected Object determineCurrentLookupKey() {
		String currDataSource = getDataSource();
		return currDataSource;
	}
	
	/**
	 * 设置数据源
	 * @param dataSource
	 */
	public static void setDataSource(String dataSource) {
		CONTEXT_HOLDER.set(dataSource);
	}
	
	public static String getDataSource() {
		String dataSource = CONTEXT_HOLDER.get();
		//如果没有指定数据源，使用默认数据源
		if (null == dataSource) {
			MultipleDataSource.setDataSource(DataSourceEnum.MASTER.getDefault());
		}
		return CONTEXT_HOLDER.get();
	}
	
	/**
	 * 清除数据源
	 */
	public static void clearDataSource() {
		CONTEXT_HOLDER.remove();
	}

}
