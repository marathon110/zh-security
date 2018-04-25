package net.zhenghao.zh.wechat.utils;

import net.zhenghao.zh.common.utils.HttpClientUtils;
import net.zhenghao.zh.common.utils.JSONUtils;
import net.zhenghao.zh.wechat.constant.WechatConstant;
import net.zhenghao.zh.wechat.entity.AccessTokenEntity;
import net.zhenghao.zh.wechat.entity.WechatUserEntity;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 🙃
 * 🙃 微信用户操作工具类
 * 🙃
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date :2018/4/24 11:00
 * UserUtils.java
 */
public class UserUtils {

    private static final Logger LOGGER = LoggerFactory.getLogger(UserUtils.class);

    /**
     * 获取用户基本信息
     * @param openId
     * @param lang 语言类型
     * @return WechatUserEntity微信用户信息封装类
     */
    public static WechatUserEntity getUserInfo(String openId, String lang) {
        AccessTokenEntity access_token = AccessTokenUtils.getAccessToken();
        String user_info_url = WechatConstant.USER_INFO_URL
                .replaceAll("ACCESS_TOKEN", access_token.getAccess_token())
                .replaceAll("OPENID", openId)
                .replaceAll("LANG", lang);
        String response = "";
        try {
            response = HttpClientUtils.sendGet(user_info_url, null);
        } catch (Exception e) {
            LOGGER.error("user_info_url http connection error :" + e.getMessage(), e);
        }
        return (WechatUserEntity) JSONUtils.jsonToBean(response, new WechatUserEntity());
    }
}
