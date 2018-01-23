package net.zhenghao.zh.quartz.utils;

import java.lang.reflect.Method;

import org.apache.commons.lang.StringUtils;
import org.springframework.util.ReflectionUtils;

import net.zhenghao.zh.common.exception.RRException;
import net.zhenghao.zh.common.utils.SpringContextUtils;

/**
 * 执行定时任务
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date  :2018年1月18日 上午11:34:03
 * ScheduleRunnable.java
 */
public class ScheduleRunnable implements Runnable {

	private Object target;
	
	private Method method;
	
	private String params;
	
	public ScheduleRunnable(String beanName, String methodName, String params) throws NoSuchMethodException, SecurityException {
		this.target = SpringContextUtils.getBean(beanName);
		this.params = params;
		
		if (StringUtils.isNotBlank(params)) {
			//方法返回一个Method对象，它反映此Class对象所表示的类或接口的指定已声明方法
			this.method = target.getClass().getDeclaredMethod(methodName, String.class);
		} else {
			this.method = target.getClass().getDeclaredMethod(methodName);
		}
	}
	
	@Override
	public void run() {
		try {
			//这里具体的实例化是利用cglib类库，通过Java反射原理，构造函数实例化方式实例化
			//让给定的方法可以访问，如果需要，可以显式地设置它。
			ReflectionUtils.makeAccessible(method);
			if (StringUtils.isNotBlank(params)) {
				method.invoke(target, params);
			} else {
				method.invoke(target);
			}
		} catch (Exception e) {
			throw new RRException("执行定时任务失败", e);
		}
	}
	/**
	 * JAVA反射机制是在运行状态中，对于任意一个类，都能够知道这个类的所有属性和方法；对于任意一个对象，
	 * 都能够调用它的任意一个方法；这种动态获取的信息以及动态调用对象的方法的功能称为java语言的反射机制。
	 * 
	 * Java反射机制主要提供了以下功能： 在运行时判断任意一个对象所属的类；在运行时构造任意一个类的对象；
	 * 在运行时判断任意一个类所具有的成员变量和方法；在运行时调用任意一个对象的方法；生成动态代理。
	 */

}
