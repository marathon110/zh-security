package net.zhenghao.zh.wechat.manager;

import net.zhenghao.zh.common.entity.Query;
import net.zhenghao.zh.wechat.entity.WechatMenuEntity;

import java.util.List;

/**
 * 微信菜单
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date  :2018年4月18日 下午3:41:41
 * SysMenuManager.java
 */

public interface WechatMenuManager {
	
	List<WechatMenuEntity> listMenu(Query search);
	
	List<WechatMenuEntity> listButton();
	
	int saveMenu(WechatMenuEntity menu);

	WechatMenuEntity getMenuById(Long id);
	
	int updateMenu(WechatMenuEntity menu);
	
	int batchRemove(Long[] id);
}
