package net.zhenghao.zh.orm.aspect;

import java.lang.reflect.Method;

import org.apache.commons.lang.StringUtils;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import net.zhenghao.zh.common.annotation.DataSource;
import net.zhenghao.zh.orm.db.DataSourceEnum;
import net.zhenghao.zh.orm.db.MultipleDataSource;

/**
 * 数据源切面处理
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date  :2018年3月1日 下午3:19:09
 * DataSourceAspect.java
 */
@Aspect
@Component
public class DataSourceAspect {

	private static Logger LOG = LoggerFactory.getLogger(DataSourceAspect.class);
	
	@Pointcut("@annotation(net.zhenghao.zh.common.annotation.DataSource)")
	public void pointCut() {
		
	}
	
	@Around("pointCut()")
	public Object doAround(ProceedingJoinPoint point) throws Throwable {
		MethodSignature signature = (MethodSignature) point.getSignature();
		Method method = signature.getMethod();
		DataSource ds = method.getAnnotation(DataSource.class);
		
		String dataSource = ds.value();
		if (StringUtils.isBlank(dataSource)) {
			MultipleDataSource.setDataSource(DataSourceEnum.MASTER.getName());
			LOG.debug("set datasource is null, use datasource : {}", dataSource);
		} else {
			MultipleDataSource.setDataSource(dataSource);
			LOG.debug("use datasource : {}", dataSource);
		}
		
		try {
			return point.proceed();
		} finally {
			MultipleDataSource.clearDataSource();
			LOG.debug("clear datasource...");
		}
	}
}
