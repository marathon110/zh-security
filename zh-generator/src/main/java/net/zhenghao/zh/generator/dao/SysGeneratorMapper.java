package net.zhenghao.zh.generator.dao;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;

import net.zhenghao.zh.common.entity.Page;
import net.zhenghao.zh.common.entity.Query;
import net.zhenghao.zh.generator.entity.ColumnEntity;
import net.zhenghao.zh.generator.entity.TableEntity;

/**
 * 代码生成器
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date  :2018年1月10日 下午1:42:59
 * SysGeneratorMapper.java
 */
@MapperScan
public interface SysGeneratorMapper {

	List<TableEntity> listTable(Page<TableEntity> page, Query query);
	
	TableEntity getTableByName(String tableName);
	
	List<ColumnEntity> listColumn(String tableName);
	
}
