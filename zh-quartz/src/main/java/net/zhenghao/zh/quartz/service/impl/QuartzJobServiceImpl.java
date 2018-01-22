package net.zhenghao.zh.quartz.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;

import org.quartz.CronTrigger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.zhenghao.zh.common.constant.SystemConstant.ScheduleStatus;
import net.zhenghao.zh.common.entity.Page;
import net.zhenghao.zh.common.entity.Query;
import net.zhenghao.zh.common.entity.R;
import net.zhenghao.zh.common.utils.CommonUtils;
import net.zhenghao.zh.quartz.entity.QuartzJobEntity;
import net.zhenghao.zh.quartz.manager.QuartzJobManager;
import net.zhenghao.zh.quartz.service.QuartzJobService;
import net.zhenghao.zh.quartz.utils.ScheduleUtils;

/**
 * 定时任务
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date  :2018年1月18日 上午10:19:05
 * QuartzJobServiceImpl.java
 */
@Service("quartzJobService")
public class QuartzJobServiceImpl implements QuartzJobService {
	
	@Autowired
	private QuartzJobManager quartzJobManager;
	
	/**
	 * 项目启动，初始化任务
	 * 通过 @PostConstruct 和 @PreDestroy 方法 实现初始化和销毁bean之前进行的操作
	 */
	@PostConstruct
	public void init() {
		List<QuartzJobEntity> jobList = quartzJobManager.listNormalJob();
		for (QuartzJobEntity job : jobList) {
			CronTrigger cronTrigger = ScheduleUtils.getCronTrigger(job.getJobId());
			//如果不存在，则创建
			if (cronTrigger == null) {
				ScheduleUtils.createScheduleJob(job);
			} else {
				ScheduleUtils.updateScheduleJob(job);
			}
		}
	}

	@Override
	public Page<QuartzJobEntity> list(Map<String, Object> params) {
		Query query = new Query(params);
		Page<QuartzJobEntity> page = new Page<>(query);
		quartzJobManager.listForPage(page, query);
		return page;
	}

	@Override
	public R saveQuartzJob(QuartzJobEntity job) {
		job.setStatus(ScheduleStatus.NORMAL.getValue());
		int count = quartzJobManager.saveQuartzJob(job);
		ScheduleUtils.createScheduleJob(job);
		return CommonUtils.msg(count);
	}

	@Override
	public R getQuartzJobById(Long jobId) {
		QuartzJobEntity job = quartzJobManager.getQuartzJobById(jobId);
		return CommonUtils.msg(job);
	}

	@Override
	public R updateQuartzJob(QuartzJobEntity job) {
		int count = quartzJobManager.updateQuartzJob(job);
		ScheduleUtils.updateScheduleJob(job);
		return CommonUtils.msg(count);
	}

	@Override
	public R batchRemoveQuartzJob(Long[] id) {
		for(Long jobId : id) {
			ScheduleUtils.deleteScheduleJob(jobId);
		}
		int count = quartzJobManager.batchRemoveQuartzJob(id);
		return CommonUtils.msg(id, count);
	}

	@Override
	public R run(Long[] id) {
		for (Long jobId : id) {
			ScheduleUtils.run(quartzJobManager.getQuartzJobById(jobId));
		}
		return CommonUtils.msg(1);
	}

	@Override
	public R pause(Long[] id) {
		for (Long jobId : id) {
			ScheduleUtils.pauseJob(jobId);
		}
		int count = quartzJobManager.batchUpdate(id,  ScheduleStatus.PAUSE.getValue());
		return CommonUtils.msg(id, count);
	}

	@Override
	public R resume(Long[] id) {
		for (Long jobId : id) {
			ScheduleUtils.resumeJob(jobId);
		}
		int count = quartzJobManager.batchUpdate(id,  ScheduleStatus.NORMAL.getValue());
		return CommonUtils.msg(id, count);
	}

}
