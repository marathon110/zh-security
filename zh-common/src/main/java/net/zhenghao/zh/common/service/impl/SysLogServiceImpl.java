package net.zhenghao.zh.common.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.zhenghao.zh.common.entity.Page;
import net.zhenghao.zh.common.entity.Query;
import net.zhenghao.zh.common.entity.R;
import net.zhenghao.zh.common.entity.SysLogEntity;
import net.zhenghao.zh.common.manager.SysLogManager;
import net.zhenghao.zh.common.service.SysLogService;
import net.zhenghao.zh.common.utils.CommonUtils;

/**
 * 系统日志
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date  :2017年11月22日 下午2:08:50
 * SysLogServiceImpl.java
 */
@Service("SysLogService")
public class SysLogServiceImpl implements SysLogService{

	@Autowired
	private SysLogManager sysLogManager;
	
	@Override
	public Page<SysLogEntity> listLog(Map<String, Object> params) {
		Query query = new Query(params);
		Page<SysLogEntity> page = new Page<>(query);//将查询条件页码数传入page类中
		sysLogManager.listLog(page, query);
		return page;
	}

	@Override
	public R batchRemove(Long[] id) {
		int count = sysLogManager.batchRemove(id);
		return CommonUtils.msg(id, count);
	}

	@Override
	public R batchRemoveAll() {
		int count = sysLogManager.batchRemoveAll();
		return CommonUtils.msg(count);
	}

}
