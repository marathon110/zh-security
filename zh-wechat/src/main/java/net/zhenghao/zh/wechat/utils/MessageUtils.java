package net.zhenghao.zh.wechat.utils;

import com.thoughtworks.xstream.XStream;
import com.thoughtworks.xstream.core.util.QuickWriter;
import com.thoughtworks.xstream.io.HierarchicalStreamWriter;
import com.thoughtworks.xstream.io.xml.PrettyPrintWriter;
import com.thoughtworks.xstream.io.xml.XppDriver;
import net.zhenghao.zh.wechat.enums.MessageType;
import net.zhenghao.zh.wechat.message.request.BaseRequestMessage;
import net.zhenghao.zh.wechat.message.response.*;

import java.io.Writer;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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
     * 解析微信消息类型正则表达式
     */
    private static final Pattern MESSAGE_TYPE_PATTERN = Pattern.compile("\\<MsgType\\>\\<\\!\\[CDATA\\[(.*?)\\]\\]\\>\\<\\/MsgType\\>");

    /**
     * 解析微信事件类型字段正则表达式
     */
    private static final Pattern EVENT_TYPE_PATTERN = Pattern.compile("\\<Event\\>\\<\\!\\[CDATA\\[(.*?)\\]\\]\\>\\<\\/Event\\>");

    /**
     * 获取微信消息类型
     * @param xml
     * @return
     */
    public static String getMessageType(String xml) {
        Matcher matcher = MESSAGE_TYPE_PATTERN.matcher(xml);
        return matcher.find() ? matcher.group(1) : null;
    }

    /**
     * 获取微信事件类型
     * @param xml
     * @return
     */
    public static String getEventType(String xml) {
        Matcher matcher = EVENT_TYPE_PATTERN.matcher(xml);
        return matcher.find() ? matcher.group(1) : null;
    }

    /**
     * 根据指定文本内容构建<strong>文本</strong>响应消息
     *
     * @param requestMessage 请求实体类
     * @param content 文本内容
     * @return
     */
    public static TextResponseMessage buildTextResponseMessage(BaseRequestMessage requestMessage, String content) {
        TextResponseMessage textResponseMessage = new TextResponseMessage();
        textResponseMessage.setContent(content);
        textResponseMessage.setCreateTime(System.currentTimeMillis());
        textResponseMessage.setFromUserName(requestMessage.getToUserName());
        textResponseMessage.setToUserName(requestMessage.getFromUserName());
        textResponseMessage.setMsgType(MessageType.TEXT.getType());
        return textResponseMessage;
    }

    /**
     * 根据指定文本内容构建<strong>图片</strong>响应消息
     *
     * @param requestMessage 请求实体类
     * @param image 微信图片封装类
     * @return
     */
    public static ImageResponseMessage buildImageResponseMessage(BaseRequestMessage requestMessage, Image image) {
        ImageResponseMessage imageResponseMessage = new ImageResponseMessage();
        imageResponseMessage.setMsgType(MessageType.IMAGE.getType());
        imageResponseMessage.setCreateTime(System.currentTimeMillis());
        imageResponseMessage.setFromUserName(requestMessage.getToUserName());
        imageResponseMessage.setToUserName(requestMessage.getFromUserName());
        imageResponseMessage.setImage(image);
        return imageResponseMessage;
    }

    /**
     * 根据参数构建<strong>语音</strong>回复消息
     *
     * @param requestMessage 请求实体类
     * @param voice 微信语音封装类
     * @return
     */
    public static VoiceResponseMessage buildVoiceResponseMessage(BaseRequestMessage requestMessage, Voice voice) {
        VoiceResponseMessage voiceResponseMessage = new VoiceResponseMessage();
        voiceResponseMessage.setToUserName(requestMessage.getFromUserName());
        voiceResponseMessage.setFromUserName(requestMessage.getToUserName());
        voiceResponseMessage.setMsgType(MessageType.VOICE.getType());
        voiceResponseMessage.setCreateTime(System.currentTimeMillis());
        voiceResponseMessage.setVoice(voice);
        return voiceResponseMessage;
    }

    /**
     * 根据参数构建<strong>视频、短视频消息</strong>
     *
     * @param requestMessage 请求实体类
     * @param video 微信视频、短视频封装类
     * @return
     */
    public static VideoResponseMessage buildVideoResponseMessage(BaseRequestMessage requestMessage, Video video) {
        VideoResponseMessage videoResponseMessage = new VideoResponseMessage();
        videoResponseMessage.setCreateTime(System.currentTimeMillis());
        videoResponseMessage.setToUserName(requestMessage.getFromUserName());
        videoResponseMessage.setFromUserName(requestMessage.getToUserName());
        videoResponseMessage.setMsgType(MessageType.VIDEO.getType());
        videoResponseMessage.setVideo(video);
        return videoResponseMessage;
    }

    /**
     * 根据参数构建<strong>图文消息</strong>
     *
     * @param baseRequestMessage 请求实体类
     * @param articles 图文消息集合类
     * @return
     */
    public static NewsResponseMessage buildNewsResponseMessage(BaseRequestMessage baseRequestMessage, List<Article> articles) {
        NewsResponseMessage newsResponseMessage = new NewsResponseMessage();
        newsResponseMessage.setCreateTime(System.currentTimeMillis());
        newsResponseMessage.setToUserName(baseRequestMessage.getFromUserName());
        newsResponseMessage.setFromUserName(baseRequestMessage.getToUserName());
        newsResponseMessage.setMsgType(MessageType.NEWS.getType());
        newsResponseMessage.setArticleCount(articles == null ? 0 : articles.size());
        newsResponseMessage.setArticles(articles);
        return newsResponseMessage;
    }

    /**
     * 根据参数构建<strong>音乐</strong>回复消息
     *
     * @param baseRequestMessage 请求实体类
     * @param music 音乐封装类
     * @return
     */
    public static MusicResponseMessage buildMusicResponseMessage(BaseRequestMessage baseRequestMessage, Music music) {
        MusicResponseMessage musicResponseMessage = new MusicResponseMessage();
        musicResponseMessage.setCreateTime(System.currentTimeMillis());
        musicResponseMessage.setFromUserName(baseRequestMessage.getToUserName());
        musicResponseMessage.setMsgType(MessageType.MUSIC.getType());
        musicResponseMessage.setToUserName(baseRequestMessage.getFromUserName());
        musicResponseMessage.setMusic(music);
        return musicResponseMessage;
    }
}
