package net.zhenghao.zh.wechat.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import net.zhenghao.zh.common.annotation.SysLog;
import net.zhenghao.zh.common.controller.AbstractController;
import net.zhenghao.zh.common.entity.Page;
import net.zhenghao.zh.common.entity.R;
import net.zhenghao.zh.wechat.entity.WechatUserEntity;
import net.zhenghao.zh.wechat.service.WechatUserService;

/**
 * 微信用户表
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date  :2018年6月06日 上午10:53:51
 * WechatUserController.java
 */
@RestController
@RequestMapping("/wechat/user")
public class WechatUserController extends AbstractController {

	@Autowired
	private WechatUserService wechatUserService;
	
	/**
	 * 列表
	 * @param params
	 * @return
	 */
	@RequestMapping("/list")
	public Page<WechatUserEntity> list(@RequestBody Map<String, Object> params) {
		return wechatUserService.listWechatUser(params);
	}
	
	/**
	 * 新增
	 * @param wechatUser
	 * @return
	 */
	@SysLog("新增微信授权页用户表")
	@RequestMapping("/save")
	public R save(@RequestBody WechatUserEntity wechatUser) {
		return wechatUserService.saveWechatUser(wechatUser);
	}
	
	/**
	 * 根据id查询详情
	 * @param id
	 * @return
	 */
	@RequestMapping("/info")
	public R getById(@RequestBody Long id) {
		return wechatUserService.getWechatUserById(id);
	}
	
	/**
	 * 修改
	 * @param wechatUser
	 * @return
	 */
	@SysLog("修改微信授权页用户表")
	@RequestMapping("/update")
	public R update(@RequestBody WechatUserEntity wechatUser) {
		return wechatUserService.updateWechatUser(wechatUser);
	}
	
	/**
	 * 删除
	 * @param id
	 * @return
	 */
	@SysLog("删除微信授权页用户表")
	@RequestMapping("/remove")
	public R batchRemove(@RequestBody Long[] id) {
		return wechatUserService.batchRemove(id);
	}

	/**
	 * 微信用户统计
	 * @return
	 */
	@RequestMapping("/count")
	public R getCount() {
		return wechatUserService.wechatUserCount();
	}
	
}