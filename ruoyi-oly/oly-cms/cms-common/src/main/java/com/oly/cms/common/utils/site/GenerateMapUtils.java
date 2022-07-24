package com.oly.cms.common.utils.site;

import java.io.File;
import java.net.MalformedURLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import com.redfin.sitemapgenerator.ChangeFreq;
import com.redfin.sitemapgenerator.SitemapIndexGenerator;
import com.redfin.sitemapgenerator.W3CDateFormat;
import com.redfin.sitemapgenerator.WebSitemapGenerator;
import com.redfin.sitemapgenerator.WebSitemapUrl;
import com.ruoyi.common.exception.ServiceException;
import org.springframework.util.Assert;

/**
 * GenerateBaiDuMap
 */
public class GenerateMapUtils {
    /**
     *
     * @param tempPath
     * @param domain
     * @param maps
     * @param themeName
     */
    public static void generateBaiDuMap(String tempPath, String domain, Map<String, List<String>> maps,
            String themeName) {
        Assert.hasLength(tempPath, "基础路径不能为空");
        Assert.hasLength(domain, "域名不能为空");
        Assert.notEmpty(maps, "数据不能为空");
        Assert.hasLength(themeName, "主题名不能为空");
        File file = new File(tempPath + File.separator + themeName);
        if (!file.exists()) {
            file.mkdirs();
        }
        try {
            WebSitemapGenerator g1 = WebSitemapGenerator.builder(domain, file).fileNamePrefix(themeName).build();
            Date date = new Date();
            Iterator<Entry<String, List<String>>> entries = maps.entrySet().iterator();
            while (entries.hasNext()) {
                Entry<String, List<String>> entry = entries.next();
                String prefixUrl = entry.getKey();
                List<String> ids = entry.getValue();
                for (int i = 0; i < ids.size(); i++) {
                    WebSitemapUrl url = new WebSitemapUrl.Options(domain + prefixUrl + ids.get(i)).lastMod(date)
                            .priority(0.9).changeFreq(ChangeFreq.ALWAYS).build();
                    g1.addUrl(url);
                }
            }
            List<String> fileNames = new ArrayList<>();
            // 生成 sitemap 文件
            List<File> articleFiles = g1.write();

            articleFiles.forEach(e -> fileNames.add(e.getName()));
            // 构造 sitemap_index 生成器
            W3CDateFormat dateFormat = new W3CDateFormat(W3CDateFormat.Pattern.DAY);
            SitemapIndexGenerator sitemapIndexGenerator = new SitemapIndexGenerator.Options(domain,
                    new File(tempPath + "/" + themeName + "SiteMapIndex.xml")).dateFormat(dateFormat).autoValidate(true)
                            .build();
            fileNames.forEach(e -> {
                // 组装 sitemap 文件 URL 地址
                try {
                    sitemapIndexGenerator.addUrl(domain + "/site/" + themeName + "/" + e);
                } catch (MalformedURLException e1) {
                    throw new ServiceException(e1.getMessage());
                }

            });
            // 生成 sitemap_index 文件
            sitemapIndexGenerator.write();

        } catch (MalformedURLException e) {
            throw new ServiceException(e.getMessage());
        }
    }

}