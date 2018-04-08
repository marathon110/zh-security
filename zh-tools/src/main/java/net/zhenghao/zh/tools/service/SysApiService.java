package net.zhenghao.zh.tools.service;

import net.zhenghao.zh.common.entity.R;
import net.zhenghao.zh.tools.entity.SysApiEntity;

/**
 * 🙃
 * 🙃在线接口测试工具Service
 * 🙃
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date :2018/4/8 16:37
 * SysApiService.java
 */
public interface SysApiService {

    R requestApi(SysApiEntity api);

}
