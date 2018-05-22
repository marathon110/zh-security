package net.zhenghao.zh.wechat.dao;

import org.mybatis.spring.annotation.MapperScan;

import net.zhenghao.zh.common.dao.BaseMapper;
import net.zhenghao.zh.wechat.entity.WechatUserEntity;

/**
 * 微信授权页用户表
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date  :2018年5月21日 下午4:31:14
 * WechatUserMapper.java
 */
@MapperScan
public interface WechatUserMapper extends BaseMapper<WechatUserEntity> {

    WechatUserEntity getObjectByOpenid(String openid);
}