package net.zhenghao.zh.tools.entity;

/**
 * 🙃
 * 🙃 二维码实体类
 * 🙃
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date :2018/4/12 10:06
 * SysQrcodeEntity.java
 */
public class SysQrcodeEntity {

    private int height = 380;

    private int width = 380;

    private String content;

    private String format;

    public int getHeight() {
        return height;
    }

    public void setHeight(int height) {
        this.height = height;
    }

    public int getWidth() {
        return width;
    }

    public void setWidth(int width) {
        this.width = width;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getFormat() {
        return format;
    }

    public void setFormat(String format) {
        this.format = format;
    }
}
