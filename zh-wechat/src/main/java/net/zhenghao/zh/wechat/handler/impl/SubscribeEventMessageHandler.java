package net.zhenghao.zh.wechat.handler.impl;

import net.zhenghao.zh.wechat.annotation.Message;
import net.zhenghao.zh.wechat.entity.WechatUserEntity;
import net.zhenghao.zh.wechat.enums.EventType;
import net.zhenghao.zh.wechat.enums.Lang;
import net.zhenghao.zh.wechat.enums.MessageType;
import net.zhenghao.zh.wechat.handler.MessageHandler;
import net.zhenghao.zh.wechat.message.request.BaseRequestMessage;
import net.zhenghao.zh.wechat.message.request.SubscribeEventRequestMessage;
import net.zhenghao.zh.wechat.message.response.Article;
import net.zhenghao.zh.wechat.message.response.BaseResponseMessage;
import net.zhenghao.zh.wechat.utils.MessageUtils;
import net.zhenghao.zh.wechat.utils.UserUtils;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

/**
 * 🙃
 * 🙃 关注事件消息处理器
 * 🙃
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date :2018/4/26 17:06
 * SubscribeEventMessageHandler.java
 */
@Component
@Message(message = MessageType.EVENT, event = EventType.SUBSCRIBE)
public class SubscribeEventMessageHandler implements MessageHandler {
    @Override
    public BaseResponseMessage dealMessage(BaseRequestMessage requestMessage) {
        //关注事件消息业务逻辑
        SubscribeEventRequestMessage subscribeEventRequestMessage = (SubscribeEventRequestMessage) requestMessage;
        WechatUserEntity wechatUser = UserUtils.getUserInfo(subscribeEventRequestMessage.getFromUserName(), Lang.CHINESE.getCode());
        Article article = new Article();
        article.setUrl("https://github.com/zhaozhenghao1993");
        article.setTitle("亲爱的:" + wechatUser.getNickname() + ",感谢您的关注!");
        article.setPicUrl(wechatUser.getHeadimgurl());
        article.setDescription("开发者工具，分片秒传，断点续传，微信公众号注解开发，权限平台");
        List<Article> list = new ArrayList<Article>();
        list.add(article);
        return MessageUtils.buildNewsResponseMessage(subscribeEventRequestMessage, list);
    }
}
