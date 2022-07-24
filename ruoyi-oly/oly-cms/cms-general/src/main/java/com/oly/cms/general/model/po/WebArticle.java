package com.oly.cms.general.model.po;

import java.util.List;

import com.oly.cms.common.domain.entity.CmsArticle;
import com.oly.cms.common.domain.entity.CmsArticleCount;
import com.oly.cms.common.domain.entity.CmsCat;
import com.oly.cms.common.domain.entity.CmsTag;

/** 所有文章字段 */
public class WebArticle extends CmsArticle {

    private static final long serialVersionUID = 653673311404721257L;

    private List<CmsCat> cmsCats;

    private List<CmsTag> cmsTags;

    private CmsArticleCount cmsArticleCount;

    public CmsArticleCount getCmsArticleCount() {
        return cmsArticleCount;
    }

    public void setCmsArticleCount(CmsArticleCount cmsArticleCount) {
        this.cmsArticleCount = cmsArticleCount;
    }

    public List<CmsCat> getCmsCats() {
        return cmsCats;
    }

    public void setCmsCats(List<CmsCat> cmsCats) {
        this.cmsCats = cmsCats;
    }

    public List<CmsTag> getCmsTags() {
        return cmsTags;
    }

    public void setCmsTags(List<CmsTag> cmsTags) {
        this.cmsTags = cmsTags;
    }

}
