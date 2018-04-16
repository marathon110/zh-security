package net.zhenghao.zh.wechat.dao;

import org.mybatis.spring.annotation.MapperScan;

import net.zhenghao.zh.common.dao.BaseMapper;
import net.zhenghao.zh.wechat.entity.WechatConfigEntity;

/**
 * 微信基本配置表
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date  :2018年4月16日 下午2:02:55
 * WechatConfigMapper.java
 */
@MapperScan
public interface WechatConfigMapper extends BaseMapper<WechatConfigEntity> {

    /**
     * 配置微信基础配置，数据库不存在就插入，存在就更新
     * @param config
     * @return
     */
    int saveOrUpdate(WechatConfigEntity config);

    /**
     * 数据库已经写死id
     * @return
     */
    WechatConfigEntity getWechatConfig();
}