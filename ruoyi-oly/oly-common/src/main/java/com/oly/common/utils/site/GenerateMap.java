package com.oly.common.utils.site;

import java.io.File;
import java.net.MalformedURLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.redfin.sitemapgenerator.ChangeFreq;
import com.redfin.sitemapgenerator.WebSitemapGenerator;
import com.redfin.sitemapgenerator.WebSitemapUrl;

import org.springframework.util.Assert;

/**
 * GenerateBaiDuMap
 */
public class GenerateMap {
    
   public static void generateBaiDuMap(String tempPath,String domain,List<String> ids,String prefixUrl,String fileName ){
    Assert.hasLength(tempPath, "基础路径不能为空");
    Assert.hasLength(domain, "域名不能为空");
    Assert.notEmpty(ids, "数据不能为空");
    Assert.hasLength(prefixUrl, "前缀不能为空");
    Assert.hasLength(fileName, "文件名不能为空");
    File file = new File(tempPath);
    if(!file.exists()){
        file.mkdirs();
    }
    try {
        WebSitemapGenerator g1 = WebSitemapGenerator.builder(domain, file).fileNamePrefix(fileName).build();
        Date date = new Date();
        for (int i = 1; i < ids.size(); i++) {
            WebSitemapUrl url = new WebSitemapUrl.Options(domain + prefixUrl + ids.get(i)).lastMod(date).priority(0.9).changeFreq(ChangeFreq.ALWAYS).build();         
            g1.addUrl(url);
        }
        List<String> fileNames = new ArrayList<>();
        // 生成 sitemap 文件
        List<File> articleFiles = g1.write();
        
        articleFiles.forEach(e -> fileNames.add(e.getName()));
    }catch(
    MalformedURLException e)
    {
        e.printStackTrace();
    }
}

}