package net.zhenghao.zh.file.dao;

import org.mybatis.spring.annotation.MapperScan;

import net.zhenghao.zh.common.dao.BaseMapper;
import net.zhenghao.zh.file.entity.SysFileEntity;

/**
 * 文件管理
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date  :2018年2月01日 上午9:57:54
 * SysFileMapper.java
 */
@MapperScan
public interface SysFileMapper extends BaseMapper<SysFileEntity> {
	
	/**
	 * 根据md5值得到SysFileEntity
	 * @param fileMd
	 * @return
	 */
	SysFileEntity getSysFileByMd(String fileMd);
	
}