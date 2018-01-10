package net.zhenghao.zh.generator.entity;
/**
 * 代码生成器请求参数
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date  :2018年1月10日 下午1:21:57
 * GeneratorParamEntity.java
 */
public class GeneratorParamEntity {

	private String[] tables;
	
	/**
	 * 系统模块，用户管理shiro
	 */
	private String module;
	
	/**
	 * 功能编码，用户管理user
	 */
	private String functionCode;
	
	/**
	 * 后台请求地址，用户管理sys/user
	 */
	private String requestMapping;
	
	/**
	 * 页面路径，用户管理base/user
	 */
	private String viewPath;
	
	/**
	 * 生成类型，1：生成包结构，2：只生成源代码
	 */
	private String type;

	public GeneratorParamEntity() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String[] getTables() {
		return tables;
	}

	public void setTables(String[] tables) {
		this.tables = tables;
	}

	public String getModule() {
		return module;
	}

	public void setModule(String module) {
		this.module = module;
	}

	public String getFunctionCode() {
		return functionCode;
	}

	public void setFunctionCode(String functionCode) {
		this.functionCode = functionCode;
	}

	public String getRequestMapping() {
		return requestMapping;
	}

	public void setRequestMapping(String requestMapping) {
		this.requestMapping = requestMapping;
	}

	public String getViewPath() {
		return viewPath;
	}

	public void setViewPath(String viewPath) {
		this.viewPath = viewPath;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	
}
