package net.zhenghao.zh.wechat.utils;

import com.thoughtworks.xstream.XStream;
import com.thoughtworks.xstream.core.util.QuickWriter;
import com.thoughtworks.xstream.io.HierarchicalStreamWriter;
import com.thoughtworks.xstream.io.xml.PrettyPrintWriter;
import com.thoughtworks.xstream.io.xml.XppDriver;
import net.zhenghao.zh.wechat.entity.ReceiveXmlEntity;
import net.zhenghao.zh.wechat.enums.MessageType;
import net.zhenghao.zh.wechat.message.response.BaseResponseMessage;
import net.zhenghao.zh.wechat.message.response.TextResponseMessage;

import java.io.Writer;

/**
 * 🙃
 * 🙃 消息响应工具类
 * 🙃
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date :2018/4/23 17:15
 * MessageUtils.java
 */
public class MessageUtils {

    /**
     * 扩展xstream，使其支持CDATA块
     */
    private static XStream newXStreamInstance() {
        return new XStream(new XppDriver() {
            @Override
            public HierarchicalStreamWriter createWriter(Writer out) {
                return new PrettyPrintWriter(out) {
                    // 对所有xml节点的转换都增加CDATA标记
                    boolean cdata = true;

                    @Override
                    protected void writeText(QuickWriter writer, String text) {
                        if (this.cdata) {
                            writer.write("<![CDATA[");
                            writer.write(text);
                            writer.write("]]>");
                        } else {
                            writer.write(text);
                        }
                    }
                };
            }
        });
    }

    /**
     * 将相应消息转换成xml字符串
     *
     * @param baseResponseMessage
     * @return
     */
    public static String messageToXml(BaseResponseMessage baseResponseMessage) {
        XStream xStream = newXStreamInstance();
        xStream.processAnnotations(baseResponseMessage.getClass());
        return xStream.toXML(baseResponseMessage);
    }

    /**
     * 根据指定文本内容构建<strong>文本</strong>响应消息
     *
     * @param receiveXmlEntity 请求实体类
     * @param content 文本内容
     * @return
     */
    public static TextResponseMessage buildTextResponseMessage(ReceiveXmlEntity receiveXmlEntity, String content) {
        TextResponseMessage textResponseMessage = new TextResponseMessage();
        textResponseMessage.setContent(content);
        textResponseMessage.setCreateTime(System.currentTimeMillis());
        textResponseMessage.setFromUserName(receiveXmlEntity.getToUserName());
        textResponseMessage.setToUserName(receiveXmlEntity.getFromUserName());
        textResponseMessage.setMsgType(MessageType.TEXT.getType());
        return textResponseMessage;
    }
}
