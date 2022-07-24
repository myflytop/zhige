package com.oly.cms.admin.controller.page;

import com.oly.cms.admin.web.CmsCommonController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/cms/profile")
public class CmsProfileController extends CmsCommonController {

    private final String preifx = acceptPrefix + "profile";

    @GetMapping("/user")
    public String userProfile() {

        return preifx + "/user";
    }
}
