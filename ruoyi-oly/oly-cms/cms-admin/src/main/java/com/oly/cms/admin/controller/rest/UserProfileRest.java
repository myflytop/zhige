package com.oly.cms.admin.controller.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.oly.cms.admin.model.vo.ArticleVo;
import com.oly.cms.admin.service.ICmsArticleService;
import com.oly.cms.admin.service.ICmsContactService;
import com.oly.cms.admin.web.CmsCommonController;
import com.oly.cms.comment.model.CmsComment;
import com.oly.cms.comment.servie.ICmsCommentService;
import com.oly.cms.common.domain.entity.CmsArticle;
import com.oly.cms.common.domain.entity.CmsContact;
import com.oly.cms.general.model.record.CmsLookRecord;
import com.oly.cms.hand.model.record.CmsCollectRecord;
import com.oly.cms.hand.model.record.CmsLikeRecord;
import com.oly.cms.hand.model.record.CmsNastyRecord;
import com.oly.cms.hand.model.record.CmsScoreRecord;
import com.oly.cms.hand.service.impl.CmsArticleRecordServiceImpl;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.utils.ShiroUtils;

@RestController
@RequestMapping("/cms/api")
public class UserProfileRest extends CmsCommonController {

    @Autowired
    private ICmsCommentService commentService;

    @Autowired
    private ICmsArticleService articleService;

    @Autowired
    private CmsArticleRecordServiceImpl recordService;

    @Autowired
    private ICmsContactService contactService;

    /** 获取用户评论列表 */
    @PostMapping("/listComment")
    public TableDataInfo listComment(CmsComment cmsComment) {
        cmsComment.setFromBy(ShiroUtils.getUserId());
        startPage();
        List<CmsComment> list = commentService.listCmsComment(cmsComment);
        return getDataTable(list);
    }

    /** 获取用户文章列表 */
    @PostMapping("/listArticle")
    public TableDataInfo listArticle(ArticleVo artVo) {
        artVo.setCreateBy(ShiroUtils.getUserIdStr());
        startPage();
        List<CmsArticle> list = articleService.listCmsArticle(artVo);
        return getDataTable(list);
    }

    /**
     * 获取用户评文章操作列表 点赞 踩 收藏 浏览
     */
    @PostMapping("/listArticleHand")
    public TableDataInfo listArticleHand(String handleName) {
        startPage();
        if ("like".equals(handleName)) {
            CmsLikeRecord record = new CmsLikeRecord();
            record.setUserId(ShiroUtils.getUserId());
            return getDataTable(recordService.listLikeRecord(record));
        } else if ("nasty".equals(handleName)) {
            CmsNastyRecord record = new CmsNastyRecord();
            record.setUserId(ShiroUtils.getUserId());
            return getDataTable(recordService.listNastyRecord(record));
        } else if ("collect".equals(handleName)) {
            CmsCollectRecord record = new CmsCollectRecord();
            record.setUserId(ShiroUtils.getUserId());
            return getDataTable(recordService.listCollectRecord(record));
        } else {
            CmsLookRecord record = new CmsLookRecord();
            record.setUserId(ShiroUtils.getUserId());
            return getDataTable(recordService.listLookRecord(record));
        }
    }

    // 评分
    @PostMapping("/listScore")
    public TableDataInfo listScore(CmsScoreRecord scoreRecord) {
        scoreRecord.setUserId(ShiroUtils.getUserId());
        startPage();
        List<CmsScoreRecord> list = recordService.listScoreRecord(scoreRecord);
        return getDataTable(list);
    }

    /** 获取用户反馈列表 */
    @PostMapping("/listContact")
    public TableDataInfo listContact(CmsContact cmsContact) {
        cmsContact.setCreateBy(ShiroUtils.getUserIdStr());
        startPage();
        List<CmsContact> list = contactService.selectCmsContactList(cmsContact);
        return getDataTable(list);
    }
}
