package net.zhenghao.zh.quartz.manager;

import java.util.List;

import net.zhenghao.zh.common.entity.Page;
import net.zhenghao.zh.common.entity.Query;
import net.zhenghao.zh.quartz.entity.QuartzJobEntity;

/**
 * 定时任务
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date  :2018年1月18日 上午9:19:47
 * QuartzJobManager.java
 */
public interface QuartzJobManager {

	List<QuartzJobEntity> listForPage(Page<QuartzJobEntity> page, Query query);
	
	List<QuartzJobEntity> listNormalJob();
	
	int saveQuartzJob(QuartzJobEntity job);
	
	QuartzJobEntity getQuartzJobById(Long jobId);
	
	int updateQuartzJob(QuartzJobEntity job);
	
	int batchRemoveQuartzJob(Long[] id);
	
	int batchUpdate(Long[] jobId, Integer status);
	
}
