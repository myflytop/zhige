package com.oly.cms.hand.controller;

import com.oly.cms.common.domain.entity.CmsContact;
import com.oly.cms.hand.service.impl.HandleServiceImpl;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.ShiroUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

/**
 * 通用控制
 */
@RestController
@RequestMapping("/web/hand/common")
public class CommonHandleController extends BaseController {

    @Autowired
    private HandleServiceImpl webHandleService;

    /**
     * 添加建议反馈
     * 
     * @return
     */
    @PostMapping("/addContact")
    @ResponseBody
    public AjaxResult addContact(CmsContact cmsContact) {
        cmsContact.setCreateBy(ShiroUtils.getUserIdStr());
        cmsContact.setVisible(0);
        cmsContact.setContactType(cmsContact == null ? 0 : cmsContact.getContactType());
        return toAjax(webHandleService.insertCmsContact(cmsContact));
    }

}
