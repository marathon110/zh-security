package net.zhenghao.zh.wechat.message.request;

import com.thoughtworks.xstream.annotations.XStreamAlias;

/**
 * 🙃
 * 🙃 菜单自定义跳转事件
 * 🙃
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date :2018/4/27 14:47
 * CustomMenuViewEventRequestMessage.java
 */
@XStreamAlias("xml")
public class CustomMenuViewEventRequestMessage extends EventRequestMessage {

    @XStreamAlias("MenuId")
    private Long menuId;

    public Long getMenuId() {
        return menuId;
    }

    public void setMenuId(Long menuId) {
        this.menuId = menuId;
    }
}
