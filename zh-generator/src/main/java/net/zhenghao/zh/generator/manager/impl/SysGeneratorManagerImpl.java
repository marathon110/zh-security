package net.zhenghao.zh.generator.manager.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import net.zhenghao.zh.common.entity.Page;
import net.zhenghao.zh.common.entity.Query;
import net.zhenghao.zh.generator.dao.SysGeneratorMapper;
import net.zhenghao.zh.generator.entity.ColumnEntity;
import net.zhenghao.zh.generator.entity.TableEntity;
import net.zhenghao.zh.generator.manager.SysGeneratorManager;

/**
 * 代码生成器
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date  :2018年1月10日 下午2:46:42
 * SysGeneratorManager.java
 */
@Component("sysGeneratorManager")
public class SysGeneratorManagerImpl implements SysGeneratorManager {
	
	@Autowired
	private SysGeneratorMapper sysGeneratorMapper;

	@Override
	public void listTable(Page<TableEntity> page, Query query) {
		// TODO Auto-generated method stub
		sysGeneratorMapper.listTable(page, query);
	}

	@Override
	public TableEntity getTableByName(String tableName) {
		// TODO Auto-generated method stub
		return sysGeneratorMapper.getTableByName(tableName);
	}

	@Override
	public List<ColumnEntity> listColumn(String tableName) {
		// TODO Auto-generated method stub
		return sysGeneratorMapper.listColumn(tableName);
	}

}
