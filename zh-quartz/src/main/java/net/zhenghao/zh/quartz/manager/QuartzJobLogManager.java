package net.zhenghao.zh.quartz.manager;

import java.util.List;

import net.zhenghao.zh.common.entity.Page;
import net.zhenghao.zh.common.entity.Query;
import net.zhenghao.zh.quartz.entity.QuartzJobLogEntity;

/**
 * 定时任务日志
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date  :2018年1月18日 上午9:19:47
 * QuartzJobLogManager.java
 */
public interface QuartzJobLogManager {

	List<QuartzJobLogEntity> listForPage(Page<QuartzJobLogEntity> page, Query query);
	
	int saveQuartzJobLog(QuartzJobLogEntity log);
	
	int batchRemove(Long[] id);
	
	int batchRemoveAll();
	
}
