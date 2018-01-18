package net.zhenghao.zh.quartz.manager.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import net.zhenghao.zh.common.entity.Page;
import net.zhenghao.zh.common.entity.Query;
import net.zhenghao.zh.quartz.dao.QuartzJobLogMapper;
import net.zhenghao.zh.quartz.entity.QuartzJobLogEntity;
import net.zhenghao.zh.quartz.manager.QuartzJobLogManager;

/**
 * 定时任务日志
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date  :2018年1月18日 上午9:41:35
 * QuartzJobManagerImpl.java
 */
@Component("quartzJobLogManager")
public class QuartzJobLogManagerImpl implements QuartzJobLogManager {
	
	@Autowired
	private QuartzJobLogMapper quartzJobLogMapper;

	@Override
	public List<QuartzJobLogEntity> listForPage(Page<QuartzJobLogEntity> page, Query query) {
		return quartzJobLogMapper.listForPage(page, query);
	}

	@Override
	public int saveQuartzJobLog(QuartzJobLogEntity log) {
		return quartzJobLogMapper.save(log);
	}

	@Override
	public int batchRemove(Long[] id) {
		return quartzJobLogMapper.batchRemove(id);
	}

	@Override
	public int batchRemoveAll() {
		return quartzJobLogMapper.batchRemoveAll();
	}
	
}
