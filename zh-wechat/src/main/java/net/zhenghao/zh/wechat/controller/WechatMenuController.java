package net.zhenghao.zh.wechat.controller;

import net.zhenghao.zh.common.annotation.SysLog;
import net.zhenghao.zh.common.controller.AbstractController;
import net.zhenghao.zh.common.entity.R;
import net.zhenghao.zh.wechat.entity.WechatMenuEntity;
import net.zhenghao.zh.wechat.service.WechatMenuService;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * 微信菜单controller
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date  :2017年12月8日 下午2:03:22
 * SysMenuController.java
 */
@RestController
@RequestMapping("/wechat/menu")
public class WechatMenuController extends AbstractController {

	@Resource
	private WechatMenuService wechatMenuService;

	/**
	 * 测试递归
	 * @return
	 */
	@RequestMapping("/test")
	public List<WechatMenuEntity> findAllRecursion() {
		return wechatMenuService.findAllRecursion();
	}
	
	/**
	 * 菜单列表
	 * @param params
	 * @return
	 */
	@RequestMapping("/list")
	public List<WechatMenuEntity> listMenu(@RequestParam Map<String, Object> params) {
		return wechatMenuService.listMenu(params);
	}
	
	/**
	 * 选择菜单(添加、修改)
	 * 出去二级菜单
	 * @return
	 */
	@RequestMapping("/select")
	public R select() {
		return wechatMenuService.listButton();
	}
	
	/**
	 * 新增菜单
	 * @param menu
	 * @return
	 */
	@SysLog(value = "新增菜单", type = "WECHAT")
	@RequestMapping("/save")
	public R save(@RequestBody WechatMenuEntity menu) {
		return wechatMenuService.saveMenu(menu);
	}
	
	/**
	 * 查询详情
	 * @param id
	 * @return
	 */
	@RequestMapping("/info")
	public R info(@RequestBody Long id) {
		return wechatMenuService.getMenuById(id);
	}
	
	/**
	 * 修改菜单
	 * @param menu
	 * @return
	 */
	@SysLog(value = "修改菜单", type = "WECHAT")
	@RequestMapping("/update")
	public R update(@RequestBody WechatMenuEntity menu) {
		return wechatMenuService.updateMenu(menu);
	}
	
	/**
	 * 删除菜单
	 * @param id
	 * @return
	 */
	@SysLog(value = "删除菜单", type = "WECHAT")
	@RequestMapping("/remove")
	public R remove(@RequestBody Long[] id) {
		return wechatMenuService.batchRemove(id);
	}

	/**
	 * 菜单提交微信
	 * @return
	 */
	@SysLog(value = "菜单提交微信", type = "WECHAT")
	@RequestMapping("/submit")
	public R submit() {
		return wechatMenuService.submit();
	}

	/**
	 * 删除微信菜单
	 * @return
	 */
	@SysLog(value = "删除微信菜单", type = "WECHAT")
	@RequestMapping("/delete")
	public R delete() {
		return wechatMenuService.delete();
	}
}
