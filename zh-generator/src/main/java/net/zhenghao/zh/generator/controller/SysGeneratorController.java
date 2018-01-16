package net.zhenghao.zh.generator.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import net.zhenghao.zh.common.controller.AbstractController;
import net.zhenghao.zh.common.entity.Page;
import net.zhenghao.zh.generator.entity.GeneratorParamEntity;
import net.zhenghao.zh.generator.entity.TableEntity;
import net.zhenghao.zh.generator.service.SysGeneratorService;

/**
 * 代码生成器
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date  :2018年1月10日 下午3:52:26
 * SysGeneratorController.java
 */
@Controller
@RequestMapping("/sys/generator")
public class SysGeneratorController extends AbstractController {

	@Autowired
	private SysGeneratorService sysGeneratorService;
	
	/**
	 * 表格列表
	 * @param params
	 * @return
	 */
	@RequestMapping("/list")
	@ResponseBody
	public Page<TableEntity> list(@RequestBody Map<String, Object> params) {
		return sysGeneratorService.listTable(params);
	}
	
	/**
	 * 生成代码
	 * @param params
	 * @param request
	 * @param response
	 * @throws IOException 
	 */
	@RequestMapping("/code")
	public void generator(GeneratorParamEntity params, HttpServletRequest request, HttpServletResponse response) throws IOException {
		byte[] code = sysGeneratorService.generator(params);
		String attachment = "attachment; filename=" + params.getTables()[0] + ".zip";
		response.reset();//空白行的出现原因，jsp代码编译后产生。就是有jsp生成html文件的时候，html文件内部会出现很多空白行。下载后的文件内的空白行也是这样产生的。 因此，需要 response.reset() 来清除首部的空白行。
		response.setHeader("Content-Disposition", attachment);  
		response.addHeader("Content-Length", "" + code.length);
		response.setContentType("application/octet-stream; charset=UTF-8");  
		IOUtils.write(code, response.getOutputStream());
	}
}
