package com.oly.cms.general.mapper;

import java.util.List;

import com.oly.cms.general.model.param.WebArticleSearchParam;
import com.oly.cms.general.model.po.WebArticle;

public interface ArticleSearchMapper {
    /**
     * 获取文章列表
     * 
     * @param webArticleSearchParam
     * @return
     */
    List<WebArticle> listWebArticlesBySearch(WebArticleSearchParam webArticleSearchParam);

    WebArticle getWebArticleHtmlByArticleId(long articleId);

    WebArticle getWebArticleMdByArticleId(long articleId);

    WebArticle getWebArticleHtmlByArticleUrl(String articleUrl);

    WebArticle getWebArticleMdByArticleUrl(String articleUrl);

    List<Long> listArticleIdsByCatId(long catId);

    List<Long> listArticleIdsByTagId(long tagId);

    boolean allowComment(Long postId);

    int getArticleNumUnion(String themeName);

    int getArticleNum();

}
