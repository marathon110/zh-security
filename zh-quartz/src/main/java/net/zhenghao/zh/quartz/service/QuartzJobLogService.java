package net.zhenghao.zh.quartz.service;

import java.util.Map;

import net.zhenghao.zh.common.entity.Page;
import net.zhenghao.zh.common.entity.R;
import net.zhenghao.zh.quartz.entity.QuartzJobLogEntity;

/**
 * 定时任务日志
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date  :2018年1月22日 上午10:08:54
 * QuartzJobLogService.java
 */
public interface QuartzJobLogService {

	Page<QuartzJobLogEntity> listForPage(Map<String, Object> params);
	
	R batchRemove(Long[] id);
	
	R batchRemoveAll();
	
}
