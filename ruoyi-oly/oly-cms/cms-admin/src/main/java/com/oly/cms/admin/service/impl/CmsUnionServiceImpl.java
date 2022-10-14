package com.oly.cms.admin.service.impl;

import java.util.List;

import javax.validation.Validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import com.oly.cms.admin.mapper.CmsUnionMapper;
import com.oly.cms.admin.model.enums.UnionTypeEnums;
import com.oly.cms.admin.service.ICmsUnionService;
import com.oly.cms.common.domain.entity.CmsUnion;
import com.oly.cms.common.model.properties.OlyCmsConfigProperties;
import com.oly.cms.general.mapper.UnionSearchMapper;
import com.ruoyi.common.core.text.Convert;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.ShiroUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.bean.BeanValidators;
import com.ruoyi.system.config.service.ISysConfigService;

/**
 * 联盟推广Service业务层处理
 * 
 * @author zg
 * @date 2022-05-30
 */
@Service
public class CmsUnionServiceImpl implements ICmsUnionService {
    @Autowired
    private CmsUnionMapper cmsUnionMapper;
    @Autowired
    private DataSourceTransactionManager transactionManager;
    @Autowired
    private ISysConfigService configService;
    @Autowired
    private UnionSearchMapper unionSearchMapper;

    @Autowired
    protected Validator validator;

    /**
     * 查询联盟推广
     * 
     * @param shopId 联盟推广主键
     * @return 联盟推广
     */
    @Override
    public CmsUnion selectCmsUnionByShopId(String shopId) {
        return unionSearchMapper.selectCmsUnionByShopId(shopId);
    }

    /**
     * 查询联盟推广列表
     * 
     * @param cmsUnion 联盟推广
     * @return 联盟推广
     */
    @Override
    public List<CmsUnion> selectCmsUnionList(CmsUnion cmsUnion) {
        return unionSearchMapper.listCmsUnions(cmsUnion);
    }

    /**
     * 新增联盟推广
     * 
     * @param cmsUnion 联盟推广
     * @return 结果
     */
    @Override
    public int insertCmsUnion(CmsUnion cmsUnion) {
        return cmsUnionMapper.insertCmsUnion(cmsUnion);
    }

    /**
     * 修改联盟推广
     * 
     * @param cmsUnion 联盟推广
     * @return 结果
     */
    @Override
    public int updateCmsUnion(CmsUnion cmsUnion) {
        return cmsUnionMapper.updateCmsUnion(cmsUnion);
    }

    /**
     * 批量删除联盟推广
     * 
     * @param shopIds 需要删除的联盟推广主键
     * @return 结果
     */
    @Override
    public int deleteCmsUnionByShopIds(String shopIds) {
        return cmsUnionMapper.deleteCmsUnionByShopIds(Convert.toStrArray(shopIds));
    }

    /**
     * 删除联盟推广信息
     * 
     * @param shopId 联盟推广主键
     * @return 结果
     */
    @Override
    public int deleteCmsUnionByShopId(String shopId) {
        return cmsUnionMapper.deleteCmsUnionByShopId(shopId);
    }

    @Override
    public String importUnions(List<CmsUnion> unionList, boolean updateSupport, UnionTypeEnums unionType, String tags,
            String cats) {
        if (StringUtils.isNull(unionList) || unionList.size() == 0) {
            throw new ServiceException("导入数据不能为空！");
        }

        int successNum = 0;
        int failureNum = 0;
        StringBuilder successMsg = new StringBuilder();
        StringBuilder failureMsg = new StringBuilder();
        for (CmsUnion union : unionList) {
            union.setUnionType(unionType.name());
            union.setShopId(unionType.name().toLowerCase() + "_" + union.getShopId());
            union.setCats(cats);
            union.setTags(tags);
            TransactionStatus transactionStatus = transactionManager.getTransaction(new DefaultTransactionDefinition());
            try {
                CmsUnion u = unionSearchMapper.selectCmsUnionByShopId(union.getShopId());
                if (StringUtils.isNull(u)) {
                    BeanValidators.validateWithException(validator, union);
                    union.setCreateBy(ShiroUtils.getLoginName());
                    union.setVisible(Integer.parseInt(configService.selectConfigDefaultValue(
                            OlyCmsConfigProperties.CMS_CONFIG_GROUP.defaultValue(),
                            OlyCmsConfigProperties.UNION_VISIBLE_DEFAULT)));
                    cmsUnionMapper.insertCmsUnion(union);
                    successNum++;
                    successMsg.append("<br/>" + successNum + "、商品id " + union.getShopId() + " 导入成功");
                } else if (updateSupport) {
                    BeanValidators.validateWithException(validator, union);
                    union.setUpdateBy(ShiroUtils.getLoginName());
                    cmsUnionMapper.updateCmsUnion(union);
                    successNum++;
                    successMsg.append("<br/>" + successNum + "、商品id " + union.getShopId() + " 更新成功");
                } else {
                    failureNum++;
                    failureMsg.append("<br/>" + failureNum + "、商品id " + union.getShopId() + " 已存在");
                }
                transactionManager.commit(transactionStatus);
            } catch (Exception e) {
                failureNum++;
                String msg = "<br/>" + failureNum + "、商品id " + union.getShopId() + " 导入失败：";
                failureMsg.append(msg + e.getMessage());
                // 回滚数据库
                transactionManager.rollback(transactionStatus);
            }
        }
        if (failureNum > 0) {
            failureMsg.insert(0, "很抱歉，导入失败！共 " + failureNum + " 条数据格式不正确，错误如下：");
            throw new ServiceException(failureMsg.toString());
        } else {
            successMsg.insert(0, "恭喜您，数据已全部导入成功！共 " + successNum + " 条，数据如下：");
        }
        return successMsg.toString();
    }

    @Override
    public int updateCmsUnionVisible(String ids, int visible) {

        return cmsUnionMapper.updateCmsUnionVisible(Convert.toStrArray(ids), visible);
    }
}
