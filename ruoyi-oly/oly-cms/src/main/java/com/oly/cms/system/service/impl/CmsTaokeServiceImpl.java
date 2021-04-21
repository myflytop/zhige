package com.oly.cms.system.service.impl;

import java.util.List;

import com.oly.cms.system.mapper.CmsArticleLiquidMapper;
import com.oly.cms.system.mapper.CmsTaokeMapper;
import com.oly.cms.system.model.CmsTaoke;
import com.oly.cms.system.model.vo.ArticleVo;
import com.oly.cms.system.service.ICmsTaokeService;
import com.oly.common.constant.OlySystemConstant;
import com.ruoyi.common.core.text.Convert;
import com.ruoyi.common.exception.BusinessException;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.ShiroUtils;
import com.ruoyi.common.utils.StringUtils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

/**
 * 淘客Service业务层处理
 *
 * @author ruoyi
 * @date 2020-05-07
 */
@Service
public class CmsTaokeServiceImpl implements ICmsTaokeService {
    @Autowired
    private CmsTaokeMapper cmsTaokeMapper;
    private static final Logger log = LoggerFactory.getLogger(CmsTaokeServiceImpl.class);
    @Autowired
    private CmsArticleServiceImpl cmsArticleService;

    @Autowired
	private CmsArticleLiquidMapper cmsArticleLiquidMapper;

    @Autowired
    private DataSourceTransactionManager transactionManager;

    /**
     * 查询淘客
     *
     * @param shopId 淘客ID
     * @return 淘客
     */
    @Override
    public CmsTaoke selectCmsTaokeById(String shopId) {
        return cmsTaokeMapper.selectCmsTaokeById(shopId);
    }

    /**
     * 查询淘客列表
     *
     * @param cmsTaoke 淘客
     * @return 淘客
     */
    @Override
    public List<CmsTaoke> selectCmsTaokeList(CmsTaoke cmsTaoke) {
        return cmsTaokeMapper.selectCmsTaokeList(cmsTaoke);
    }

    /**
     * 新增淘客
     *
     * @param cmsTaoke 淘客
     * @return 结果
     */
    @Override
    public int insertCmsTaoke(CmsTaoke cmsTaoke) {
        cmsTaoke.setCreateTime(DateUtils.getNowDate());
        return cmsTaokeMapper.insertCmsTaoke(cmsTaoke);
    }

    /**
     * 修改淘客
     *
     * @param cmsTaoke 淘客
     * @return 结果
     */
    @Override
    public int updateCmsTaoke(CmsTaoke cmsTaoke) {
        cmsTaoke.setUpdateTime(DateUtils.getNowDate());
        
        return cmsTaokeMapper.updateCmsTaoke(cmsTaoke);
    }

    /**
     * 删除淘客对象
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteCmsTaokeByIds(String ids) {
        return cmsTaokeMapper.deleteCmsTaokeByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除淘客信息
     *
     * @param shopId 淘客ID
     * @return 结果
     */
    @Override
    public int deleteCmsTaokeById(String shopId) {
        return cmsTaokeMapper.deleteCmsTaokeById(shopId);
    }

    @Override
    public String importTaos(List<CmsTaoke> taokeList,Integer[] cats ,Integer[]  tags,boolean updateSupport, String operName) {
        if (StringUtils.isNull(taokeList) || taokeList.size() == 0) {
            throw new BusinessException("导入数据不能为空！");
        }
        int successNum = 0;
        int failureNum = 0;
        StringBuilder successMsg = new StringBuilder();
        StringBuilder failureMsg = new StringBuilder();
        for (CmsTaoke taoke : taokeList) {
            TransactionStatus transactionStatus =transactionManager.getTransaction(new DefaultTransactionDefinition());
            ArticleVo cmsArticle = new ArticleVo();
            try {
                //设置默认标题,预览为空
                cmsArticle.setArticleTitle(taoke.getShopName());
                cmsArticle.setArticleType(OlySystemConstant.TAO_KE_POST_TYPE);
                cmsArticle.setCats(cats);
                cmsArticle.setTags(tags);
                //默认不允许评论
                cmsArticle.setAllowComment(true);
                // 验证是否存已经插入过了
                CmsTaoke u = cmsTaokeMapper.selectCmsTaokeById(taoke.getShopId());
                if (StringUtils.isNull(u)) {  
                    cmsArticle.setCreateBy(ShiroUtils.getUserId());
                    cmsArticle.setCreateTime(DateUtils.getNowDate());
                    cmsArticleService.insertCmsArticle(cmsArticle);
                    Long articleId = cmsArticle.getArticleId();
                    taoke.setArticleId(articleId);
                    this.insertCmsTaoke(taoke);
                    successNum++;
                    successMsg.append("<br/>" + successNum + "、商品id " + taoke.getShopId() + " 导入成功");
                } else if (updateSupport) {
                    cmsArticle.setUpdateBy(ShiroUtils.getUserId());
                    cmsArticle.setUpdateTime(DateUtils.getNowDate());
                    Long[] ids=new Long[]{u.getArticleId()};
                    cmsArticleLiquidMapper.deleteArticleCatByIds(ids);
                    cmsArticleLiquidMapper.deleteArticleTagByIds(ids);
                    cmsArticle.setArticleId(u.getArticleId());
                    this.updateCmsTaoke(taoke);
                    cmsArticleService.updateCmsArticleById(cmsArticle);
                    successNum++;
                    successMsg.append("<br/>" + successNum + "、商品id " + taoke.getShopId() + " 更新成功");
                } else {
                    failureNum++;
                    failureMsg.append("<br/>" + failureNum + "、商品id " + taoke.getShopId() + " 已存在");
                }
                transactionManager.commit(transactionStatus);
            } catch (Exception e) {
                failureNum++;
                String msg = "<br/>" + failureNum + "、商品id " + taoke.getShopId() + " 导入失败：";
                failureMsg.append(msg + e.getMessage());
                log.error(msg, e);
                //回滚数据库
                transactionManager.rollback(transactionStatus);
            }
        }
        if (failureNum > 0) {
            failureMsg.insert(0, "很抱歉，导入失败！共 " + failureNum + " 条数据格式不正确，错误如下：");
            throw new BusinessException(failureMsg.toString());
        } else {
            successMsg.insert(0, "恭喜您，数据已全部导入成功！共 " + successNum + " 条，数据如下：");
        }
        return successMsg.toString();
    }

    @Override
    public int updateCmsTaokePutOn(String ids, Byte fettle) {
        cmsArticleService.updateVisible(Convert.toLongArray(ids),fettle);
        return cmsTaokeMapper.updateCmsTaokePutOn(Convert.toStrArray(ids), fettle);
    }
    @Override
    public int onTimeShelves(long currentTimeMillis) {
        return cmsTaokeMapper.onTimeShelves(currentTimeMillis);
    }
}
