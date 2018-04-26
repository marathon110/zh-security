package net.zhenghao.zh.wechat.handler;

import net.zhenghao.zh.wechat.message.request.BaseRequestMessage;
import net.zhenghao.zh.wechat.message.response.BaseResponseMessage;

/**
 * 🙃
 * 🙃 消息处理器接口
 * 🙃
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date :2018/4/23 14:28
 * MessageHandler.java
 */
public interface MessageHandler {

    BaseResponseMessage dealMessage(BaseRequestMessage requestMessage);

}
