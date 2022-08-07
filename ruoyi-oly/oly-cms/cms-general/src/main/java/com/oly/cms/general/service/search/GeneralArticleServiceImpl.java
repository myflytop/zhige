package com.oly.cms.general.service.search;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import com.github.pagehelper.PageHelper;
import com.oly.cms.common.domain.entity.CmsCat;
import com.oly.cms.common.domain.entity.CmsTag;
import com.oly.cms.common.model.enums.ArticleEditTypeEnums;
import com.oly.cms.common.model.enums.ArticleKeyTypeEnums;
import com.oly.cms.common.model.enums.OrderEnums;
import com.oly.cms.common.model.properties.OlyWebConfigProperties;
import com.oly.cms.general.mapper.CategorySearchMapper;
import com.oly.cms.general.mapper.ArticleSearchMapper;
import com.oly.cms.general.mapper.TagSearchMapper;
import com.oly.cms.general.model.PageArticleTimeLine;
import com.oly.cms.general.model.param.WebArticleSearchParam;
import com.oly.cms.general.model.po.WebArticle;
import com.oly.cms.general.service.IGeneralSearchService;
import com.ruoyi.common.core.text.Convert;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.config.service.ISysConfigService;

import org.apache.commons.lang3.ArrayUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GeneralArticleServiceImpl implements IGeneralSearchService {
    @Autowired
    private ArticleSearchMapper webSearchMapper;

    @Autowired
    private ISysConfigService configService;

    @Autowired
    private CategorySearchMapper categorySearchMapper;

    @Autowired
    private TagSearchMapper tagSearchMapper;

    /**
     * 综合查询
     * 
     * @param bb
     * @return
     */
    public List<WebArticle> listWebArticles(WebArticleSearchParam bb) {

        return webSearchMapper.listWebArticlesBySearch(bb);
    }

    public WebArticle getWebArticle(ArticleKeyTypeEnums keyType, String key, ArticleEditTypeEnums editType) {
        WebArticle article = null;
        switch (keyType) {
            case URL:
                switch (editType) {
                    case RICH:
                        article = this.getWebArticleHtmlByUrl(key);
                        break;
                    case MD:
                        article = this.getWebArticleMdByUrl(key);
                        break;
                }
                break;
            case ID:
                long id = Convert.toLong(key, -1L);
                switch (editType) {
                    case RICH:
                        article = this.getWebArticleHtmlById(id);
                        break;
                    case MD:
                        article = this.getWebArticleMdById(id);
                        break;
                }
                break;
        }

        return article;
    }

    /**
     * 通过文章Id获取Html
     * 
     * @param articleId
     * @return
     */
    public WebArticle getWebArticleHtmlById(long articleId) {

        return webSearchMapper.getWebArticleHtmlByArticleId(articleId);
    }

    /**
     * 通过文章Id获取Md
     * 
     * @param articleId
     * @return
     */
    public WebArticle getWebArticleMdById(long articleId) {

        return webSearchMapper.getWebArticleHtmlByArticleId(articleId);
    }

    public WebArticle getWebArticleHtmlByUrl(String articleUrl) {

        return webSearchMapper.getWebArticleHtmlByArticleUrl(articleUrl);
    }

    public WebArticle getWebArticleMdByUrl(String articleUrl) {

        return webSearchMapper.getWebArticleMdByArticleUrl(articleUrl);
    }

    public List<WebArticle> listWebArticlesOrder(int num, int size, String order, String themeName) {
        WebArticleSearchParam ba = new WebArticleSearchParam();
        if (StringUtils.isNotEmpty(themeName)) {
            setThemeName(ba, themeName);
        }
        PageHelper.startPage(num, size, order);
        return this.listWebArticles(ba);
    }

    public List<WebArticle> listWebArticlesByCatId(long catId, String themeName, int num, int size, OrderEnums order) {
        CmsCat cmsCat = categorySearchMapper.selectCmsCatById(catId);
        String supportType = getSupportType(themeName);
        if (cmsCat != null) {
            if (StringUtils.isEmpty(supportType)
                    || ArrayUtils.contains(supportType.split(","), cmsCat.getCatType().toString())) {
                WebArticleSearchParam webArticleSearchParam = new WebArticleSearchParam();
                webArticleSearchParam.setCatId(catId);
                webArticleSearchParam.setThemeName(themeName);
                PageHelper.startPage(num, size, "article_top desc,create_time " + order.name());
                return this.listWebArticles(webArticleSearchParam);
            } else {
                return null;
            }

        } else {
            return null;
        }
    }

    public List<WebArticle> listWebArticlesByTagId(long tagId, String themeName, int num, int size, OrderEnums order) {
        CmsTag cmsTag = tagSearchMapper.selectCmsTagById(tagId);
        String supportType = getSupportType(themeName);
        if (cmsTag != null) {
            if (StringUtils.isEmpty(supportType)
                    || ArrayUtils.contains(supportType.split(","), cmsTag.getTagType().toString())) {
                WebArticleSearchParam webArticleSearchParam = new WebArticleSearchParam();
                webArticleSearchParam.setTagId(tagId);
                webArticleSearchParam.setThemeName(themeName);
                PageHelper.startPage(num, size, "article_top desc,create_time " + order.name());
                return this.listWebArticles(webArticleSearchParam);
            } else {
                return null;
            }
        } else {
            return null;
        }
    }

    public List<WebArticle> listWebArticlesByType(int type, int num, int size, String orderString) {
        WebArticleSearchParam bb = new WebArticleSearchParam();
        bb.setArticleType(type);
        PageHelper.startPage(num, size, orderString);
        return this.listWebArticles(bb);
    }

    public PageArticleTimeLine groupByTime(int pageNum, int pageSize, WebArticleSearchParam bb, String themeName) {
        PageHelper.startPage(pageNum, pageSize, "create_time desc");
        setThemeName(bb, themeName);
        List<WebArticle> list = this.listWebArticles(bb);
        // 按照时间分组
        Map<String, List<WebArticle>> map = list.stream()
                .collect(Collectors.groupingBy(webArticle -> neData(webArticle.getCreateTime())));
        return PageArticleTimeLine.getData(list, map);
    }

    public PageArticleTimeLine groupByTime(int pageNum, int pageSize, String themeName) {
        WebArticleSearchParam bb = new WebArticleSearchParam();
        return this.groupByTime(pageNum, pageSize, bb, themeName);
    }

    public boolean allowComment(long postId) {
        return webSearchMapper.allowComment(postId);
    }

    private String getSupportType(String themeName) {
        if (StringUtils.isEmpty(themeName)) {
            return null;
        }
        return configService.selectConfigDefauleValue(themeName, OlyWebConfigProperties.ARTICLE_TYPES);
    }

    private void setThemeName(WebArticleSearchParam bb, String themeName) {
        if (StringUtils.isEmpty(themeName)) {
            return;
        }
        // 如果获取类型为空,支持所有类型
        String supportType = configService.selectConfigDefauleValue(themeName, OlyWebConfigProperties.ARTICLE_TYPES);
        if (StringUtils.isNotEmpty(supportType)) {
            bb.setThemeName(themeName);
        }
    }

    private String neData(Date date) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy MM");
        String newDate = sdf.format(date);
        return newDate;
    }
}
