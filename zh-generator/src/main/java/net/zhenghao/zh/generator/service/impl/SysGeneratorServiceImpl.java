package net.zhenghao.zh.generator.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.zhenghao.zh.common.entity.Page;
import net.zhenghao.zh.common.entity.Query;
import net.zhenghao.zh.generator.entity.TableEntity;
import net.zhenghao.zh.generator.manager.SysGeneratorManager;
import net.zhenghao.zh.generator.service.SysGeneratorService;

/**
 * 代码生成器
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date  :2018年1月10日 下午3:44:37
 * SysGeneratorServiceImpl.java
 */
@Service("sysGeneratorService")
public class SysGeneratorServiceImpl implements SysGeneratorService {

	@Autowired
	private SysGeneratorManager sysGeneratorManager;
	
	@Override
	public Page<TableEntity> listTable(Map<String, Object> params) {
		// TODO Auto-generated method stub
		Query query = new Query(params);
		Page<TableEntity> page = new Page<>(query);
		sysGeneratorManager.listTable(page, query);
		return page;
	}

}
