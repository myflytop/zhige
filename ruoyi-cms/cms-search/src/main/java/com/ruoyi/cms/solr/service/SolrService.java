package com.ruoyi.cms.solr.service;

import com.ruoyi.cms.solr.mapper.SolrMapper;
import com.ruoyi.cms.solr.model.SearchModel;
import org.apache.solr.client.solrj.SolrClient;
import org.apache.solr.client.solrj.SolrServerException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.List;

@Service
public class SolrService {
    @Autowired
    private SolrClient client;
    @Autowired
    private SolrMapper solrMapper;

    public void addIndex(Long articleId){
        SearchModel searchModel=solrMapper.getSearchModel(articleId);
        try {
            client.addBean(searchModel);
            client.commit();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (SolrServerException e) {
            e.printStackTrace();
        }
    }

    public void rebuildIndex(){
        List<SearchModel> searchModels=solrMapper.listSearchModel();
        try {
            client.addBeans(searchModels);
            client.commit();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (SolrServerException e) {
            e.printStackTrace();
        }
    }

    public void removeIndex(String articleId){
        try {
            client.deleteById(articleId);
            client.commit();
        } catch (SolrServerException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


}
