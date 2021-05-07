package com.oly.web.service.cache;

import java.util.List;

import com.github.pagehelper.PageHelper;
import com.oly.common.constant.CacheConstant;
import com.oly.web.model.pam.BlogArticleSearchParam;
import com.oly.web.model.po.BlogArticle;
import com.oly.web.model.po.BlogArticleCountSort;
import com.oly.web.model.po.BlogArticleSort;
import com.oly.web.model.po.BlogCat;
import com.oly.web.model.po.BlogLink;
import com.oly.web.model.po.BlogMenu;
import com.oly.web.model.po.BlogTag;
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

    @Cacheable(key="'"+CacheConstant.MENU_CACHE_KEY_PREFIX+"listMenuId_'+#p0")
    public List<BlogMenu> listBlogMenus(long menuId) {
        BlogMenu blogMenu = new BlogMenu();
        blogMenu.setColumnId(menuId);
        return blogService.listBlogMenus(blogMenu);
    }

    @Cacheable(key="'"+CacheConstant.MENU_CACHE_KEY_PREFIX+"getMenuId_'+#p0")
    public BlogMenu getBlogMenuById(Long menuId) {
        return blogService.getBlogMenuById(menuId);
    }

    @Cacheable(key="'"+CacheConstant.MENU_CACHE_KEY_PREFIX+"treeMenuId_'+#p0")
    public BlogMenu listBlogMenuTreeByColumnId(Long columnId) {
        return blogService.listBlogMenuTreeByColumnId(columnId);
    }
    // 以上菜单

    @Cacheable(key="'"+CacheConstant.LINKS_CACHE_KEY_PREFIX+"listLinkId_'+#p0")
    public List<BlogLink> listBlogLinks(String groupKey) {
        BlogLink blogLink = new BlogLink();
        blogLink.setGroupKey(groupKey);
        return blogService.listBlogLinks(blogLink);
    }

    @Cacheable(key="'"+CacheConstant.LINKS_CACHE_KEY_PREFIX+"getLinkId_'+#p0")
    public BlogLink getBlogLinkById(Long linkId) {
        return blogService.getBlogLinkById(linkId);
    }
    // 以上外链

    @Cacheable(key="'"+CacheConstant.TAGS_CACHE_KEY_PREFIX+"listTagId_'+#p0+'_'+#p1")
    public List<BlogTag> listBlogTags(int pageSize, String ordeString) {
        PageHelper.startPage(1, pageSize, ordeString);
        return blogService.listBlogTags(null);
    }
    @Cacheable(key="'"+CacheConstant.TAGS_CACHE_KEY_PREFIX+"listTagType_'+#p0+'_'+#p1+'_'+#p2")
    public List<BlogTag> listBlogTagByType(Byte type, int size, String string) {
        BlogTag tag=new BlogTag();
        tag.setTagType(type);
        PageHelper.startPage(1, size, string);
        return blogService.listBlogTags(tag);
	}

    @Cacheable(key="'"+CacheConstant.TAGS_CACHE_KEY_PREFIX+"getTagId_'+#p0")
    public BlogTag getBlogTagByTagId(long tagId) {
        return blogService.getBlogTagByTagId(tagId);
    }
    
    @Cacheable(key="'"+CacheConstant.TAGS_CACHE_KEY_PREFIX+"listArticleByTagId_'+#p0+'_'+#p1")
    public List<BlogArticle> listBlogArticlesByTagId(long tagId, int pageSize) {
        BlogArticleSearchParam blogArticleSearchParam = getArticleSearchParam();
        blogArticleSearchParam.setTagId(tagId);
        PageHelper.startPage(1, pageSize, "create_time desc");
        return blogService.listBlogArticles(blogArticleSearchParam);
    }

    @Cacheable(key="'"+CacheConstant.TAGS_CACHE_KEY_PREFIX+"getTagUrl_'+#p0")
    public BlogTag getBlogTagByTagUrl(String tagUrl) {
        return blogService.getBlogTagByTagUrl(tagUrl);
    }
    // 以上标签

    @Cacheable(key="'"+CacheConstant.CATS_CACHE_KEY_PREFIX+"listArticleByCatId_'+#p0+'_'+#p1")
    public List<BlogArticle> listBlogArticlesByCatId(long catId, int pageSize) {
        BlogArticleSearchParam blogArticleSearchParam = getArticleSearchParam();
        blogArticleSearchParam.setCatId(catId);
        PageHelper.startPage(1, pageSize, "create_time desc");
        return blogService.listBlogArticles(blogArticleSearchParam);
    }

    @Cacheable(key="'"+CacheConstant.CATS_CACHE_KEY_PREFIX+"listArticleByCatUrl_'+#p0")
    public BlogCat getBlogCatByCatUrl(String catUrl) {
        return blogService.getBlogCatByCatUrl(catUrl);
    }

    @Cacheable(key="'"+CacheConstant.CATS_CACHE_KEY_PREFIX+"listArticleByCatId_'+#p0")
    public BlogCat getBlogCatByCatId(Long catId) {
        return blogService.getBlogCatByCatId(catId);
    }

    @Cacheable(key="'"+CacheConstant.CATS_CACHE_KEY_PREFIX+"listCatVisible_'+#p0")
    public List<BlogCat> listBlogCats(Byte b) {
        BlogCat blogCat = new BlogCat();
        blogCat.setVisible(b);
        return blogService.listBlogCats(blogCat);
    }

    @Cacheable(key="'"+CacheConstant.CATS_CACHE_KEY_PREFIX+"listCatVisible_'+#p0+'-'+#p1")
    public List<BlogCat> listBlogCats(Byte b,long catId) {
        BlogCat blogCat = new BlogCat();
        blogCat.setVisible(b);
        blogCat.setCatId(catId);
        return blogService.listBlogCats(blogCat);
    }
    // 以上分类

    @Cacheable(key="'"+CacheConstant.POSTS_CACHE_KEY_PREFIX+"listArticle_'+#p0+'_'+#p1")
    public List<BlogArticle> listBlogArticles(int pageSize, String ordeString) {
        PageHelper.startPage(1, pageSize, ordeString);
        return blogService.listBlogArticles(null);
    }

    @Cacheable(key="'"+CacheConstant.POST_CACHE_KEY_PREFIX+"getArticleId_'+#p0")
    public BlogArticle getBlogArticleByArticleId(long articleId) {
        return blogService.getBlogArticleByArticleId(articleId);
    }

    @Cacheable(key="'"+CacheConstant.POSTS_CACHE_KEY_PREFIX+"listArticleType_'+#p0+'_'+#p1+'_'+#p2")
    public List<BlogArticle> listBlogArticlesByType(byte type,int pageSize, String ordeString) {
        BlogArticleSearchParam blogArticleSearchParam = getArticleSearchParam();
        blogArticleSearchParam.setArticleType(type);
        PageHelper.startPage(1, pageSize, ordeString);
        return blogService.listBlogArticles(blogArticleSearchParam);
    }

    @Cacheable(key="'"+CacheConstant.POST_CACHE_KEY_PREFIX+"getArticleUrl_'+#p0")
    public BlogArticle getBlogArticleByArticleUrl(String articleUrl) {
        return blogService.getBlogArticleByArticleUrl(articleUrl);
    }

    // 以上文章

    // 只涉及文章表和统计表
    @Cacheable(key="'"+CacheConstant.POSTS_CACHE_KEY_PREFIX+"listArticleCountSortCount_'+#p0")
    public List<BlogArticleCountSort> listBlogArticleCount(int pageSize) {
        PageHelper.startPage(1, pageSize, "create_time desc");
        return blogSortService.listArticlesCountSort(null);
    }

    // 只涉及文章表和统计表
    @Cacheable(key="'"+CacheConstant.POSTS_CACHE_KEY_PREFIX+"listArticleCountSortLook_'+#p0")
    public List<BlogArticleCountSort> listBlogArticleCountOrderByLook(int pageSize) {
        PageHelper.startPage(1, pageSize, "article_look desc");
        return blogSortService.listArticlesCountSort(null);
    }

    // 只涉及文章表和统计表
    @Cacheable(key="'"+CacheConstant.POSTS_CACHE_KEY_PREFIX+"listArticleCountSortLike_'+#p0")
    public List<BlogArticleCountSort> listBlogArticleCountOrderByLike(int pageSize) {
        PageHelper.startPage(1, pageSize, "article_like desc");
        return blogSortService.listArticlesCountSort(null);
    }

     // 只涉及文章表和统计表
     @Cacheable(key="'"+CacheConstant.POSTS_CACHE_KEY_PREFIX+"listArticleCountSortScore_'+#p0")
     public List<BlogArticleCountSort> listBlogArticleCountOrderByScore(int pageSize) {
        PageHelper.startPage(1, pageSize, "article_score desc");
        return blogSortService.listArticlesCountSort(null);
    }

    // 只涉及文章表和统计表
    @Cacheable(key="'"+CacheConstant.POSTS_CACHE_KEY_PREFIX+"listArticleCountSortCollect_'+#p0")
    public List<BlogArticleCountSort> listBlogArticleCountOrderByCollect(int pageSize) {
        PageHelper.startPage(1, pageSize, "article_collect desc");
        return blogSortService.listArticlesCountSort(null);
    }

    // 只涉及文章表和统计表
    @Cacheable(key="'"+CacheConstant.POSTS_CACHE_KEY_PREFIX+"listArticleCountSortShare_'+#p0")
    public List<BlogArticleCountSort> listBlogArticleCountOrderByShare(int pageSize) {
        PageHelper.startPage(1, pageSize, "article_share desc");
        return blogSortService.listArticlesCountSort(null);
    }

    // 只涉及文章表和统计表
    @Cacheable(key="'"+CacheConstant.POSTS_CACHE_KEY_PREFIX+"listArticleCountSortTop_'+#p0+'_'+#p1")
    public List<BlogArticleCountSort> listBlogArticleCountByTop(int pageSize, byte articleTop) {
        PageHelper.startPage(1, pageSize, "create_time desc");
        BlogArticleSort bl = new BlogArticleSort();
        bl.setArticleTop(articleTop);
        return blogSortService.listArticlesCountSort(bl);
    }

    // 只涉及文章表和统计表
    @Cacheable(key="'"+CacheConstant.POSTS_CACHE_KEY_PREFIX+"listArticleCountSortType_'+#p0+'_'+#p1")
    public List<BlogArticleCountSort> listBlogArticleCountByType(int pageSize, byte articleType) {
        PageHelper.startPage(1, pageSize, "create_time desc");
        BlogArticleSort bl = new BlogArticleSort();
        bl.setArticleType(articleType);
        return blogSortService.listArticlesCountSort(bl);

    }

    // 只涉及文章表
    @Cacheable(key="'"+CacheConstant.POSTS_CACHE_KEY_PREFIX+"listArticleBaseByTime_'+#p0")
    public List<BlogArticleSort> listBlogArticleSort(int pageSize) {
        PageHelper.startPage(1, pageSize, "create_time desc");
        return blogSortService.listArticleSort(null);
    }

    // 只涉及文章表
    @Cacheable(key="'"+CacheConstant.POSTS_CACHE_KEY_PREFIX+"listArticleBaseByTop_'+#p0+'_'+#p1")
    public List<BlogArticleSort> listBlogArticleSortByTop(int pageSize, byte articleTop) {
        PageHelper.startPage(1, pageSize, "create_time desc");
        BlogArticleSort bl = new BlogArticleSort();
        bl.setArticleTop(articleTop);
        return blogSortService.listArticleSort(bl);
    }

    // 只涉及文章表
    @Cacheable(key="'"+CacheConstant.POSTS_CACHE_KEY_PREFIX+"listArticleBaseByType_'+#p0+'_'+#p1")
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
