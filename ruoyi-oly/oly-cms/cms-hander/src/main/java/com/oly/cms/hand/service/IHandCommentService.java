package com.oly.cms.hand.service;

import java.util.List;

import com.oly.cms.comment.model.CmsComment;
import com.oly.cms.comment.model.enums.CommentTypeEnum;
import com.oly.cms.common.model.support.PageData;

public interface IHandCommentService {

    List<CmsComment> listCommentOneByTypeId(String typeId, int pageNum, int pageSize);

    List<CmsComment> listCommentTwoByParentId(long parentId, int pageNum, int pageSize);

    List<CmsComment> listCommentByTypeId(String typeId, int pageNum, int pageSize);

    PageData pageOneCommentByTypeId(String typeId, int pageNum, int pageSize);

    PageData pageTwoCommentByParentId(long parentId, int pageNum, int pageSize);

    PageData pageCommentByTypeId(String typeId, int pageNum, int pageSize);

    boolean commentSupport(CommentTypeEnum commentTypeEnum);

}
