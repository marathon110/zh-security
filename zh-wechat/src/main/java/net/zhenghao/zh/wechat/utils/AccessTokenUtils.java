package net.zhenghao.zh.wechat.utils;

import net.zhenghao.zh.common.constant.SystemConstant;
import net.zhenghao.zh.common.utils.HttpClientUtils;
import net.zhenghao.zh.common.utils.JSONUtils;
import net.zhenghao.zh.common.utils.SpringContextUtils;
import net.zhenghao.zh.wechat.constant.WechatConstant;
import net.zhenghao.zh.wechat.entity.AccessTokenEntity;
import net.zhenghao.zh.wechat.entity.WechatConfigEntity;
import net.zhenghao.zh.wechat.service.WechatConfigService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;

/**
 * 🙃
 * 🙃 全局获取access_token唯一工具类
 * 🙃
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date :2018/4/17 14:55
 * AccessTokenUtils.java
 */
public class AccessTokenUtils {

    private static final Logger LOGGER = LoggerFactory.getLogger(AccessTokenUtils.class);

    private static AccessTokenEntity ACCESS_TOKEN = null;

    /**
     * 全局的获取accesstoken的锁
     */
    private static final Object globalFetchTokenLock = new Object();

    private static WechatConfigEntity wechatConfig;

    /**
     * 初始化wechatConfig
     */
    private static void getWechatConfig() {
        WechatConfigService wechatConfigService = (WechatConfigService) SpringContextUtils.getBean("wechatConfigService");
        wechatConfig = (WechatConfigEntity) wechatConfigService.getWechatConfig().get(SystemConstant.DATA_ROWS);
    }

    public static AccessTokenEntity getAccessToken() {
        if (ACCESS_TOKEN == null) {
            synchronized (globalFetchTokenLock) {
                ACCESS_TOKEN = requestAccessTokenFromUrl();
                return ACCESS_TOKEN;
            }
        }
        if(isAccessTokenExpired()) {
            ACCESS_TOKEN = requestAccessTokenFromUrl();
            return ACCESS_TOKEN;
        }
        return ACCESS_TOKEN;
    }

    /**
     * 让ACCESS_TOKEN过期
     */
    public static void expireAccessToken() {
        synchronized (globalFetchTokenLock) {
            ACCESS_TOKEN = null;
        }
    }

    /**
     * 判断当前access_token是否过期
     * @return true 过期  false 过期
     */
    public static boolean isAccessTokenExpired() {
        synchronized (globalFetchTokenLock) {
            long currentTimeMillis = System.currentTimeMillis();
            long deadTime = ACCESS_TOKEN.getDeadTime();
            if (LOGGER.isDebugEnabled()) {
                LOGGER.debug("当前时间:{},token 过期截止日期:{},时间差:{}", new Object[]{currentTimeMillis, deadTime, (deadTime - currentTimeMillis) / 1000.0});
            }
            //提前200秒过期
            return deadTime <= currentTimeMillis;
        }
    }

    /**
     * 手工刷新access_token
     * @return
     */
    public static AccessTokenEntity refreshAccessToken() {
        synchronized (globalFetchTokenLock) {
            expireAccessToken();
            return getAccessToken();
        }
    }

    /**
     * 请求微信服务器获取access token
     * @return
     */
    private static AccessTokenEntity requestAccessTokenFromUrl() {
        getWechatConfig();
        String access_token_url = WechatConstant.ACCESS_TOKEN_FETCH_URL
                .replaceAll("APPID",wechatConfig.getAppId()).replaceAll("APPSECRET",wechatConfig.getAppsecret());
        String response = "";
        AccessTokenEntity accessToken = null;
        try {
            response = HttpClientUtils.sendGet(access_token_url, null);
            accessToken = (AccessTokenEntity) JSONUtils.jsonToBean(response, new AccessTokenEntity());
        } catch (IOException e) {
            LOGGER.error("http connection error :" + e.getMessage(), e);
        }
        return accessToken;
    }
}
