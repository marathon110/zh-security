package net.zhenghao.zh.file.service;

import java.util.Map;

import net.zhenghao.zh.common.entity.Page;
import net.zhenghao.zh.common.entity.R;
import net.zhenghao.zh.file.entity.SysFileEntity;

/**
 * 文件管理
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date  :2018年2月01日 上午9:57:54
 * SysFileService.java
 */
public interface SysFileService {
	
	Page<SysFileEntity> listSysFile(Map<String, Object> params);
	
	R saveSysFile(SysFileEntity sysFile);
	
	R getSysFileById(Long id);
	
	R updateSysFile(SysFileEntity sysFile);
	
	R batchRemove(Long[] id);
	
}