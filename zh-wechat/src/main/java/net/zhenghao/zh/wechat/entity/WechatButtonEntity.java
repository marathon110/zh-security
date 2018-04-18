package net.zhenghao.zh.wechat.entity;

import java.util.List;

/**
 * 🙃
 * 🙃 微信公众号菜单封装实体类
 * 🙃
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date :2018/4/18 11:23
 * WechatButtonEntity.java
 */
public class WechatButtonEntity {

    private List<WechatMenuEntity> button;

    public List<WechatMenuEntity> getButton() {
        return button;
    }

    public void setButton(List<WechatMenuEntity> button) {
        this.button = button;
    }
}
