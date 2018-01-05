package net.zhenghao.zh.orm.db;
/**
 * 默认数据库连接资源
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date  :2018年1月5日 上午11:25:01
 * DataSourceEnum.java
 */
public enum DataSourceEnum {

	MASTER("masterDataSource", true),
	
	SLAVE("slaveDataSource", true);
	
	private String name;
	
	private boolean master;
	
	DataSourceEnum(String name, boolean master) {
		this.name = name;
		this.master = master;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public boolean isMaster() {
		return master;
	}

	public void setMaster(boolean master) {
		this.master = master;
	}
	
	public String getDefault() {
		String defaultDataSource = "";
		for (DataSourceEnum dataSourceEnum : DataSourceEnum.values()) {
			if (!"".equals(defaultDataSource)) {
				break;
			}
			if (dataSourceEnum.master) {
				defaultDataSource = dataSourceEnum.getName();
			}
		}
		return defaultDataSource;
	}
}
