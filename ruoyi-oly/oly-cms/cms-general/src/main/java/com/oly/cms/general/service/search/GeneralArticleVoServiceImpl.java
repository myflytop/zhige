package com.oly.cms.general.service.search;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.oly.cms.general.mapper.ArticleVoSearchMapper;
import com.oly.cms.general.model.param.WebArticleSearchParam;
import com.oly.cms.general.model.vo.WebArticleVo;
import com.oly.cms.general.service.IGeneralSearchService;

/**
 * 文章排序相关
 */
@Service
public class GeneralArticleVoServiceImpl implements IGeneralSearchService {

    @Autowired
    private ArticleVoSearchMapper webArticleSortMapper;

    public List<WebArticleVo> listArticleVo(WebArticleSearchParam bb) {

        return webArticleSortMapper.listWebArticleVo(bb);
    }

    public List<WebArticleVo> listArticleVoOrder(int num, int size, WebArticleSearchParam bb,
            String order) {
        PageHelper.startPage(num, size, order);
        return webArticleSortMapper.listWebArticleVo(bb);
    }

    public List<WebArticleVo> listArticleVoOrder(int num, int size, Integer articleType, Long catId, Long tagId,
            String themeName,
            String order) {
        WebArticleSearchParam bb = new WebArticleSearchParam();
        bb.setThemeName(themeName);
        bb.setArticleType(articleType);
        bb.setCatId(catId);
        bb.setTagId(tagId);
        return this.listArticleVoOrder(num, size, bb, order);
    }

    public WebArticleVo selectPreArticle(long articleId) {
        return webArticleSortMapper.selectPreArticle(articleId);
    }

    public WebArticleVo selectNextArticle(long articleId) {
        return webArticleSortMapper.selectNextArticle(articleId);
    }

}
