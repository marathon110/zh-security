package net.zhenghao.zh.wechat.converter.impl;

import net.zhenghao.zh.common.utils.XMLUtils;
import net.zhenghao.zh.wechat.converter.MessageConvert;
import net.zhenghao.zh.wechat.entity.MessageTypeEntity;
import net.zhenghao.zh.wechat.enums.EventType;
import net.zhenghao.zh.wechat.enums.MessageType;
import net.zhenghao.zh.wechat.message.request.*;
import net.zhenghao.zh.wechat.utils.MessageUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

/**
 * 🙃
 * 🙃 默认消息转换器
 * 🙃
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date :2018/4/25 11:10
 * DefaultMessageConverter.java
 */
@Component
public class DefaultMessageConverter implements MessageConvert {

    private static final Logger LOGGER = LoggerFactory.getLogger(DefaultMessageConverter.class);

    @Override
    public BaseRequestMessage doConvert(String xml, MessageTypeEntity messageTypeEntity) {
        if (messageTypeEntity.getMessageType() == null) {
            LOGGER.error("通过正则表达式没有找到<MsgType>");
            return null;
        }
        MessageType messageType = MessageType.valueBy(messageTypeEntity.getMessageType());
        switch (messageType) {
            //文本消息
            case TEXT:
                return XMLUtils.xmlToBean(xml, TextRequestMessage.class);
            //链接消息
            case LINK:
                return XMLUtils.xmlToBean(xml, LinkRequestMessage.class);
            //图片消息
            case IMAGE:
                return XMLUtils.xmlToBean(xml, ImageRequestMessage.class);
            //语音消息
            case VOICE:
                return XMLUtils.xmlToBean(xml, VoiceRequestMessage.class);
            //短视频消息
            case SHORT_VIDEO:
                return XMLUtils.xmlToBean(xml, ShortVideoRequestMessage.class);
            //视频消息
            case VIDEO:
                return XMLUtils.xmlToBean(xml, VideoRequestMessage.class);
            //地理位置消息
            case LOCATION:
                return XMLUtils.xmlToBean(xml, LocationRequestMessage.class);
            case EVENT:
                if (messageTypeEntity.getEventType() == null) {
                    LOGGER.error("通过正则表达式没有找到<Event>");
                    return null;
                }
                EventType eventType = EventType.valueBy(messageTypeEntity.getEventType());
                switch (eventType) {
                    //关注订阅
                    case SUBSCRIBE:
                        return XMLUtils.xmlToBean(xml, SubscribeEventRequestMessage.class);
                    //取消关注订阅
                    case UNSUBSCRIBE:
                        return XMLUtils.xmlToBean(xml, UnsubscribeEventRequestMessage.class);
                }
            default:
                LOGGER.warn("未知消息类型:{}", messageTypeEntity.getMessageType());
                return null;
        }
    }
}