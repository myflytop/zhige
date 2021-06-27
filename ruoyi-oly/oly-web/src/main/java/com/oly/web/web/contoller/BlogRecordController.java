package com.oly.web.web.contoller;

import com.oly.web.model.enums.RecordTableEnum;
import com.oly.web.model.pam.BlogRecordParam;
import com.oly.web.service.impl.BlogRecordServiceImpl;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.ServletUtils;
import com.ruoyi.common.utils.ShiroUtils;
import org.apache.shiro.authz.annotation.RequiresUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import eu.bitwalker.useragentutils.UserAgent;

@Controller
@RequestMapping("/blog/record")
public class BlogRecordController {
    @Autowired
    private BlogRecordServiceImpl recordService;

    /**
     * 文章点击记录
     * 
     * @param blogRecordParam
     * @return
     */
    @PostMapping("/addLookRecord")
    @ResponseBody
    public AjaxResult addLookRecord(BlogRecordParam blogRecordParam) {
        s(blogRecordParam);
        return AjaxResult.success(recordService.insertLookRecord(blogRecordParam));
    }

    /**
     * 喜欢|点赞记录表 不能同时喜欢 讨厌
     * 
     * @param blogRecordParam
     * @return
     */
    @PostMapping("/addLikeRecord")
    @RequiresUser
    @ResponseBody
    public AjaxResult addLikeRecord(BlogRecordParam blogRecordParam) {
        s(blogRecordParam);
        if (recordService.countRecord(RecordTableEnum.LIKE_RECORD, blogRecordParam.getArticleId(),
                blogRecordParam.getUserId()) != 0) {
            return AjaxResult.error("你已经点过赞！");
        } else if (recordService.countRecord(RecordTableEnum.NASTY_RECORD, blogRecordParam.getArticleId(),
                blogRecordParam.getUserId()) != 0) {
            return AjaxResult.error("你已经踩过了！");
        } else {

            return AjaxResult.success(recordService.insertLikeRecord(blogRecordParam));
        }
    }

    /**
     * 不喜欢|踩记录表 不能同时喜欢 讨厌
     * 
     * @param blogRecordParam
     * @return
     */
    @PostMapping("/addNastyRecord")
    @RequiresUser
    @ResponseBody
    public AjaxResult addNastyRecord(BlogRecordParam blogRecordParam) {
        s(blogRecordParam);
        if (recordService.countRecord(RecordTableEnum.LIKE_RECORD, blogRecordParam.getArticleId(),
                blogRecordParam.getUserId()) != 0) {
            return AjaxResult.error("你已经点过赞！");
        } else if (recordService.countRecord(RecordTableEnum.NASTY_RECORD, blogRecordParam.getArticleId(),
                blogRecordParam.getUserId()) != 0) {
            return AjaxResult.error("你已经踩过了！");
        } else {
            s(blogRecordParam);
            return AjaxResult.success(recordService.insertNastyRecord(blogRecordParam));
        }
    }

    /**
     * 添加评分
     * 
     * @param blogRecordParam
     * @return
     */
    @PostMapping("/addScoreRecord")
    @RequiresUser
    @ResponseBody
    public AjaxResult addScoreRecord(BlogRecordParam blogRecordParam) {
        s(blogRecordParam);
        return AjaxResult.success(recordService.insertScoreRecord(blogRecordParam));
    }

    /**
     * 文章分享
     * 
     * @param blogRecordParam
     * @return
     */
    @PostMapping("/addShareRecord")
    @RequiresUser
    @ResponseBody
    public AjaxResult addShareRecord(BlogRecordParam blogRecordParam) {
        s(blogRecordParam);
        return AjaxResult.success(recordService.insertShareRecord(blogRecordParam));
    }

    /**
     * 添加收藏
     * 
     * @param blogRecordParam
     * @return
     */
    @PostMapping("/addCollectRecord")
    @RequiresUser
    @ResponseBody
    public AjaxResult addCollectRecord(BlogRecordParam blogRecordParam) {
        s(blogRecordParam);
        return AjaxResult.success(recordService.insertCollectRecord(blogRecordParam));
    }

    /**
     *
     * 设置系统标识 浏览器
     */
    private void s(BlogRecordParam blogRecordParam) {
        UserAgent userAgent = UserAgent.parseUserAgentString(ServletUtils.getRequest().getHeader("User-Agent"));
        String ip = ShiroUtils.getIp();
        blogRecordParam.setIp(ip);
        try {
            blogRecordParam.setUserId(ShiroUtils.getUserId());
        } catch (Exception e) {
        }

        blogRecordParam.setUserSystem(userAgent.getOperatingSystem().getName());
        blogRecordParam.setUserBower(userAgent.getBrowser().getName());
    }

}
