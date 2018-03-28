package net.zhenghao.zh.file.controller;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import net.zhenghao.zh.common.annotation.SysLog;
import net.zhenghao.zh.common.constant.SystemConstant;
import net.zhenghao.zh.common.controller.AbstractController;
import net.zhenghao.zh.common.entity.Page;
import net.zhenghao.zh.common.entity.R;
import net.zhenghao.zh.common.utils.RedisUtils;
import net.zhenghao.zh.common.utils.ShiroUtils;
import net.zhenghao.zh.file.entity.SysFileEntity;
import net.zhenghao.zh.file.entity.SysUploadEntity;
import net.zhenghao.zh.file.service.SysFileService;
import net.zhenghao.zh.file.utils.UploadUtils;

/**
 * 文件管理
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date  :2018年2月01日 上午9:57:54
 * SysFileController.java
 */
@RestController
@RequestMapping("/sys/file")
public class SysFileController extends AbstractController {

	@Autowired
	private SysFileService sysFileService;
	
	/**
	 * 列表
	 * @param params
	 * @return
	 */
	@RequestMapping("/list")
	public Page<SysFileEntity> list(@RequestBody Map<String, Object> params) {
		if (getUserId() != SystemConstant.SUPER_ADMIN) {
			params.put("userIdCreate", getUserId());
		}
		return sysFileService.listSysFile(params);
	}
	
	/**
	 * 新增
	 * @param sysFile
	 * @return
	 */
	@SysLog("新增文件管理")
	@RequestMapping("/save")
	public R save(@RequestBody SysFileEntity sysFile) {
		return sysFileService.saveSysFile(sysFile);
	}
	
	/**
	 * 根据id查询详情
	 * @param id
	 * @return
	 */
	@RequestMapping("/info")
	public R getById(@RequestBody Long id) {
		return sysFileService.getSysFileById(id);
	}
	
	/**
	 * 修改
	 * @param sysFile
	 * @return
	 */
	@SysLog("修改文件管理")
	@RequestMapping("/update")
	public R update(@RequestBody SysFileEntity sysFile) {
		return sysFileService.updateSysFile(sysFile);
	}
	
	/**
	 * 删除
	 * @param id
	 * @return
	 */
	@SysLog("删除文件管理")
	@RequestMapping("/remove")
	public R batchRemove(@RequestBody Long[] id) {
		return sysFileService.batchRemove(id);
	}
	
	/**
	 * 保存上传分片
	 * @param request
	 * @throws IOException
	 */
	@RequestMapping("/upload")
	public void upload(HttpServletRequest request) throws IOException {
		UploadUtils.uploadChunk(request);
	}
	
	/**
	 * 当有文件添加进列队时，通过文件名查看该文件是否上传过，上传进度时多少
	 * @param fileName
	 * @return
	 */
	@RequestMapping("/progress")
	public String selectProgressByFileName(String fileName) {
		String progress = "";
		//当前登陆用户信息
		Long userId = ShiroUtils.getUserId();
		if (StringUtils.isNotBlank(fileName)) {
			progress = RedisUtils.get("progress_" + userId + "_" + fileName);
		}
		if (progress == null) {
			progress = "";
		}
		return progress;
	}
	
	/**
	 * 合并分片文件
	 * @param upload
	 * @return
	 * @throws FileNotFoundException 
	 */
	@SysLog("上传文件")
	@RequestMapping("/mergeChunks")
	public R mergeChunks(SysUploadEntity upload) throws FileNotFoundException {
		return sysFileService.mergeChunks(upload);
	}
	
	/**
	 * 检查当前分块是否上传成功
	 * @param upload
	 * @return
	 */
	@RequestMapping("/checkChunk")
	public R checkChunk(SysUploadEntity upload) {
        return UploadUtils.checkChunk(upload);
	}
	
	/**
	 * 检查当前上传文件是否上传过
	 * @param upload
	 * @return
	 */
	@RequestMapping("/repetition")
	public R repetition(SysUploadEntity upload) {
        return sysFileService.checkRepetition(upload);
	}
	
}