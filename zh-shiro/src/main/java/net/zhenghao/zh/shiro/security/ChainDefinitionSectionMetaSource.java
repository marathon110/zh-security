package net.zhenghao.zh.shiro.security;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.shiro.config.Ini;
import org.apache.shiro.config.Ini.Section;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.FactoryBean;
import org.springframework.beans.factory.annotation.Autowired;

import net.zhenghao.zh.common.entity.Query;
import net.zhenghao.zh.shiro.entity.SysMenuEntity;
import net.zhenghao.zh.shiro.manager.SysMenuManager;

/**
 * 产生责任链,确定每个url的访问权限
 * 让每个接口访问时都进行权限判断，避免页面无权访问而直接在浏览器地址输入接口得到数据
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date  :2018年1月8日 上午10:58:16
 * ChainDefinitionSectionMetaSource.java
 */
public class ChainDefinitionSectionMetaSource implements FactoryBean<Ini.Section> {

	private static final Logger logger = LoggerFactory.getLogger(ChainDefinitionSectionMetaSource.class);
	
	@Autowired
	private SysMenuManager sysMenuManager;
	
	//静态资源访问权限
	private String filterChainDefinitions = null;
	
	@Override
	public Section getObject() throws Exception {
		// TODO Auto-generated method stub
		Ini ini = new Ini();
		//加载默认的url
		ini.load(filterChainDefinitions);
		Ini.Section section = ini.getSection(Ini.DEFAULT_SECTION_NAME);
		List<SysMenuEntity> lists = sysMenuManager.listMenu(new Query());
		for (SysMenuEntity menu : lists) {
			String permKey = menu.getPerms();
			String permUrl = menu.getUrl();
			if (StringUtils.isNotBlank(permKey) && StringUtils.isNotBlank(permUrl)) {
				String permission = "perms[" + permKey + "]";
				section.put(permUrl + "", permission);
				logger.info("初始化权限:{}={}", permUrl, permission);
			}
		}
		//所有资源的访问权限,必须放在最后
		section.put("/**", "authc");
		return section;
	}
	
	/**
	 * 通过filterChainDefinitions对默认的url过滤定义
	 * @param filterChainDefinitions
	 */
	public void setFilterChainDefinitions(String filterChainDefinitions) {
		this.filterChainDefinitions = filterChainDefinitions;
	}

	@Override
	public Class<?> getObjectType() {
		// TODO Auto-generated method stub
		return this.getClass();
	}

	@Override
	public boolean isSingleton() {
		// TODO Auto-generated method stub
		return false;
	}

}
