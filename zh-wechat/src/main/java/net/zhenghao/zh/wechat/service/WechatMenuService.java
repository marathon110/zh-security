package net.zhenghao.zh.wechat.service;

import net.zhenghao.zh.common.entity.R;
import net.zhenghao.zh.wechat.entity.WechatMenuEntity;

import java.util.List;
import java.util.Map;

/**
 * 微信菜单
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date  :2018年4月18日 上午10:43:52
 * SysMenuService.java
 */
public interface WechatMenuService {
	
	List<WechatMenuEntity> listMenu(Map<String, Object> params);
	
	R listButton();
	
	R saveMenu(WechatMenuEntity menu);

	R getMenuById(Long id);
	
	R updateMenu(WechatMenuEntity menu);
	
	R batchRemove(Long[] id);
	
}
