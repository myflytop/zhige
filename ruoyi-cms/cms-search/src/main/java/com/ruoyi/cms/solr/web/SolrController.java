package com.ruoyi.cms.solr.web;

import com.ruoyi.cms.solr.service.SolrService;
import org.apache.solr.client.solrj.SolrClient;
import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.common.SolrDocumentList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.reactive.function.client.WebClient;
import reactor.core.publisher.Mono;
import java.util.List;
import java.util.Map;
@RestController
@RequestMapping("/cms/solr")
public class SolrController {

    @Autowired
    private SolrClient client;

    @Autowired
    private SolrService solrService;

    @Value("${spring.data.solr.host}")
    private String solrHost;

    @RequestMapping("/add/{articleId}")
    public String add(@PathVariable("articleId") Long articleId) {
        solrService.addIndex(articleId);
        return "Ok";
    }

    @RequestMapping("/rebuild")
    public String rebuild() {
      solrService.rebuildIndex();
        return "Ok";
    }

    @RequestMapping("/dataImport")
    public String rebuild(String param){
        String dbImport="/dataimport?command=full-import&clean=false&commit=true&entity=article";
        // 2、创建索引
        Mono<String> result = WebClient.create(solrHost)
                .get()
                .uri(dbImport)
                .retrieve()
                .bodyToMono(String.class);
        System.out.println(result.block());
   return "Ok";
    }

    @RequestMapping("/delete/{articleId}")
    public String delete(@PathVariable("articleId") String articleId) {
        solrService.removeIndex(articleId);
        return "Ok";
    }

    @RequestMapping("/search")
    public SolrDocumentList search(String q, @RequestParam(required = false,defaultValue = "1") Integer pageNum,@RequestParam(required = false,defaultValue = "20") Integer pageSize){

        try {
            SolrQuery params = new SolrQuery();

            //查询条件, 这里的 q 对应 下面图片标红的地方
            params.set("q", q);
            
            //排序
            params.addSort("create_time", SolrQuery.ORDER.desc);

            //分页
            params.setStart((pageNum-1)*pageSize);
            params.setRows(pageSize);

            //默认域 默认查询标题
            params.set("df", "article_title");

            //只查询指定域
            params.set("fl", "article_id, article_title, create_time,article_url,article_img, article_summary,article_content");

            params.setHighlightFragsize(150);
            //高亮
            //打开开关
            params.setHighlight(true);
            //指定高亮域
            params.addHighlightField("article_title");
            //设置前缀
            params.setHighlightSimplePre("<span style='color:red'>");
            //设置后缀
            params.setHighlightSimplePost("</span>");

            QueryResponse queryResponse = client.query(params);

            SolrDocumentList results = queryResponse.getResults();

            long numFound = results.getNumFound();

            System.out.println(numFound);
            //返回带高亮的字段
            Map<String, Map<String, List<String>>> highlight = queryResponse.getHighlighting();


            return queryResponse.getResults();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

}