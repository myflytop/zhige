package com.ruoyi.taoke.admin.mapper;


import com.ruoyi.taoke.admin.model.CmsTaoke;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 淘客Mapper接口
 *
 * @author ruoyi
 * @date 2020-05-07
 */
public interface CmsTaokeMapper {
    /**
     * 查询淘客
     *
     * @param shopId 淘客ID
     * @return 淘客
     */
    public CmsTaoke selectCmsTaokeById(String shopId);

    /**
     * 查询淘客列表
     *
     * @param cmsTaoke 淘客
     * @return 淘客集合
     */
    public List<CmsTaoke> selectCmsTaokeList(CmsTaoke cmsTaoke);

    /**
     * 新增淘客
     *
     * @param cmsTaoke 淘客
     * @return 结果
     */
    public int insertCmsTaoke(CmsTaoke cmsTaoke);

    /**
     * 修改淘客
     *
     * @param cmsTaoke 淘客
     * @return 结果
     */
    public int updateCmsTaoke(CmsTaoke cmsTaoke);

    /**
     * 删除淘客
     *
     * @param shopId 淘客ID
     * @return 结果
     */
    public int deleteCmsTaokeById(String shopId);

    /**
     * 批量删除淘客
     *
     * @param shopIds 需要删除的数据ID
     * @return 结果
     */
    int deleteCmsTaokeByIds(String[] shopIds);

    /**
     * 关联文章淘客
     * @param articleId
     * @param shopId
     * @return
     */
    int insertCmsArticleTaoke(@Param("articleId") Long articleId,@Param("shopId") String shopId);

    /**
     * 判断是否导入
     * @param shopId
     * @return
     */
    int checkArticleTaokeByTaokeId(String shopId);

    int updateCmsTaokePutOn(@Param("ids")String[] ids,@Param("fettle") Byte fettle);

    /**
     * 时间戳之前的下架
     * @param currentTimeMillis
     * @return
     */
    int onTimeShelves(long currentTimeMillis);
}
