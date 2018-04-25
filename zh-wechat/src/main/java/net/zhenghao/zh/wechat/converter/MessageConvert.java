package net.zhenghao.zh.wechat.converter;

import net.zhenghao.zh.wechat.message.request.BaseRequestMessage;

/**
 * 🙃
 * 🙃 接收消息转换器
 * 🙃 将不同类型的消息转成不同类型的消息对象
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date :2018/4/25 11:06
 * MessageConvert.java
 */
public interface MessageConvert {

    /**
     * 处理用户请求xml转换为相应消息对象
     * @param xml
     * @return
     */
    BaseRequestMessage doConvert(String xml);
}
