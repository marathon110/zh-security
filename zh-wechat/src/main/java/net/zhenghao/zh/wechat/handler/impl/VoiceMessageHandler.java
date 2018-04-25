package net.zhenghao.zh.wechat.handler.impl;

import net.zhenghao.zh.wechat.annotation.Message;
import net.zhenghao.zh.wechat.enums.MessageType;
import net.zhenghao.zh.wechat.handler.MessageHandler;
import net.zhenghao.zh.wechat.message.request.BaseRequestMessage;
import net.zhenghao.zh.wechat.message.request.VoiceRequestMessage;
import net.zhenghao.zh.wechat.message.response.BaseResponseMessage;
import net.zhenghao.zh.wechat.message.response.Voice;
import net.zhenghao.zh.wechat.utils.MessageUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Component;

/**
 * 🙃
 * 🙃 语音消息处理器
 * 🙃
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date :2018/4/25 14:56
 * VoiceMessageHandler.java
 */
@Component
@Message(message = MessageType.VOICE)
public class VoiceMessageHandler implements MessageHandler {
    @Override
    public BaseResponseMessage dealMessage(BaseRequestMessage requestMessage) {
        //语音消息处理业务逻辑
        VoiceRequestMessage voiceRequestMessage = (VoiceRequestMessage) requestMessage;
        Voice voice = new Voice();
        voice.setMediaId(StringUtils.isNotBlank(voiceRequestMessage.getMediaId()) ? voiceRequestMessage.getMediaId() : "");
        return MessageUtils.buildVoiceResponseMessage(voiceRequestMessage, voice);
    }
}
