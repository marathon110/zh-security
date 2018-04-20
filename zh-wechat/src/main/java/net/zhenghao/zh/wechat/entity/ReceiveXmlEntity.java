package net.zhenghao.zh.wechat.entity;

/**
 * 🙃
 * 🙃 接收到的微信xml实体类
 * 🙃
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date :2018/4/20 14:15
 * ReceiveXmlEntity.java
 */
public class ReceiveXmlEntity {

    /**
     * 接收方账号（一个OpenID或者公众号id）
     */
    private String ToUserName="";

    /**
     * 发送方帐号（一个OpenID或者公众号id）
     */
    private String FromUserName="";

    /**
     * 消息创建时间 （整型）
     */
    private String CreateTime="";

    /**
     * 消息类型
     * 	text文本  image图片  voice语音  video视频  shortvideo小视频  location地理位置  link链接
     * 	music音乐  news图文
     * 	event事件
     */
    private String MsgType="";

    /**
     * 	消息id，64位整型
     */
    private String MsgId="";

    /**
     * 关注/取消关注
     * 事件类型，subscribe(订阅)、unsubscribe(取消订阅)
     *
     * 扫描带参数二维码
     *      用户未关注时，进行关注后的事件推送
     *      事件类型，subscribe
     *      用户已关注时的事件推送
     *      事件类型，SCAN
     *
     * 上报地理位置
     * 事件类型，LOCATION
     *
     * 自定义菜单
     * 事件类型，CLICK
     *
     * 点击菜单跳转链接时的事件推送
     * 事件类型，VIEW
     */
    private String Event="";

    /**
     * 扫描带参数二维码
     *      1. 用户未关注时，进行关注后的事件
     *      事件KEY值，qrscene_为前缀，后面为二维码的参数值
     *      2. 用户已关注时的事件推送
     *      事件KEY值，是一个32位无符号整数，即创建二维码时的二维码scene_id
     * 自定义菜单
     *      点击菜单拉取消息时的事件推送
     *      事件KEY值，与自定义菜单接口中KEY值对应
     *      点击菜单跳转链接时的事件
     *      事件KEY值，设置的跳转URL
     */
    private String EventKey="";

    /**
     * 二维码的ticket，可用来换取二维码图片
     */
    private String Ticket="";

    /**
     * 	地理位置纬度
     */
    private String Latitude="";

    /**
     * 	地理位置经度
     */
    private String Longitude="";

    /**
     *  地理位置精度
     */
    private String Precision="";

    /**
     * 	图片链接（由系统生成）
     */
    private String PicUrl="";

    /**
     * 可以调用多媒体文件下载接口拉取数据。
     * 图片消息媒体id
     * 语音消息媒体id
     * 视频消息媒体id
     *
     * 回复图片消息
     *      通过素材管理中的接口上传多媒体文件，得到的id。
     */
    private String MediaId="";

    /**
     *  消息、视频消息、音乐、图文消息标题
     */
    private String Title="";

    /**
     *  消息、视频消息、音乐、图文消息描述
     */
    private String Description="";

    /**
     * 消息链接
     * 点击图文消息跳转链接
     */
    private String Url="";

    /**
     * 图文消息个数，限制为8条以内
     */
    private String ArticleCount="";

    /**
     * 多条图文消息信息，默认第一个item为大图,注意，如果图文数超过8，则将会无响应
     */
    private String Articles="";

    /**
     * 音乐链接
     */
    private String MusicURL="";

    /**
     * 高质量音乐链接，WIFI环境优先使用该链接播放音乐
     */
    private String HQMusicUrl="";

    /**
     * 缩略图的媒体id，通过素材管理中的接口上传多媒体文件，得到的id
     */
    private String ThumbMediaId="";

    /**
     * 地理位置维度
     */
    private String Location_X="";

    /**
     * 地理位置经度
     */
    private String Location_Y="";

    /**
     * 	地图缩放大小
     */
    private String Scale="";

    /**
     * 地理位置信息
     */
    private String Label="";

    /**
     * 文本消息内容（换行：在content中能够换行，微信客户端就支持换行显示）
     */
    private String Content="";

    /**
     *	语音格式，如amr，speex等
     */
    private String Format="";

    /**
     * 语音识别结果，UTF8编码
     */
    private String Recognition="";

    public String getToUserName() {
        return ToUserName;
    }

    public void setToUserName(String toUserName) {
        ToUserName = toUserName;
    }

    public String getFromUserName() {
        return FromUserName;
    }

    public void setFromUserName(String fromUserName) {
        FromUserName = fromUserName;
    }

    public String getCreateTime() {
        return CreateTime;
    }

    public void setCreateTime(String createTime) {
        CreateTime = createTime;
    }

    public String getMsgType() {
        return MsgType;
    }

    public void setMsgType(String msgType) {
        MsgType = msgType;
    }

    public String getMsgId() {
        return MsgId;
    }

    public void setMsgId(String msgId) {
        MsgId = msgId;
    }

    public String getEvent() {
        return Event;
    }

    public void setEvent(String event) {
        Event = event;
    }

    public String getEventKey() {
        return EventKey;
    }

    public void setEventKey(String eventKey) {
        EventKey = eventKey;
    }

    public String getTicket() {
        return Ticket;
    }

    public void setTicket(String ticket) {
        Ticket = ticket;
    }

    public String getLatitude() {
        return Latitude;
    }

    public void setLatitude(String latitude) {
        Latitude = latitude;
    }

    public String getLongitude() {
        return Longitude;
    }

    public void setLongitude(String longitude) {
        Longitude = longitude;
    }

    public String getPrecision() {
        return Precision;
    }

    public void setPrecision(String precision) {
        Precision = precision;
    }

    public String getPicUrl() {
        return PicUrl;
    }

    public void setPicUrl(String picUrl) {
        PicUrl = picUrl;
    }

    public String getMediaId() {
        return MediaId;
    }

    public void setMediaId(String mediaId) {
        MediaId = mediaId;
    }

    public String getTitle() {
        return Title;
    }

    public void setTitle(String title) {
        Title = title;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String description) {
        Description = description;
    }

    public String getUrl() {
        return Url;
    }

    public void setUrl(String url) {
        Url = url;
    }

    public String getArticleCount() {
        return ArticleCount;
    }

    public void setArticleCount(String articleCount) {
        ArticleCount = articleCount;
    }

    public String getArticles() {
        return Articles;
    }

    public void setArticles(String articles) {
        Articles = articles;
    }

    public String getMusicURL() {
        return MusicURL;
    }

    public void setMusicURL(String musicURL) {
        MusicURL = musicURL;
    }

    public String getHQMusicUrl() {
        return HQMusicUrl;
    }

    public void setHQMusicUrl(String HQMusicUrl) {
        this.HQMusicUrl = HQMusicUrl;
    }

    public String getThumbMediaId() {
        return ThumbMediaId;
    }

    public void setThumbMediaId(String thumbMediaId) {
        ThumbMediaId = thumbMediaId;
    }

    public String getLocation_X() {
        return Location_X;
    }

    public void setLocation_X(String location_X) {
        Location_X = location_X;
    }

    public String getLocation_Y() {
        return Location_Y;
    }

    public void setLocation_Y(String location_Y) {
        Location_Y = location_Y;
    }

    public String getScale() {
        return Scale;
    }

    public void setScale(String scale) {
        Scale = scale;
    }

    public String getLabel() {
        return Label;
    }

    public void setLabel(String label) {
        Label = label;
    }

    public String getContent() {
        return Content;
    }

    public void setContent(String content) {
        Content = content;
    }

    public String getFormat() {
        return Format;
    }

    public void setFormat(String format) {
        Format = format;
    }

    public String getRecognition() {
        return Recognition;
    }

    public void setRecognition(String recognition) {
        Recognition = recognition;
    }
}
