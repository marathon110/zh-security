package net.zhenghao.zh.wechat.utils;

import net.zhenghao.zh.common.constant.SystemConstant;
import net.zhenghao.zh.common.utils.HttpClientUtils;
import net.zhenghao.zh.common.utils.JSONUtils;
import net.zhenghao.zh.common.utils.SpringContextUtils;
import net.zhenghao.zh.wechat.constant.WechatConstant;
import net.zhenghao.zh.wechat.entity.AccessTokenEntity;
import net.zhenghao.zh.wechat.entity.JsapiTicketEntity;
import net.zhenghao.zh.wechat.entity.WechatConfigEntity;
import net.zhenghao.zh.wechat.service.WechatConfigService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;

/**
 * 🙃
 * 🙃 全局获取jsapi_ticket唯一工具类
 * 🙃
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date :2018/6/5 15:08
 * JsapiTicketUtils.java
 */
public class JsapiTicketUtils {

    private static final Logger LOGGER = LoggerFactory.getLogger(JsapiTicketUtils.class);

    private static JsapiTicketEntity JSAPI_TICKET = null;

    /**
     * 全局的获取JsapiTicket的锁
     */
    private static final Object globalFetchTokenLock = new Object();

    private static WechatConfigEntity wechatConfig;

    public static JsapiTicketEntity getJsapiTicket() {
        if (JSAPI_TICKET == null) {
            synchronized (globalFetchTokenLock) {
                JSAPI_TICKET = requestJsapiTicketFromUrl();
                return JSAPI_TICKET;
            }
        }
        if(isJsapiTicketExpired()) {
            JSAPI_TICKET = requestJsapiTicketFromUrl();
            return JSAPI_TICKET;
        }
        return JSAPI_TICKET;
    }

    /**
     * 让JSAPI_TICKET过期
     */
    public static void expireJsapiTicket() {
        synchronized (globalFetchTokenLock) {
            JSAPI_TICKET = null;
        }
    }

    /**
     * 判断当前access_token是否过期
     * @return true 过期  false 过期
     */
    public static boolean isJsapiTicketExpired() {
        synchronized (globalFetchTokenLock) {
            long currentTimeMillis = System.currentTimeMillis();
            long deadTime = JSAPI_TICKET.getDeadTime();
            if (LOGGER.isDebugEnabled()) {
                LOGGER.debug("当前时间:{},ticket 过期截止日期:{},时间差:{}", new Object[]{currentTimeMillis, deadTime, (deadTime - currentTimeMillis) / 1000.0});
            }
            //提前200秒过期
            return deadTime <= currentTimeMillis;
        }
    }

    /**
     * 手工刷新access_token
     * @return
     */
    public static JsapiTicketEntity refreshAccessToken() {
        synchronized (globalFetchTokenLock) {
            expireJsapiTicket();
            return getJsapiTicket();
        }
    }

    /**
     * 请求微信服务器获取JsapiTicket
     * @return
     */
    private static JsapiTicketEntity requestJsapiTicketFromUrl() {
        String jsapi_ticket_url = WechatConstant.JSAPI_TICKET_FETCH_URL
                .replaceAll("ACCESS_TOKEN", AccessTokenUtils.getAccessToken().getAccess_token());
        String response = "";
        JsapiTicketEntity JsapiTicket = null;
        try {
            response = HttpClientUtils.sendGet(jsapi_ticket_url, null);
            JsapiTicket = (JsapiTicketEntity) JSONUtils.jsonToBean(response, new JsapiTicketEntity());
        } catch (IOException e) {
            LOGGER.error("http connection error :" + e.getMessage(), e);
        }
        return JsapiTicket;
    }
}
