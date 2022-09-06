package com.oly.cms.general.service.search;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.oly.cms.common.model.TimeNum;
import com.oly.cms.common.model.enums.ArticleEditTypeEnums;
import com.oly.cms.common.model.enums.ArticleKeyTypeEnums;
import com.oly.cms.common.model.enums.OrderEnums;
import com.oly.cms.common.model.properties.OlyWebConfigProperties;
import com.oly.cms.general.mapper.ArticleSearchMapper;
import com.oly.cms.general.model.PageArticleTimeLine;
import com.oly.cms.general.model.param.WebArticleSearchParam;
import com.oly.cms.general.model.po.WebArticle;
import com.oly.cms.general.service.IGeneralSearchService;
import com.ruoyi.common.core.text.Convert;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.config.service.ISysConfigService;

@Service
public class GeneralArticleServiceImpl implements IGeneralSearchService {

    @Autowired
    private ArticleSearchMapper webSearchMapper;

    @Autowired
    private ISysConfigService configService;

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

    public List<WebArticle> listWebArticlesOrder(int num, int size, WebArticleSearchParam ba, String order) {
        PageHelper.startPage(num, size, order);
        return this.listWebArticles(ba);
    }

    public List<WebArticle> listWebArticlesOrder(int num, int size, Integer articleType, Long catId, Long tagId,
            String themeName,
            OrderEnums order) {
        WebArticleSearchParam bb = new WebArticleSearchParam();
        if (!isSupportType(themeName)) {
            bb.setThemeName(themeName);
        }
        bb.setArticleType(articleType);
        bb.setCatId(catId);
        bb.setTagId(tagId);
        return this.listWebArticlesOrder(num, size, bb, "article_top desc,create_time " + order.name());
    }

    public PageArticleTimeLine groupByTime(int pageNum, int pageSize, WebArticleSearchParam bb) {
        PageHelper.startPage(pageNum, pageSize, "create_time desc");
        List<WebArticle> list = this.listWebArticles(bb);
        // 按照时间分组
        Map<String, List<WebArticle>> map = list.stream()
                .collect(Collectors.groupingBy(webArticle -> neData(webArticle.getCreateTime())));
        return PageArticleTimeLine.getData(list, map);
    }

    public PageArticleTimeLine groupByTime(int pageNum, int pageSize, String themeName) {
        WebArticleSearchParam bb = new WebArticleSearchParam();
        if (!isSupportType(themeName)) {
            bb.setThemeName(themeName);
        }
        return this.groupByTime(pageNum, pageSize, bb);
    }

    public boolean allowComment(long postId) {
        return webSearchMapper.allowComment(postId);
    }

    private String neData(Date date) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
        String newDate = sdf.format(date);
        return newDate;
    }

    public int getArticleNum(String themeName) {
        if (isSupportType(themeName)) {
            return webSearchMapper.getArticleNum();
        }
        return webSearchMapper.getArticleNumUnion(themeName);
    }

    /**
     * 自此类型是否为空
     * 主题名为空默认支持所有类型
     * 
     * @param themeName
     * @return
     */
    private boolean isSupportType(String themeName) {
        if (StringUtils.isEmpty(themeName)) {
            return true;
        } else {
            return StringUtils
                    .isEmpty(configService.selectConfigDefauleValue(themeName, OlyWebConfigProperties.ARTICLE_TYPES));
        }
    }

    public List<TimeNum> listArticleTimeNum(int pageNum, int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        return webSearchMapper.listArticleTimeNum();
    }
}
