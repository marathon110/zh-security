package net.zhenghao.zh.wechat.enums;

/**
 * 🙃
 * 🙃 微信国家地区语言版本
 * 🙃
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date :2018/4/24 10:24
 * Lang.java
 */
public enum Lang {

    /**
     * 中文，简体字
     */
    CHINESE("zh_CN", "简体"),

    /**
     * 中文，繁体字
     */
    TEADITIONAL("zh_TW", "繁体"),

    /**
     * 英文
     */
    ENGLISH("en", "英语");

    private String code;

    private String name;

    private Lang(String code, String name) {
        this.code = code;
        this.name = name;
    }

    public String getCode() {
        return code;
    }

    public String getName() {
        return name;
    }
}
