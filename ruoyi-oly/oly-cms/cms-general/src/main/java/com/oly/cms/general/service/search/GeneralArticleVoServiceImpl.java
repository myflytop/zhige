package com.oly.cms.general.service.search;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.github.pagehelper.PageHelper;
import com.oly.cms.common.model.properties.OlyWebConfigProperties;
import com.oly.cms.general.mapper.ArticleVoSearchMapper;
import com.oly.cms.general.model.param.WebArticleSearchParam;
import com.oly.cms.general.model.vo.WebArticleVo;
import com.oly.cms.general.service.IGeneralSearchService;
import com.ruoyi.system.config.service.ISysConfigService;
import com.ruoyi.common.utils.StringUtils;

/**
 * 文章排序相关
 */
@Service
public class GeneralArticleVoServiceImpl implements IGeneralSearchService {

    @Autowired
    private ArticleVoSearchMapper webArticleSortMapper;
    @Autowired
    private ISysConfigService configService;

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
        if (!isSupportType(themeName)) {
            bb.setThemeName(themeName);
        }
        bb.setArticleType(articleType);
        bb.setCatId(catId);
        bb.setTagId(tagId);
        return this.listArticleVoOrder(num, size, bb, order);
    }

    /**
     * 自此类型是否为空
     * 主题名为空默认支持所有类型
     * 
     * @param themeName
     * @return
     */
    private boolean isSupportType(String themeName) {
        if (StringUtils.isNotEmpty(themeName)) {
            return true;
        } else {
            return StringUtils
                    .isEmpty(configService.selectConfigDefauleValue(themeName, OlyWebConfigProperties.ARTICLE_TYPES));
        }
    }

    public WebArticleVo selectPreArticle(long articleId) {
        return webArticleSortMapper.selectPreArticle(articleId);
    }

    public WebArticleVo selectNextArticle(long articleId) {
        return webArticleSortMapper.selectNextArticle(articleId);
    }

}
