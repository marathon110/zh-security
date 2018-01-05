package net.zhenghao.zh.common.aspect;

import java.lang.reflect.Method;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import net.zhenghao.zh.common.annotation.SysLog;
import net.zhenghao.zh.common.entity.SysLogEntity;
import net.zhenghao.zh.common.entity.SysUserEntity;
import net.zhenghao.zh.common.manager.SysLogManager;
import net.zhenghao.zh.common.utils.CommonUtils;
import net.zhenghao.zh.common.utils.HttpContextUtils;
import net.zhenghao.zh.common.utils.IPUtils;
import net.zhenghao.zh.common.utils.JSONUtils;
import net.zhenghao.zh.common.utils.ShiroUtils;

/**
 * 系统日志,切面处理类
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date  :2017年11月30日 下午1:33:58
 * SysLogAspect.java
 */
@Aspect
@Component
public class SysLogAspect {

	@Autowired
	private SysLogManager sysLogManager;
	
	@Pointcut("@annotation(net.zhenghao.zh.common.annotation.SysLog)")
	public void logPointCut() {
		
	}
	
	@Around("logPointCut()")
	public Object around(ProceedingJoinPoint point) throws Throwable {
		long beginTime = System.currentTimeMillis();
		//执行方法(这里应该是获取被注解的方法执行时长)
		Object result = point.proceed();
		//执行时长(毫秒)
		long time = System.currentTimeMillis() - beginTime;
		saveSysLog(point, time);
		return result;
	}
	
	
	private void saveSysLog(ProceedingJoinPoint joinPoint, long time) {
		//反射获取一个方法中的参数名（不是类型）
		MethodSignature signature = (MethodSignature) joinPoint.getSignature();
		Method method = signature.getMethod();
		SysLogEntity sysLog = new SysLogEntity();
		SysLog syslog = method.getAnnotation(SysLog.class);
		if (syslog != null) {
			//获取注解上面的描述,set到sysLog类中
			sysLog.setOperation(syslog.value());
		}
		//请求的方法名
		//例:net.zhenghao.zh.common.controller.SysLogController
		String className = joinPoint.getTarget().getClass().getName();
		//例:batchRemoveAll
		String methodName = signature.getName();
		sysLog.setMethod(className + "." + methodName + "()");
		//请求的参数
		Object[] args = joinPoint.getArgs();
		try {
			String params = JSONUtils.beanToJson(args[0]);
			sysLog.setParams(params);
		} catch (Exception e) {
			// TODO: handle exception
		}
		//获取request
		HttpServletRequest request = HttpContextUtils.getHttpServletRequest();
		//设置IP地址
		sysLog.setIp(IPUtils.getIpAddr(request));
		
		//用户名
		SysUserEntity currUser = ShiroUtils.getUserEntity();
		if (CommonUtils.isNullOrEmpty(currUser)) {
			if (CommonUtils.isNullOrEmpty(sysLog.getParams())) {
				sysLog.setUserId(-1L);
				sysLog.setUsername(sysLog.getParams());
			} else {
				sysLog.setUserId(-1L);
				sysLog.setUsername("获取用户信息为空");
			}
		} else {
			//不明白原作者为什么要重新去ShiroUtils里面拿对象
			sysLog.setUserId(currUser.getUserId());
			sysLog.setUsername(currUser.getUsername());
		}
		sysLog.setTime(time);
		//保存系统日志
		sysLogManager.saveLog(sysLog);
	}
	
}
