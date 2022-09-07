package com.oly.cms.general.service.search;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.github.pagehelper.PageHelper;
import com.oly.cms.common.model.properties.OlyWebConfigProperties;
import com.oly.cms.general.mapper.ArticleVoSearchMapper;
import com.oly.cms.general.model.PageArticleVoTimeLine;
import com.oly.cms.general.model.param.WebArticleSearchParam;
import com.oly.cms.general.model.vo.WebArticleVo;
import com.oly.cms.general.service.IGeneralSearchService;
import com.ruoyi.system.config.service.ISysConfigService;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.StringUtils;

/**
 * 文章排序相关
 */
@Service
public class GeneralArticleVoServiceImpl implements IGeneralSearchService {

    @Autowired
    private ArticleVoSearchMapper webArticleSortMapper;
    @Autowired
    private ISysConfigService configService;

    public List<WebArticleVo> listArticleVo(WebArticleSearchParam bb) {

        return webArticleSortMapper.listWebArticleVo(bb);
    }

    public List<WebArticleVo> listArticleVoOrder(int num, int size, WebArticleSearchParam bb,
            String order) {
        PageHelper.startPage(num, size, order);
        return webArticleSortMapper.listWebArticleVo(bb);
    }

    public List<WebArticleVo> listArticleVoOrder(int num, int size, Integer articleType, Long catId, Long tagId,
            String themeName,
            String order) {
        WebArticleSearchParam bb = new WebArticleSearchParam();
        if (!isSupportType(themeName)) {
            bb.setThemeName(themeName);
        }
        bb.setArticleType(articleType);
        bb.setCatId(catId);
        bb.setTagId(tagId);
        return this.listArticleVoOrder(num, size, bb, order);
    }

    public WebArticleVo selectPreArticle(long articleId, String themeName) {
        if (isSupportType(themeName)) {
            themeName = null;
        }
        return webArticleSortMapper.selectPreArticle(articleId, themeName);
    }

    public WebArticleVo selectNextArticle(long articleId, String themeName) {
        if (isSupportType(themeName)) {
            themeName = null;
        }
        return webArticleSortMapper.selectNextArticle(articleId, themeName);
    }

    public PageArticleVoTimeLine groupByTime(int pageNum, int pageSize, WebArticleSearchParam bb) {
        PageHelper.startPage(pageNum, pageSize, "create_time desc");
        List<WebArticleVo> list = this.listArticleVo(bb);
        // 按照时间分组
        Map<String, List<WebArticleVo>> map = list.stream()
                .collect(Collectors.groupingBy(webArticleVo -> DateUtils.neData(webArticleVo.getCreateTime())));
        return PageArticleVoTimeLine.getData(list, map);
    }

    public PageArticleVoTimeLine groupByTime(int pageNum, int pageSize, String themeName, String crTime) {
        WebArticleSearchParam bb = new WebArticleSearchParam();
        bb.setCrTime(crTime);
        if (!isSupportType(themeName)) {
            bb.setThemeName(themeName);
        }
        return this.groupByTime(pageNum, pageSize, bb);
    }

    /**
     * 自此类型是否为空
     * 主题名为空默认支持所有类型
     * 
     * @param themeName
     * @return
     */
    private boolean isSupportType(String themeName) {
        if (StringUtils.isEmpty(themeName)) {
            return true;
        } else {
            return StringUtils
                    .isEmpty(configService.selectConfigDefauleValue(themeName, OlyWebConfigProperties.ARTICLE_TYPES));
        }
    }

}
