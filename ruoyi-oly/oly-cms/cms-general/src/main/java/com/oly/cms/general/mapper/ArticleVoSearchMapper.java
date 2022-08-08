package com.oly.cms.general.mapper;

import java.util.List;

import com.oly.cms.general.model.param.WebArticleSearchParam;
import com.oly.cms.general.model.vo.WebArticleVo;

/**
 * 文章列表排序 失效性 发布时间 阅读量 点赞量 讨论量 推荐级别
 *
 */
public interface ArticleVoSearchMapper {

    List<WebArticleVo> listWebArticleVo(WebArticleSearchParam bb);
}
