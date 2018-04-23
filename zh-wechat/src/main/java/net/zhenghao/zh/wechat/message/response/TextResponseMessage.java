package net.zhenghao.zh.wechat.message.response;

import com.thoughtworks.xstream.annotations.XStreamAlias;
import net.zhenghao.zh.wechat.enums.MessageType;

/**
 * 🙃
 * 🙃 回复文本消息的封装
 * 🙃
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date :2018/4/23 17:05
 * TextResponseMessage.java
 */
@XStreamAlias("xml")
public class TextResponseMessage extends BaseResponseMessage{

    /**
     * 回复的消息内容（换行：在content中能够换行，微信客户端就支持换行显示）
     */
    @XStreamAlias("Content")
    private String content;

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
