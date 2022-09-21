package com.oly.cms.comment.model.vo;

import com.oly.cms.comment.model.CmsComment;
import com.oly.cms.common.domain.vo.UserVo;

public class CmsCommentVo extends CmsComment {
    private static final long serialVersionUID = 1L;

    private UserVo fromUser;

    private UserVo replyUser;

    public UserVo getFromUser() {
        return fromUser;
    }

    public void setFromUser(UserVo fromUser) {
        this.fromUser = fromUser;
    }

    public UserVo getReplyUser() {
        return replyUser;
    }

    public void setReplyUser(UserVo replyUser) {
        this.replyUser = replyUser;
    }

}
