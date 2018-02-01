package net.zhenghao.zh.file.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.zhenghao.zh.common.entity.Page;
import net.zhenghao.zh.common.entity.Query;
import net.zhenghao.zh.common.entity.R;
import net.zhenghao.zh.common.utils.CommonUtils;
import net.zhenghao.zh.file.entity.SysFileEntity;
import net.zhenghao.zh.file.manager.SysFileManager;
import net.zhenghao.zh.file.service.SysFileService;

/**
 * 文件管理
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date  :2018年2月01日 上午9:57:54
 * SysFileServiceImpl.java
 */
@Service("sysFileService")
public class SysFileServiceImpl implements SysFileService {

	@Autowired
	private SysFileManager sysFileManager;
	
	@Override
	public Page<SysFileEntity> listSysFile(Map<String, Object> params) {
		Query query = new Query(params);
		Page<SysFileEntity> page = new Page<>(query);
		sysFileManager.listSysFile(page, query);
		return page;
	}

	@Override
	public R saveSysFile(SysFileEntity role) {
		int count = sysFileManager.saveSysFile(role);
		return CommonUtils.msg(count);
	}

	@Override
	public R getSysFileById(Long id) {
		SysFileEntity sysFile = sysFileManager.getSysFileById(id);
		return CommonUtils.msg(sysFile);
	}

	@Override
	public R updateSysFile(SysFileEntity sysFile) {
		int count = sysFileManager.updateSysFile(sysFile);
		return CommonUtils.msg(count);
	}

	@Override
	public R batchRemove(Long[] id) {
		int count = sysFileManager.batchRemove(id);
		return CommonUtils.msg(id, count);
	}
	
}