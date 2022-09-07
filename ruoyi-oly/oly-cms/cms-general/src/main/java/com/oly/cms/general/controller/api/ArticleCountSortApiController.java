package com.oly.cms.general.controller.api;

import java.util.List;
import com.oly.cms.common.model.support.PageData;
import com.oly.cms.general.model.param.WebArticleSearchParam;
import com.oly.cms.general.model.vo.WebArticleVo;
import com.oly.cms.general.service.cache.GeneralArticleVoCacheService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.StringUtils;

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
    private GeneralArticleVoCacheService articleCountService;

    @GetMapping({ "/list", "/{themeName}/list" })
    public AjaxResult list(@PathVariable(value = "themeName", required = false) String themeName,
            WebArticleSearchParam bb) {
        if (StringUtils.isNotEmpty(themeName)) {
            bb.setThemeName(themeName);
        }
        startPage();
        List<WebArticleVo> list = articleCountService.listArticleVo(bb);
        PageData pageOne = PageData.getData(list);
        return AjaxResult.success(pageOne);
    }

    @GetMapping("/getPreAndNextArticle/{themeName}/{articleId}")
    public AjaxResult selectPreAndNextArticle(@PathVariable(value = "themeName") String themeName,
            @PathVariable("articleId") long articleId) {
        return AjaxResult.success(articleCountService.selectPreAndNextArticle(articleId, themeName));
    }

}
