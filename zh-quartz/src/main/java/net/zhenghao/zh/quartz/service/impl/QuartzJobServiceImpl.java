package net.zhenghao.zh.quartz.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.zhenghao.zh.common.entity.Page;
import net.zhenghao.zh.common.entity.Query;
import net.zhenghao.zh.common.entity.R;
import net.zhenghao.zh.quartz.entity.QuartzJobEntity;
import net.zhenghao.zh.quartz.manager.QuartzJobManager;
import net.zhenghao.zh.quartz.service.QuartzJobService;

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

	@Override
	public Page<QuartzJobEntity> list(Map<String, Object> params) {
		Query query = new Query(params);
		Page<QuartzJobEntity> page = new Page<>(query);
		quartzJobManager.listForPage(page, query);
		return page;
	}

	@Override
	public R saveQuartzJob(QuartzJobEntity job) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public R getQuartzJobById(Long jobId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public R updateQuartzJob(QuartzJobEntity job) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public R batchRemoveQuartzJob(Long[] id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public R run(Long[] id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public R pause(Long[] id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public R resume(Long[] id) {
		// TODO Auto-generated method stub
		return null;
	}

}
