package net.zhenghao.zh.quartz.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.zhenghao.zh.common.entity.Page;
import net.zhenghao.zh.common.entity.Query;
import net.zhenghao.zh.common.entity.R;
import net.zhenghao.zh.common.utils.CommonUtils;
import net.zhenghao.zh.quartz.entity.QuartzJobLogEntity;
import net.zhenghao.zh.quartz.manager.QuartzJobLogManager;
import net.zhenghao.zh.quartz.service.QuartzJobLogService;

/**
 * 定时任务日志
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date  :2018年1月22日 上午10:14:23
 * QuartzJobLogServiceImpl.java
 */
@Service("quartzJobLogService")
public class QuartzJobLogServiceImpl implements QuartzJobLogService {
	
	@Autowired
	private QuartzJobLogManager quartzJobLogManager;

	@Override
	public Page<QuartzJobLogEntity> listForPage(Map<String, Object> params) {
		Query query = new Query(params);
		Page<QuartzJobLogEntity> page = new Page<>(query);
		quartzJobLogManager.listForPage(page, query);
		return page;
	}

	@Override
	public R batchRemove(Long[] id) {
		int count = quartzJobLogManager.batchRemove(id);
		return CommonUtils.msg(count);
	}

	@Override
	public R batchRemoveAll() {
		int count = quartzJobLogManager.batchRemoveAll();
		return CommonUtils.msg(count);
	}

}
