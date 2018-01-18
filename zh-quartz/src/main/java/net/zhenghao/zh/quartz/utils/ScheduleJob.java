package net.zhenghao.zh.quartz.utils;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;

import org.apache.commons.lang.StringUtils;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.quartz.QuartzJobBean;

import net.zhenghao.zh.common.utils.SpringContextUtils;
import net.zhenghao.zh.quartz.entity.QuartzJobEntity;
import net.zhenghao.zh.quartz.entity.QuartzJobLogEntity;
import net.zhenghao.zh.quartz.manager.QuartzJobLogManager;

/**
 * 定时任务
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date  :2018年1月18日 上午11:05:42
 * ScheduleJob.java
 */
public class ScheduleJob extends QuartzJobBean {

	private Logger logger = LoggerFactory.getLogger(getClass());
	
	//返回一个线程池（这个线程池只有一个线程）,这个线程池可以在线程死后（或发生异常时）重新启动一个线程来替代原来的线程继续执行下去！
	private ExecutorService service = Executors.newSingleThreadExecutor();
	
	@Override
	protected void executeInternal(JobExecutionContext context) throws JobExecutionException {
		
		QuartzJobEntity scheduleJob = (QuartzJobEntity) context.getMergedJobDataMap().get(QuartzJobEntity.JOB_PARAM_KEY);
		
		//获取spring bean
		QuartzJobLogManager quartzJobLogManager = (QuartzJobLogManager) SpringContextUtils.getBean("quartzJobLogManager");
		
		//数据库保存执行记录
		QuartzJobLogEntity log = new QuartzJobLogEntity();
		log.setJobId(scheduleJob.getJobId());
		log.setBeanName(scheduleJob.getBeanName());
		log.setMethodName(scheduleJob.getMethodName());
		log.setParams(scheduleJob.getParams());
		
		//任务开始时间
        long startTime = System.currentTimeMillis();
        
        try {
			//执行任务
        	logger.info("任务准备执行，任务ID：" + scheduleJob.getJobId());
        	ScheduleRunnable task = new ScheduleRunnable(scheduleJob.getBeanName(), scheduleJob.getMethodName(),
        			scheduleJob.getParams());
        	/**
        	 * Future类位于java.util.concurrent包下，Future就是对于具体的Runnable或者Callable任务的执行结果进行取消、查询是否完成、获取结果，
        	 * 其cancel()方法的参数mayInterruptIfRunning表示是否允许取消正在执行却没有执行完毕的任务，如果设置为true，则表示可以取消正在执行过程中的任务；
        	 * get()方法用来获取执行结果，该方法会阻塞直到任务返回结果。
        	 */
        	Future<?> future = service.submit(task);
        	
        	future.get();
        	
        	//任务执行总时长
			long times = System.currentTimeMillis() - startTime;
			log.setTimes((int)times);
			//任务状态    0：失败    1：成功
			log.setStatus(1);
			
			logger.info("任务执行完毕，任务ID：" + scheduleJob.getJobId() + "  总共耗时：" + times + "毫秒");
			
		} catch (Exception e) {
			
			logger.error("任务执行失败，任务ID：" + scheduleJob.getJobId(), e);
			
			//任务执行总时长
			long times = System.currentTimeMillis() - startTime;
			log.setTimes((int)times);
			
			//任务状态    0：失败    1：成功
			log.setStatus(0);
			log.setError(StringUtils.substring(e.toString(), 0, 2000));
		} finally {
			quartzJobLogManager.saveQuartzJobLog(log);
		}
		
	}

}
