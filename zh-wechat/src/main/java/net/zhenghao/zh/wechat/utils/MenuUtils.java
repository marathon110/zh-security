package net.zhenghao.zh.wechat.utils;

import net.zhenghao.zh.common.utils.HttpClientUtils;
import net.zhenghao.zh.common.utils.JSONUtils;
import net.zhenghao.zh.wechat.constant.WechatConstant;
import net.zhenghao.zh.wechat.entity.AccessTokenEntity;
import net.zhenghao.zh.wechat.entity.WechatButtonEntity;
import net.zhenghao.zh.wechat.entity.WechatErrorEntity;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 🙃
 * 🙃 微信菜单工具类
 * 🙃
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date :2018/4/19 11:42
 * MenuUtils.java
 */
public class MenuUtils {

    private static final Logger LOGGER = LoggerFactory.getLogger(MenuUtils.class);

    /**
     * 提交微信服务器更新菜单
     * @param button WechatButtonEntity菜单封装类
     * @return WechatErrorEntity 响应结果封装类
     */
    public static WechatErrorEntity update(WechatButtonEntity button) {
        AccessTokenEntity access_token = AccessTokenUtils.getAccessToken();
        String menu_update_url = WechatConstant.MENU_UPDATE_FETCH_URL
                .replaceAll("ACCESS_TOKEN",access_token.getAccess_token());
        String response = "";
        try {
            response = HttpClientUtils.sendPost(menu_update_url, JSONUtils.beanToJson(button));
        } catch (Exception e) {
            LOGGER.error("wechat_menu_update http connection error :" + e.getMessage(), e);
        }
        WechatErrorEntity error = (WechatErrorEntity) JSONUtils.jsonToBean(response, new WechatErrorEntity());
        return error;
    }

    /**
     * 提交微信服务器删除菜单
     * @return WechatErrorEntity 响应结果封装类
     */
    public static WechatErrorEntity delete() {
        AccessTokenEntity access_token = AccessTokenUtils.getAccessToken();
        String menu_delete_url = WechatConstant.MENU_DELETE_FETCH_URL
                .replaceAll("ACCESS_TOKEN",access_token.getAccess_token());
        String response = "";
        try {
            response = HttpClientUtils.sendGet(menu_delete_url, null);
        } catch (Exception e) {
            LOGGER.error("wechat_menu_delete http connection error :" + e.getMessage(), e);
        }
        WechatErrorEntity error = (WechatErrorEntity) JSONUtils.jsonToBean(response, new WechatErrorEntity());
        return error;
    }
}
