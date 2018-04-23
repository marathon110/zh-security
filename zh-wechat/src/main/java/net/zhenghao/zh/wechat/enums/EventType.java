package net.zhenghao.zh.wechat.enums;

/**
 * 🙃
 * 🙃
 * 🙃
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date :2018/4/23 15:04
 * EventType.java
 */
public enum EventType {

    /**
     * 关注事件消息
     */
    SUBSCRIBE("subscribe"),

    /**
     * 取消事件消息
     */
    UNSUBSCRIBE("unsubscribe"),

    /**
     * 上报地理位置事件
     */
    LOCATION("location"),

    /**
     * 自定义菜单事件(点击菜单事件)
     */
    CUSTOM_MENU_CLICK("click"),

    /**
     * 自定义菜单事件(点击菜单跳转链接时的事件)
     */
    CUSTOM_MENU_VIEW("view"),

    /**
     * 用户未关注时扫描二维码事件
     */
    SCAN_SUBSCRIBE("subscribe"),

    /**
     * 用户已关注时扫描二维码事件
     */
    SCAN("scan"),

    /**
     * 扫码带提示事件类型
     */
    SCAN_CODE_WAIT_MSG("scancode_waitmsg"),

    SCAN_CODE_PUSH("scancode_push"),

    /**
     * 发送位置菜单事件
     */
    LOCATION_SELECT("location_select"),

    /**
     * 系统拍照发图事件推送
     */
    PIC_SYS_PHOTO("pic_sysphoto"),

    /**
     * 拍照或相册发图事件推送
     */
    PIC_PHOTO_OR_ALBUM("pic_photo_or_album"),

    /**
     * 微信相册发图事件推送
     */
    PIC_WEIXIN("pic_weixin"),

    /**
     * 无意义的一个值，仅仅用于在注解中的一个默认值
     */
    NULL("null");

    private String type;

    public String getType() {
        return this.type;
    }

    private EventType(String type) {
        this.type = type;
    }

    public static EventType valueBy(String typeStr) {
        for (EventType eventType : EventType.values()) {
            if (eventType.getType().equalsIgnoreCase(typeStr)) {
                return eventType;
            }
        }
        return null;
    }
}
