package net.zhenghao.zh.generator.service;

import java.util.Map;

import net.zhenghao.zh.common.entity.Page;
import net.zhenghao.zh.generator.entity.GeneratorParamEntity;
import net.zhenghao.zh.generator.entity.TableEntity;

/**
 * 代码生成器
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date  :2018年1月10日 下午3:36:54
 * SysGeneratorService.java
 */
public interface SysGeneratorService {

	Page<TableEntity> listTable(Map<String, Object> params);
	
	byte[] generator(GeneratorParamEntity params);
}
