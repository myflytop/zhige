package com.ruoyi.blog.web.contoller;


import com.ruoyi.blog.mould.BlogContact;
import com.ruoyi.blog.service.impl.BlogHandleServiceImpl;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.framework.util.ShiroUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


/**
 * 相关操作
 */
@Controller
@RequestMapping("/blog/handle")
public class BlogHandleController extends BaseController {

    @Autowired
    private BlogHandleServiceImpl blogHandleService;

    /**
     *
     * @return
     */
    @PostMapping("/contact")
    @ResponseBody
    public AjaxResult contact(BlogContact blogContact){
        Long userId=null;
       try {
           userId=ShiroUtils.getUserId();
       }
       catch (Exception e)
       {
           userId=null;
       }
       blogContact.setCreateBy(userId);
        return toAjax(blogHandleService.insertBlogContact(blogContact));
    }



}
