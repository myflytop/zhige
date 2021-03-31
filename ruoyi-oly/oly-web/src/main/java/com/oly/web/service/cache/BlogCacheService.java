package com.oly.web.service.cache;

import java.util.List;

import com.github.pagehelper.PageHelper;
import com.oly.web.mould.BlogArticle;
import com.oly.web.mould.BlogArticleCountSort;
import com.oly.web.mould.BlogArticleSort;
import com.oly.web.mould.BlogCat;
import com.oly.web.mould.BlogLink;
import com.oly.web.mould.BlogMenu;
import com.oly.web.mould.BlogTag;
import com.oly.web.mould.pam.BlogArticleSearchParam;
import com.oly.web.service.impl.BlogArticleSortServiceImpl;
import com.oly.web.service.impl.BlogServiceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

/**
 * 首次请求的需要缓存 基本数据需要缓存
 */

@Service
@CacheConfig(cacheNames = "oly-web")
public class BlogCacheService {
    
  

    @Autowired
    private BlogServiceImpl blogService;

    @Autowired
    private BlogArticleSortServiceImpl blogSortService;

    @Cacheable(key = "targetClass + methodName +#p0")
    public List<BlogMenu> listBlogMenus(long menuId) {
        BlogMenu blogMenu = new BlogMenu();
        blogMenu.setColumnId(menuId);
        return blogService.listBlogMenus(blogMenu);
    }

    @Cacheable(key = "targetClass + methodName +#p0")
    public BlogMenu getBlogMenuById(Long menuId) {
        return blogService.getBlogMenuById(menuId);
    }

    @Cacheable(key = "targetClass + methodName +#p0")
    public BlogMenu listBlogMenuTreeByColumnId(Long columnId) {
        return blogService.listBlogMenuTreeByColumnId(columnId);
    }
    // 以上菜单

    @Cacheable(key = "targetClass + methodName +#p0")
    public List<BlogLink> listBlogLinks(String gName) {
        BlogLink blogLink = new BlogLink();
        blogLink.setGroupName(gName);
        return blogService.listBlogLinks(blogLink);
    }

    @Cacheable(key = "targetClass + methodName +#p0")
    public BlogLink getBlogLinkById(Long linkId) {
        return blogService.getBlogLinkById(linkId);
    }
    // 以上外链

    @Cacheable(key = "targetClass + methodName +#p0+#p1")
    public List<BlogTag> listBlogTags(int pageSize, String ordeString) {
        PageHelper.startPage(1, pageSize, ordeString);
        return blogService.listBlogTags(null);
    }

    @Cacheable(key = "targetClass + methodName +#p0")
    public BlogTag getBlogTagByTagId(long tagId) {
        return blogService.getBlogTagByTagId(tagId);
    }

    @Cacheable(key = "targetClass + methodName +#p0")
    public List<BlogTag> listHotTags(Long[] str) {
        return blogService.listHotTags(str);
    }

    @Cacheable(key = "targetClass + methodName +#p0+ #p1")
    public List<BlogArticle> listBlogArticlesByTagId(long tagId, int pageSize) {
        BlogArticleSearchParam blogArticleSearchParam = getArticleSearchParam();
        blogArticleSearchParam.setTagId(tagId);
        PageHelper.startPage(1, pageSize, "create_time desc");
        return blogService.listBlogArticlesByTagId(blogArticleSearchParam);
    }

    @Cacheable(key = "targetClass + methodName +#p0")
    public BlogTag getBlogTagByTagUrl(String tagUrl) {
        return blogService.getBlogTagByTagUrl(tagUrl);
    }
    // 以上标签

    @Cacheable(key = "targetClass + methodName +#p0+#p1")
    public List<BlogArticle> listBlogArticlesByCatId(long catId, int pageSize) {
        BlogArticleSearchParam blogArticleSearchParam = getArticleSearchParam();
        blogArticleSearchParam.setCatId(catId);
        PageHelper.startPage(1, pageSize, "create_time desc");
        return blogService.listBlogArticlesByCatId(blogArticleSearchParam);
    }

    @Cacheable(key = "targetClass + methodName +#p0")
    public List<BlogCat> listHotCats(Long[] str) {
        return blogService.listHotCats(str);
    }

    @Cacheable(key = "targetClass + methodName +#p0")
    public BlogCat getBlogCatByCatUrl(String catUrl) {
        return blogService.getBlogCatByCatUrl(catUrl);
    }

    @Cacheable(key = "targetClass + methodName +#p0")
    public List<BlogCat> listBlogCats(BlogCat cat) {
        return blogService.listBlogCats(cat);
    }
    // 以上分类

    @Cacheable(key = "targetClass + methodName +#p0+#p1")
    public List<BlogArticle> listBlogArticles(int pageSize, String ordeString) {
        PageHelper.startPage(1, pageSize, ordeString);
        return blogService.listBlogArticles(null);
    }

    @Cacheable(key = "targetClass + methodName +#p0")
    public BlogArticle getBlogArticleByArticleId(long articleId) {
        return blogService.getBlogArticleByArticleId(articleId);
    }

    @Cacheable(key = "targetClass + methodName +#p0+#p1+#p2")
    public List<BlogArticle> listBlogArticlesByType(int pageSize, byte type, String ordeString) {
        BlogArticleSearchParam blogArticleSearchParam = getArticleSearchParam();
        blogArticleSearchParam.setArticleType(type);
        PageHelper.startPage(1, pageSize, ordeString);
        return blogService.listBlogArticles(blogArticleSearchParam);
    }

    @Cacheable(key = "targetClass + methodName +#p0")
    public BlogArticle getBlogArticleByArticleUrl(String articleUrl) {
        return blogService.getBlogArticleByArticleUrl(articleUrl);
    }

    // 以上文章

    // 只涉及文章表和统计表
    @Cacheable(key = "targetClass + methodName +#p0")
    public List<BlogArticleCountSort> listBlogArticleCount(int pageSize) {
        PageHelper.startPage(1, pageSize, "create_time desc");
        return blogSortService.listArticlesCountSort(null);
    }

    // 只涉及文章表和统计表
    @Cacheable(key = "targetClass + methodName +#p0")
    public List<BlogArticleCountSort> listBlogArticleCountOrderByLook(int pageSize) {
        PageHelper.startPage(1, pageSize, "article_look desc");
        return blogSortService.listArticlesCountSort(null);
    }

    // 只涉及文章表和统计表
    @Cacheable(key = "targetClass + methodName +#p0")
    public List<BlogArticleCountSort> listBlogArticleCountOrderByLile(int pageSize) {
        PageHelper.startPage(1, pageSize, "article_like desc");
        return blogSortService.listArticlesCountSort(null);
    }

     // 只涉及文章表和统计表
     @Cacheable(key = "targetClass + methodName +#p0")
     public List<BlogArticleCountSort> listBlogArticleCountOrderByScore(int pageSize) {
        PageHelper.startPage(1, pageSize, "article_score desc");
        return blogSortService.listArticlesCountSort(null);
    }

    // 只涉及文章表和统计表
    @Cacheable(key = "targetClass + methodName +#p0")
    public List<BlogArticleCountSort> listBlogArticleCountOrderByCollect(int pageSize) {
        PageHelper.startPage(1, pageSize, "article_collect desc");
        return blogSortService.listArticlesCountSort(null);
    }

    // 只涉及文章表和统计表
    @Cacheable(key = "targetClass + methodName +#p0")
    public List<BlogArticleCountSort> listBlogArticleCountOrderByShare(int pageSize) {
        PageHelper.startPage(1, pageSize, "article_share desc");
        return blogSortService.listArticlesCountSort(null);
    }

    // 只涉及文章表和统计表
    @Cacheable(key = "targetClass + methodName +#p0 +#p1")
    public List<BlogArticleCountSort> listBlogArticleCountByTop(int pageSize, byte articleTop) {
        PageHelper.startPage(1, pageSize, "create_time desc");
        BlogArticleSort bl = new BlogArticleSort();
        bl.setArticleTop(articleTop);
        return blogSortService.listArticlesCountSort(bl);
    }

    // 只涉及文章表和统计表
    @Cacheable(key = "targetClass + methodName +#p0 +#p1")
    public List<BlogArticleCountSort> listBlogArticleCountByType(int pageSize, byte articleType) {
        PageHelper.startPage(1, pageSize, "create_time desc");
        BlogArticleSort bl = new BlogArticleSort();
        bl.setArticleType(articleType);
        return blogSortService.listArticlesCountSort(bl);

    }

    // 只涉及文章表
    @Cacheable(key = "targetClass + methodName +#p0")
    public List<BlogArticleSort> listBlogArticleSort(int pageSize) {
        PageHelper.startPage(1, pageSize, "create_time desc");
        return blogSortService.listArticleSort(null);
    }

    // 只涉及文章表
    @Cacheable(key = "targetClass + methodName +#p0 +#p1")
    public List<BlogArticleSort> listBlogArticleSortByTop(int pageSize, byte articleTop) {
        PageHelper.startPage(1, pageSize, "create_time desc");
        BlogArticleSort bl = new BlogArticleSort();
        bl.setArticleTop(articleTop);
        return blogSortService.listArticleSort(bl);
    }

    // 只涉及文章表
    @Cacheable(key = "targetClass + methodName +#p0 +#p1")
    public List<BlogArticleSort> listBlogArticleSortByType(int pageSize, byte articleType) {
        PageHelper.startPage(1, pageSize, "create_time desc");
        BlogArticleSort bl = new BlogArticleSort();
        bl.setArticleType(articleType);
        return blogSortService.listArticleSort(bl);
    }

    private BlogArticleSearchParam getArticleSearchParam() {

        BlogArticleSearchParam blogArticleSearchParam = new BlogArticleSearchParam();
        return blogArticleSearchParam;
    }

}
