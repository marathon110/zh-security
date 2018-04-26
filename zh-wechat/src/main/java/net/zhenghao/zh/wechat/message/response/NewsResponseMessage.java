package net.zhenghao.zh.wechat.message.response;

import com.thoughtworks.xstream.annotations.XStreamAlias;

import java.util.List;

/**
 * 🙃
 * 🙃 图文消息封装
 * 🙃
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date :2018/4/26 17:30
 * NewsResponseMessage.java
 */
@XStreamAlias("xml")
public class NewsResponseMessage extends BaseResponseMessage {

    /**
     * 图文消息个数，限制为10条以内
     */
    @XStreamAlias("ArticleCount")
    private int articleCount;

    /**
     * 多条图文消息信息，默认第一个item为大图,注意，如果图文数超过10，则将会无响应
     */
    @XStreamAlias("Articles")
    private List<Article> articles;

    public int getArticleCount() {
        return articleCount;
    }

    public void setArticleCount(int articleCount) {
        this.articleCount = articleCount;
    }

    public List<Article> getArticles() {
        return articles;
    }

    public void setArticles(List<Article> articles) {
        this.articles = articles;
    }
}
