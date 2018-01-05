package net.zhenghao.zh.common.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import net.zhenghao.zh.common.annotation.SysLog;
import net.zhenghao.zh.common.entity.Page;
import net.zhenghao.zh.common.entity.R;
import net.zhenghao.zh.common.entity.SysLogEntity;
import net.zhenghao.zh.common.service.SysLogService;

/**
 * 系统日志
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date  :2017年11月22日 下午2:01:26
 * SysLogController.java
 */
@RestController
@RequestMapping("/sys/log")
public class SysLogController extends AbstractController {

	@Autowired
	private SysLogService sysLogService;
	
	/**
	 * 日志列表
	 * @param params
	 * @return
	 */
	@RequestMapping("/list")
	public Page<SysLogEntity> listLog(@RequestBody Map<String, Object> params){
		return sysLogService.listLog(params);
	}
	
	/**
	 * 删除日志
	 * @param id
	 * @return
	 */
	@SysLog("删除日志")
	@RequestMapping("/remove")
	public R batchRemove(@RequestBody Long[] id){
		return sysLogService.batchRemove(id);
	}
	
	/**
	 * 清空日志
	 * @return
	 */
	@SysLog("清空日志")
	@RequestMapping("/clear")
	public R batchRemoveAll(){
		return sysLogService.batchRemoveAll();
	}
}

/**
 *
 * @Controller和@RestController的区别？

官方文档：
@RestController is a stereotype annotation that combines @ResponseBody and @Controller.
意思是：
@RestController注解相当于@ResponseBody ＋ @Controller合在一起的作用。

1)如果只是使用@RestController注解Controller，则Controller中的方法无法返回jsp页面，配置的视图解析器InternalResourceViewResolver不起作用，返回的内容就是Return 里的内容。
例如：本来应该到success.jsp页面的，则其显示success.

2)如果需要返回到指定页面，则需要用 @Controller配合视图解析器InternalResourceViewResolver才行。
3)如果需要返回JSON，XML或自定义mediaType内容到页面，则需要在对应的方法上加上@ResponseBody注解。
 * 
 */
