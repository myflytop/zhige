package com.oly.cms.general.controller.api;

import java.util.ArrayList;
import java.util.List;

import com.oly.cms.common.model.support.PageData;
import com.oly.cms.general.model.vo.WebArticleCountVo;
import com.oly.cms.general.service.cache.GeneralWebArticleCountVoCacheService;
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
    private GeneralWebArticleCountVoCacheService articleCountService;

    @GetMapping({ "/list", "/list/{themeName}" })
    public AjaxResult list(@PathVariable(value = "themeName", required = false) String themeName) {
        List<WebArticleCountVo> list = new ArrayList<>();
        startPage();
        list = articleCountService.listWebArticleCountVo(themeName);
        PageData pageOne = PageData.getData(list);
        return AjaxResult.success(pageOne);
    }

    @GetMapping({ "/list/look/{pageNum}/{pageSize}/{themeName}", "/list/look/{pageNum}/{pageSize}" })
    public List<WebArticleCountVo> listWebArticleCountVoOrderByLook(
            @PathVariable(value = "themeName", required = false) String themeName,
            @PathVariable("pageSize") int pageSize, @PathVariable("pageNum") int pageNmu) {
        return articleCountService.listWebArticleCountVoOrderByLook(pageNmu, pageSize, themeName);
    }

    @GetMapping({ "/list/like/{pageNum}/{pageSize}/{themeName}", "/list/like/{pageNum}/{pageSize}" })
    public List<WebArticleCountVo> listWebArticleCountVoOrderByLike(
            @PathVariable(value = "themeName", required = false) String themeName,
            @PathVariable("pageSize") int pageSize, @PathVariable("pageNum") int pageNmu) {

        return articleCountService.listWebArticleCountVoOrderByLike(pageNmu, pageSize, themeName);
    }

    @GetMapping({ "/list/score/{pageNum}/{pageSize}/{themeName}", "/list/score/{pageNum}/{pageSize}" })
    public List<WebArticleCountVo> listWebArticleCountVoOrderByScore(
            @PathVariable(value = "themeName", required = false) String themeName,
            @PathVariable("pageSize") int pageSize, @PathVariable("pageNum") int pageNmu) {
        return articleCountService.listWebArticleCountVoOrderByScore(pageNmu, pageSize, themeName);
    }

    @GetMapping({ "/list/collect/{pageNum}/{pageSize}/{themeName}", "/list/collect/{pageNum}/{pageSize}" })
    public List<WebArticleCountVo> listWebArticleCountVoOrderByCollect(
            @PathVariable(value = "themeName", required = false) String themeName,
            @PathVariable("pageSize") int pageSize, @PathVariable("pageNum") int pageNmu) {

        return articleCountService.listWebArticleCountVoOrderByCollect(pageNmu, pageSize, themeName);
    }

    @GetMapping({ "/list/share/{pageNum}/{pageSize}/{themeName}", "/list/share/{pageNum}/{pageSize}" })
    public List<WebArticleCountVo> listWebArticleCountVoOrderByShare(
            @PathVariable(value = "themeName", required = false) String themeName,
            @PathVariable("pageSize") int pageSize, @PathVariable("pageNum") int pageNmu) {

        return articleCountService.listWebArticleCountVoOrderByShare(pageNmu, pageSize, themeName);
    }

}
