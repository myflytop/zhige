package com.oly.cms.hand.controller;

import com.oly.cms.common.domain.entity.CmsContact;
import com.oly.cms.hand.service.impl.HandleServiceImpl;
import com.ruoyi.common.annotation.RepeatSubmit;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.ShiroUtils;
import com.oly.cms.general.annotation.WebLog;
import com.oly.cms.general.model.enums.WebBusinessType;
import com.oly.cms.general.model.enums.WebLogType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

/**
 * 通用控制
 * 默认小于一分钟为重复提交
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
    @RepeatSubmit(interval = 60000)
    @PostMapping("/addContact")
    @WebLog(title = "添加反馈", logType = WebLogType.CONTACT, businessType = WebBusinessType.INSERT)
    @ResponseBody
    public AjaxResult addContact(CmsContact cmsContact) {
        cmsContact.setCreateBy(ShiroUtils.getUserIdStr());
        cmsContact.setVisible(0);
        cmsContact.setContactType(cmsContact.getContactType() == null ? 0 : cmsContact.getContactType());
        return toAjax(webHandleService.insertCmsContact(cmsContact));
    }

}
