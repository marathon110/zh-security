package net.zhenghao.zh.quartz.dao;

import org.mybatis.spring.annotation.MapperScan;

import net.zhenghao.zh.common.dao.BaseMapper;
import net.zhenghao.zh.quartz.entity.QuartzJobLogEntity;

/**
 * 定时任务日志
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date  :2018年1月17日 下午4:35:58
 * QuartzJobLogMapper.java
 */
@MapperScan
public interface QuartzJobLogMapper extends BaseMapper<QuartzJobLogEntity> {

	int batchRemoveAll();
	
}
