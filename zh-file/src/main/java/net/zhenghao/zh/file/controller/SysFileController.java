package net.zhenghao.zh.file.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import net.zhenghao.zh.common.annotation.SysLog;
import net.zhenghao.zh.common.controller.AbstractController;
import net.zhenghao.zh.common.entity.Page;
import net.zhenghao.zh.common.entity.R;
import net.zhenghao.zh.common.utils.DateUtils;
import net.zhenghao.zh.file.entity.SysFileEntity;
import net.zhenghao.zh.file.service.SysFileService;

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
	
	@RequestMapping("/upload")
	public void upload(HttpServletRequest request) {
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
				request.getSession().getServletContext());
		if (multipartResolver.isMultipart(request)) {
			MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
			Iterator<String> iter = multiRequest.getFileNames();
			while (iter.hasNext()) {
				MultipartFile file = multiRequest.getFile(iter.next());
				if (file != null) {
					String filePath = null,filePath2=null,fileName = null;
					String suffixName = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
					filePath = "E:" + File.separator + "zh_work";
					fileName = new Date().getTime() + "";
					fileUp(file, filePath, fileName + suffixName);	
				}
			}
		}
	}
	
	/**上传文件
	 * @param file 			//文件对象
	 * @param filePath		//上传路径
	 * @param fileName		//文件名
	 * @return  文件名
	 */
	public static String fileUp(MultipartFile file, String filePath, String fileName){
		/*String extName = ""; // 扩展名格式：
		try {
			if (file.getOriginalFilename().lastIndexOf(".") >= 0){
				extName = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
			}
			copyFile(file.getInputStream(), filePath, fileName+extName).replaceAll("-", "");
		} catch (IOException e) {
			System.out.println(e);
		}
		return fileName+extName;*/
		try {
			
			copyFile(file.getInputStream(), filePath, fileName).replaceAll("-", "");
		} catch (IOException e) {
			System.out.println(e);
		}
		return fileName;
	}
	
	
	/**
	 * 写文件到当前目录的upload目录中
	 * @param in
	 * @param fileName
	 * @throws IOException
	 */
	private static String copyFile(InputStream in, String dir, String realName)
			throws IOException {
		File file = mkdirsmy(dir,realName);
		FileUtils.copyInputStreamToFile(in, file);
		return realName;
	}
	
	/**判断路径是否存在，否：创建此路径
	 * @param dir  文件路径
	 * @param realName  文件名
	 * @throws IOException 
	 */
	public static File mkdirsmy(String dir, String realName) throws IOException{
		File file = new File(dir, realName);
		if (!file.exists()) {
			if (!file.getParentFile().exists()) {
				file.getParentFile().mkdirs();
			}
			file.createNewFile();
		}
		return file;
	}
}