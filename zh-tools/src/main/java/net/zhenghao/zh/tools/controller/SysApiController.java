package net.zhenghao.zh.tools.controller;

import net.zhenghao.zh.common.entity.R;
import net.zhenghao.zh.tools.entity.SysApiEntity;
import net.zhenghao.zh.tools.service.SysApiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 🙃
 * 🙃在线接口测试工具Controller
 * 🙃
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date :2018/4/8 16:33
 * SysApiController.java
 */
@RestController
@RequestMapping("/sys/api")
public class SysApiController {

    @Autowired
    private SysApiService sysApiService;

    /**
     * 请求测试api
     * @param api
     * @return
     */
    @RequestMapping("/request")
    public R requestApi(@RequestBody SysApiEntity api) {return sysApiService.requestApi(api);}

}
