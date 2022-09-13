package com.oly.cms.search.controller.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.oly.cms.general.model.param.WebArticleSearchParam;
import com.oly.cms.general.model.vo.WebArticleVo;
import com.oly.cms.search.service.CmsSearchService;
import com.ruoyi.common.core.domain.R;

@RestController("/api/search")
public class SearchApiController {

    @Autowired
    private CmsSearchService cmsSearchService;

    @GetMapping("/article")
    public R<List<WebArticleVo>> selectArticle(WebArticleSearchParam bb) {
        return R.ok(cmsSearchService.listArticleVo(bb));
    }

}
