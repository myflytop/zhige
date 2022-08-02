package com.oly.cms.general.controller.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.oly.cms.common.model.enums.OrderEnums;
import com.oly.cms.common.model.enums.UnionSortEnums;
import com.oly.cms.general.taglib.UnionTag;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;

@CrossOrigin
@RestController
@RequestMapping("/api/union")
public class UnionApiController extends BaseController {

    @Autowired
    private UnionTag unionTag;

    /**
     * 获取标签
     * 
     * @param shopId
     * @return
     */
    @GetMapping("/get/{shopId}")
    public AjaxResult getCmsUnionByShopId(String shopId) {
        return AjaxResult.success(unionTag.getCmsUnionByShopId(shopId));
    }

    /**
     * @param cat
     * @param tag
     * @param unionType
     * @param pageNum
     * @param pageSize
     * @return
     */
    @GetMapping("/list")
    public AjaxResult listCmsUnions(@RequestParam(required = false) String cat,
            @RequestParam(required = false) String tag, @RequestParam(required = false) String unionType, int pageNum,
            int pageSize) {
        return AjaxResult.success(unionTag.listCmsUnions(cat, tag, unionType, pageNum, pageSize));
    }

    @GetMapping("/listUnion")
    public AjaxResult listCmsUnions(String unionType, String cat, UnionSortEnums sort, OrderEnums order,
            int pageNum, int pageSize) {
        return AjaxResult.success(unionTag.listCmsUnions(unionType, cat, sort, order, pageNum, pageSize));
    }

}
