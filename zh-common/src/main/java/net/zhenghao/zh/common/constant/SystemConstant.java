package net.zhenghao.zh.common.constant;
/**
 * 系统级静态变量
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date  :2017年12月6日 下午2:17:36
 * SystemConstant.java
 */
public class SystemConstant {
	
	/**
	 * 超级管理员ID
	 */
	public static final long SUPER_ADMIN = 1;
	
	/**
	 * 数据标识
	 */
	public static final String DATA_ROWS = "rows";

	/**
	 * 日志类型
	 */
	public enum LogType {
		
		/**
		 * 登录登出日志
		 */
		LOGIN(1),

		/**
		 * 访问日志
		 */
		ACCESS(2),

		/**
		 * 操作日志
		 */
		OPERATION(3),

		/**
		 * 异常日志
		 */
		ERROR(4),

		/**
		 * 授权日志
		 */
		AUTHORIZATION(5);
		
		private int value;
		
		private LogType(int value) {
			this.value = value;
		}
		
		public int getValue() {
			return this.value;
		}
		
	}
	
	/**
	 * 通用变量,表示 可用、禁用、显示、隐藏
	 *
	 * @author:zhaozhenghao
	 * @Email :736720794@qq.com
	 * @date  :2017年12月6日 下午2:17:36
	 * SystemConstant.java
	 */
	public enum StatusType {
		
		/**
		 * 禁用,隐藏,失败
		 */
		DISABLE(0),
		
		/**
		 * 可用,显示,成功
		 */
		ENABLE(1),
		
		/**
		 * 显示
		 */
		SHOW(1),
		
		/**
		 * 隐藏
		 */
		HIDDEN(0);
		
		private int value;
		
		private StatusType(int value) {
			this.value = value;
		}
		
		public int getValue() {
			return value;
		}
	}
	
	
	
	
	
	/**
	 * 菜单类型
	 *
	 * @author:zhaozhenghao
	 * @Email :736720794@qq.com
	 * @date  :2017年12月6日 下午4:29:36
	 * SystemConstant.java
	 */
	public enum MenuType {
		
		/**
		 * 目录
		 */
		CATALOG(0),
		
		/**
		 * 菜单
		 */
		MENU(1),
		
		/**
		 * 按钮
		 */
		BUTTON(2);
		
		private int value;
		
		private MenuType(int value) {
			this.value = value;
		}
		
		public int getValue() {
			return value;
		}
	}
}
