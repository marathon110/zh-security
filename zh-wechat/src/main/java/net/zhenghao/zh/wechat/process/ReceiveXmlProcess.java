package net.zhenghao.zh.wechat.process;

import net.zhenghao.zh.common.utils.XMLUtils;
import net.zhenghao.zh.wechat.entity.ReceiveXmlEntity;

/**
 * 🙃
 * 🙃 微信消息xml处理类
 * 🙃
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date :2018/4/20 15:58
 * ReceiveXmlProcess.java
 */
public class ReceiveXmlProcess {

    /**
     * 解析接收到的微信xml，返回消息对象
     * @param xml
     * @return
     */
    public static ReceiveXmlEntity getEntity(String xml) {
        return XMLUtils.xmlToBean(xml, new ReceiveXmlEntity());
    }
}
