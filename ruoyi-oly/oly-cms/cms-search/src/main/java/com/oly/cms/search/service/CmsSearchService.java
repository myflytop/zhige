package com.oly.cms.search.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oly.cms.general.model.param.WebArticleSearchParam;
import com.oly.cms.general.model.vo.WebArticleVo;
import com.oly.cms.general.service.search.GeneralArticleVoServiceImpl;

@Service
public class CmsSearchService {

    @Autowired
    private GeneralArticleVoServiceImpl articleService;

    public List<WebArticleVo> listArticleVo(WebArticleSearchParam bb) {

        return articleService.listArticleVo(bb);
    }

}
