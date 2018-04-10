package net.zhenghao.zh.tools.service.impl;

import net.zhenghao.zh.common.entity.R;
import net.zhenghao.zh.common.utils.HttpRequestUtils;
import net.zhenghao.zh.common.utils.JSONUtils;
import net.zhenghao.zh.tools.entity.SysApiEntity;
import net.zhenghao.zh.tools.service.SysApiService;
import org.springframework.stereotype.Service;

import java.util.Date;

/**
 * 🙃
 * 🙃在线接口测试工具ServiceImpl
 * 🙃
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date :2018/4/8 16:48
 * SysApiServiceImpl.java
 */
@Service("SysApiService")
public class SysApiServiceImpl implements SysApiService {

    @Override
    public R requestApi(SysApiEntity api) {
        R r = new R();
        String params = "";
        String body = "";
        long start = System.currentTimeMillis();
        params = JSONUtils.mapToParams(api.getParams());
        if ("GET".equals(api.getMethod())) {
            body = HttpRequestUtils.sendGet(api.getUrl(), params);
        } else if ("POST".equals(api.getMethod())) {
            body = HttpRequestUtils.sendPost(api.getUrl(), params, false);
        } else {
            r.put("code", 500);
            r.put("msg", "请求方法错误");
        }
        long end = System.currentTimeMillis();
        api.setDate(new Date());
        api.setBody(body);
        api.setTime(end - start);
        r.put("rows", api);
        r.put("code", 0);
        return r;
    }
}
