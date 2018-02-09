package net.zhenghao.zh.file.service.impl;

import java.io.FileNotFoundException;
import java.net.UnknownHostException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.zhenghao.zh.common.constant.SystemConstant;
import net.zhenghao.zh.common.entity.Page;
import net.zhenghao.zh.common.entity.Query;
import net.zhenghao.zh.common.entity.R;
import net.zhenghao.zh.common.utils.CommonUtils;
import net.zhenghao.zh.common.utils.RedisUtils;
import net.zhenghao.zh.common.utils.ShiroUtils;
import net.zhenghao.zh.file.entity.SysFileEntity;
import net.zhenghao.zh.file.entity.SysUploadEntity;
import net.zhenghao.zh.file.manager.SysFileManager;
import net.zhenghao.zh.file.service.SysFileService;
import net.zhenghao.zh.file.utils.UploadUtils;

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
	public R saveSysFile(SysFileEntity sysFile) {
		int count = sysFileManager.saveSysFile(sysFile);
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

	@Override
	public R checkRepetition(SysUploadEntity upload) {
		R r = new R();
		Long userId = ShiroUtils.getUserId();
		SysFileEntity sysFile = sysFileManager.getSysFileByMd(upload.getFileMd5());
		if (sysFile != null) {//说明所上传的文件重复
			SysFileEntity saveFile = new SysFileEntity();
			saveFile.setFileMd(upload.getFileMd5());
			saveFile.setFileType(sysFile.getFileType());
			saveFile.setFileShow(upload.getFileName());
			saveFile.setFileName(sysFile.getFileName());
			saveFile.setFilePath(sysFile.getFilePath());
			saveFile.setFileSize(sysFile.getFileSize());
			saveFile.setFileSizeFormat(sysFile.getFileSizeFormat());
			saveFile.setFileExt(sysFile.getFileExt());
			saveFile.setFileIp(sysFile.getFileIp());
			saveFile.setFileAddress(sysFile.getFileAddress());
			saveFile.setUploadType(SystemConstant.UploadType.SECOND.getValue());
			saveFile.setUserIdCreate(userId);
			sysFileManager.saveSysFile(saveFile);
			RedisUtils.set("repetition_" + userId + "_" + upload.getFileName(), "1");//1为重复
			r.put("repetition", 1);
		} else {
			RedisUtils.set("repetition_" + userId + "_" + upload.getFileName(), "0");//0为不重复
			r.put("repetition", 0);
		}
		return r;
	}

	@Override
	public R mergeChunks(SysUploadEntity upload) {
		SysFileEntity fileEntity = null;
		try {
			fileEntity = UploadUtils.mergeChunks(upload);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}
		int count = 1;
		if (fileEntity != null) {
			count = sysFileManager.saveSysFile(fileEntity);
		}
		return CommonUtils.msg(count);
	}
	
}