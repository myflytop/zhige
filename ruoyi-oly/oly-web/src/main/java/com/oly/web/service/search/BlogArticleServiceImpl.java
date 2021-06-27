package com.oly.web.service.search;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import com.github.pagehelper.PageHelper;
import com.oly.common.model.properties.OlyWebConfigProetries;
import com.oly.common.model.support.PageData;
import com.oly.web.mapper.BlogSearchMapper;
import com.oly.web.model.PageArticleTimeLine;
import com.oly.web.model.pam.BlogArticleSearchParam;
import com.oly.web.model.po.BlogArticle;
import com.oly.web.service.IBlogSearchService;
import com.oly.web.service.cache.BlogConfigCacheService;
import com.ruoyi.common.utils.StringUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BlogArticleServiceImpl implements IBlogSearchService {
    @Autowired
    private BlogSearchMapper blogSearchMapper;

    @Autowired
    private BlogConfigCacheService commonService;

    /**
     * 综合查询
     * @param bb
     * @return
     */
    public List<BlogArticle> listBlogArticles(BlogArticleSearchParam bb,String themeName) {
        setSupportType(bb, themeName);
        return blogSearchMapper.listBlogArticlesBySearch(bb);
    }

    /**
     * 通过文章Id获取Html
     * @param articleId
     * @return
     */
    public BlogArticle getBlogArticleHtmlById(Long articleId) {

        return blogSearchMapper.getBlogArticleHtmlByArticleId(articleId);
    }

    /**
     * 通过文章Id获取Md
     * @param articleId
     * @return
     */
    public BlogArticle getBlogArticleMdById(Long articleId) {

        return blogSearchMapper.getBlogArticleHtmlByArticleId(articleId);
    }

    public BlogArticle getBlogArticleByUrl(String articleUrl) {

        return blogSearchMapper.getBlogArticleByArticleUrl(articleUrl);
    }

    public List<BlogArticle> listBlogArticlesOrder(Integer size, String order, String themeName) {
        return this.listBlogArticlesOrder(size, 1, order, themeName);
    }

    public List<BlogArticle> listBlogArticlesOrder(Integer size, Integer num, String order, String themeName) {
        BlogArticleSearchParam ba = new BlogArticleSearchParam();
        setSupportType(ba, themeName);
        PageHelper.startPage(num, size, order);
        return blogSearchMapper.listBlogArticlesBySearch(ba);
    }

    public List<BlogArticle> listBlogArticlesByCatId(Long catId, Integer size, String themeName) {
        BlogArticleSearchParam blogArticleSearchParam = new BlogArticleSearchParam();
        blogArticleSearchParam.setCatId(catId);
        PageHelper.startPage(1, size);
        return this.listBlogArticles(blogArticleSearchParam,themeName);
    }

    public List<BlogArticle> listBlogArticlesByTagId(Long tagId, Integer size, String themeName) {
        BlogArticleSearchParam blogArticleSearchParam = new BlogArticleSearchParam();
        blogArticleSearchParam.setTagId(tagId);
        PageHelper.startPage(1, size);
        return this.listBlogArticles(blogArticleSearchParam,themeName);
    }

    public List<BlogArticle> listBlogArticlesByType(Byte type, Integer size, String orderString) {
        BlogArticleSearchParam bb = new BlogArticleSearchParam();
        bb.setArticleType(type);
        PageHelper.startPage(1, size, orderString);
        return blogSearchMapper.listBlogArticlesBySearch(bb);
    }


    public PageArticleTimeLine groupByTime(Integer pageNum, Integer pageSize, BlogArticleSearchParam bb,String themeName) {
        setSupportType(bb, themeName);
        PageHelper.startPage(pageNum, pageSize, "create_time desc");
        List<BlogArticle> list = blogSearchMapper.listBlogArticlesBySearch(bb);
        // 按照时间分组
        Map<String, List<BlogArticle>> map = list.stream()
                .collect(Collectors.groupingBy(blogArticle -> neData(blogArticle.getCreateTime())));
        return PageArticleTimeLine.getData(list,map);
    }


    public PageArticleTimeLine groupByTime(Integer pageNum, Integer pageSize,String themeName) {
        BlogArticleSearchParam bb = new BlogArticleSearchParam();
        return this.groupByTime(pageNum, pageSize, bb,themeName);
    }

    private void setSupportType(BlogArticleSearchParam bb, String themeName) {
        String supportType = commonService.getBackConfigDefauleValue(themeName, OlyWebConfigProetries.ARTICLE_TYPES);
        if (StringUtils.isNotEmpty(supportType)) {
            bb.setTypes(supportType);
        }
    }

    public boolean allowComment(Long postId) {
        return blogSearchMapper.allowComment(postId);
    }

    private String neData(Date date) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy MM");
        String newDate = sdf.format(date);
        return newDate;
    }
}
