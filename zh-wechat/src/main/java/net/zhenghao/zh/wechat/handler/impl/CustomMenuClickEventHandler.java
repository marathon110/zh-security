package net.zhenghao.zh.wechat.handler.impl;

import net.zhenghao.zh.wechat.annotation.Message;
import net.zhenghao.zh.wechat.entity.WechatUserEntity;
import net.zhenghao.zh.wechat.enums.EventType;
import net.zhenghao.zh.wechat.enums.Lang;
import net.zhenghao.zh.wechat.enums.MessageType;
import net.zhenghao.zh.wechat.handler.MessageHandler;
import net.zhenghao.zh.wechat.message.request.BaseRequestMessage;
import net.zhenghao.zh.wechat.message.response.BaseResponseMessage;
import net.zhenghao.zh.wechat.utils.MessageUtils;
import net.zhenghao.zh.wechat.utils.UserUtils;
import org.springframework.stereotype.Component;

/**
 * 🙃
 * 🙃 自定义菜单点击事件处理器
 * 🙃
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date :2018/4/24 11:25
 * CustomMenuClickEventHandler.java
 */
@Component
@Message(message = MessageType.EVENT, event = EventType.CUSTOM_MENU_CLICK)
public class CustomMenuClickEventHandler implements MessageHandler {

    @Override
    public BaseResponseMessage dealMessage(BaseRequestMessage requestMessage) {
        /*if ("my".equals(receiveXmlEntity.getEventKey())) {
            WechatUserEntity user = UserUtils.getUserInfo(receiveXmlEntity.getFromUserName(), Lang.CHINESE.getCode());
            if (user == null) {
                return MessageUtils.buildTextResponseMessage(receiveXmlEntity, "抱歉,没有获取到您的信息,请您稍后再重试.");
            }
            String userInfoTemplate = "您的信息如下:\n☕openid:%s\n☕用户昵称:%s\n☕性别:%s\n☕所在国家:%s\n☕所在省份:%s\n☕所在城市:%s";
            String userInfoString = String.format(userInfoTemplate, user.getOpenid(), user.getNickname(), user.getSexString(), user.getCountry(), user.getProvince(), user.getCity());
            return MessageUtils.buildTextResponseMessage(receiveXmlEntity, userInfoString);
        }*/
        return null;
    }
}
