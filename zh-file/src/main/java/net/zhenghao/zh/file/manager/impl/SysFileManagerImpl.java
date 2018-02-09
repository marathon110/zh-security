package net.zhenghao.zh.file.manager.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import net.zhenghao.zh.common.entity.Page;
import net.zhenghao.zh.common.entity.Query;
import net.zhenghao.zh.file.dao.SysFileMapper;
import net.zhenghao.zh.file.entity.SysFileEntity;
import net.zhenghao.zh.file.manager.SysFileManager;

/**
 * 文件管理
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date  :2018年2月01日 上午9:57:54
 * SysFileManagerImpl.java
 */
@Component("sysFileManager")
public class SysFileManagerImpl implements SysFileManager {

	@Autowired
	private SysFileMapper sysFileMapper;
	
	@Override
	public List<SysFileEntity> listSysFile(Page<SysFileEntity> page, Query search) {
		return sysFileMapper.listForPage(page, search);
	}

	@Override
	public int saveSysFile(SysFileEntity sysFile) {
		return sysFileMapper.save(sysFile);
	}

	@Override
	public SysFileEntity getSysFileById(Long id) {
		SysFileEntity sysFile = sysFileMapper.getObjectById(id);
		return sysFile;
	}

	@Override
	public int updateSysFile(SysFileEntity sysFile) {
		return sysFileMapper.update(sysFile);
	}

	@Override
	public int batchRemove(Long[] id) {
		int count = sysFileMapper.batchRemove(id);
		return count;
	}

	@Override
	public SysFileEntity getSysFileByMd(String fileMd) {
		SysFileEntity sysFile = sysFileMapper.getSysFileByMd(fileMd);
		return sysFile;
	}
	
}