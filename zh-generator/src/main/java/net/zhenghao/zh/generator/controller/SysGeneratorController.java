package net.zhenghao.zh.generator.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import net.zhenghao.zh.common.controller.AbstractController;
import net.zhenghao.zh.common.entity.Page;
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
}
