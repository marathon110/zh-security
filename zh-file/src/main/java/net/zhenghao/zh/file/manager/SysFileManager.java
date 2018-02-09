package net.zhenghao.zh.file.manager;

import java.util.List;

import net.zhenghao.zh.common.entity.Page;
import net.zhenghao.zh.common.entity.Query;
import net.zhenghao.zh.file.entity.SysFileEntity;

/**
 * 文件管理
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date  :2018年2月01日 上午9:57:54
 * SysFileManager.java
 */
 
 public interface SysFileManager {
 
 	List<SysFileEntity> listSysFile(Page<SysFileEntity> page, Query search);
	
	int saveSysFile(SysFileEntity sysFile);
	
	SysFileEntity getSysFileById(Long id);
	
	int updateSysFile(SysFileEntity sysFile);
	
	int batchRemove(Long[] id);
	
	SysFileEntity getSysFileByMd(String fileMd);
	
 }