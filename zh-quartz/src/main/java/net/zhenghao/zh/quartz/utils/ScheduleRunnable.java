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

}
