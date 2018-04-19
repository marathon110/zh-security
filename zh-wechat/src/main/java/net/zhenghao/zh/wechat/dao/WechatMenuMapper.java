package net.zhenghao.zh.wechat.dao;

import net.zhenghao.zh.common.dao.BaseMapper;
import net.zhenghao.zh.wechat.entity.WechatMenuEntity;
import org.mybatis.spring.annotation.MapperScan;

import java.util.List;

/**
 * 微信菜单dao
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date  :2018年4月18日 下午1:28:55
 * SysMenuMapper.java
 */
@MapperScan
public interface WechatMenuMapper extends BaseMapper<WechatMenuEntity>{
	
	/**
	 * 得到一级的菜单
	 * @return
	 */
	List<WechatMenuEntity> listButton();
	
}
