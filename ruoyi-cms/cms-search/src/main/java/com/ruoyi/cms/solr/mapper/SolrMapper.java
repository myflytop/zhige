package com.ruoyi.cms.solr.mapper;

import com.ruoyi.cms.solr.model.SearchModel;

import java.util.List;

public interface SolrMapper {
   SearchModel getSearchModel(Long articleId);
   List<SearchModel> listSearchModel();
}
