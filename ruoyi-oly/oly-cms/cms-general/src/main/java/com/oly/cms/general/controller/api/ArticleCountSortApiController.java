package com.oly.cms.general.controller.api;

import java.util.ArrayList;
import java.util.List;

import com.oly.cms.common.model.support.PageData;
import com.oly.cms.common.domain.entity.CmsArticleCount;
import com.oly.cms.general.service.cache.GeneralArticleSortCacheService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@CrossOrigin
@RestController
@RequestMapping("/api/articleCount")
public class ArticleCountSortApiController extends BaseController {

    @Autowired
    private GeneralArticleSortCacheService articleCountService;

    @GetMapping({ "/list", "/list/{themeName}" })
    public AjaxResult list(@PathVariable(value = "themeName", required = false) String themeName) {
        List<CmsArticleCount> list = new ArrayList<>();
        startDefaultPage();
        list = articleCountService.listCmsArticleCount(themeName);
        PageData pageOne = PageData.getData(list);
        return AjaxResult.success(pageOne);
    }

    @GetMapping({ "/list/look/{pageNum}/{pageSize}/{themeName}", "/list/look/{pageNum}/{pageSize}" })
    public List<CmsArticleCount> listCmsArticleCountOrderByLook(
            @PathVariable(value = "themeName", required = false) String themeName,
            @PathVariable("pageSize") int pageSize, @PathVariable("pageNum") int pageNmu) {
        return articleCountService.listCmsArticleCountOrderByLook(pageNmu, pageSize, themeName);
    }

    @GetMapping({ "/list/like/{pageNum}/{pageSize}/{themeName}", "/list/like/{pageNum}/{pageSize}" })
    public List<CmsArticleCount> listCmsArticleCountOrderByLike(
            @PathVariable(value = "themeName", required = false) String themeName,
            @PathVariable("pageSize") int pageSize, @PathVariable("pageNum") int pageNmu) {

        return articleCountService.listCmsArticleCountOrderByLike(pageNmu, pageSize, themeName);
    }

    @GetMapping({ "/list/score/{pageNum}/{pageSize}/{themeName}", "/list/score/{pageNum}/{pageSize}" })
    public List<CmsArticleCount> listCmsArticleCountOrderByScore(
            @PathVariable(value = "themeName", required = false) String themeName,
            @PathVariable("pageSize") int pageSize, @PathVariable("pageNum") int pageNmu) {
        return articleCountService.listCmsArticleCountOrderByScore(pageNmu, pageSize, themeName);
    }

    @GetMapping({ "/list/collect/{pageNum}/{pageSize}/{themeName}", "/list/collect/{pageNum}/{pageSize}" })
    public List<CmsArticleCount> listCmsArticleCountOrderByCollect(
            @PathVariable(value = "themeName", required = false) String themeName,
            @PathVariable("pageSize") int pageSize, @PathVariable("pageNum") int pageNmu) {

        return articleCountService.listCmsArticleCountOrderByCollect(pageNmu, pageSize, themeName);
    }

    @GetMapping({ "/list/share/{pageNum}/{pageSize}/{themeName}", "/list/share/{pageNum}/{pageSize}" })
    public List<CmsArticleCount> listCmsArticleCountOrderByShare(
            @PathVariable(value = "themeName", required = false) String themeName,
            @PathVariable("pageSize") int pageSize, @PathVariable("pageNum") int pageNmu) {

        return articleCountService.listCmsArticleCountOrderByShare(pageNmu, pageSize, themeName);
    }

}
