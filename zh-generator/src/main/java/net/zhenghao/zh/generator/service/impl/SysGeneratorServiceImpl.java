package net.zhenghao.zh.generator.service.impl;

import java.io.ByteArrayOutputStream;
import java.util.List;
import java.util.Map;
import java.util.zip.ZipOutputStream;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.zhenghao.zh.common.entity.Page;
import net.zhenghao.zh.common.entity.Query;
import net.zhenghao.zh.generator.entity.ColumnEntity;
import net.zhenghao.zh.generator.entity.GeneratorParamEntity;
import net.zhenghao.zh.generator.entity.TableEntity;
import net.zhenghao.zh.generator.manager.SysGeneratorManager;
import net.zhenghao.zh.generator.service.SysGeneratorService;
import net.zhenghao.zh.generator.utils.GenUtils;

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

	@Override
	public byte[] generator(GeneratorParamEntity params) {
		// TODO Auto-generated method stub
		ByteArrayOutputStream out = new ByteArrayOutputStream();
		ZipOutputStream zip = new ZipOutputStream(out);
		for (String table : params.getTables()) {
			TableEntity tableEntity = sysGeneratorManager.getTableByName(table);
			List<ColumnEntity> columns = sysGeneratorManager.listColumn(table);
			GenUtils.generatorCode(tableEntity, columns, params, zip);
		}
		IOUtils.closeQuietly(zip);
		return out.toByteArray();
	}

}
