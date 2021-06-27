package com.oly.cms.system.service;


import java.util.List;

import com.oly.cms.system.model.CmsTaoke;

/**
 * 淘客Service接口
 *
 * @author ruoyi
 * @date 2020-05-07
 */
public interface ICmsTaokeService {
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
     * 
     * @param cmsTaoke
     * @param cats
     * @param tags
     * @return
     */
    public int insertCmsTaoke(CmsTaoke cmsTaoke,Integer[] cats ,Integer[]  tags);

    
    /**
     * 
     * @param cmsTaoke
     * @param cats
     * @param tags
     * @return
     */
    public int updateCmsTaoke(CmsTaoke cmsTaoke,Integer[] cats ,Integer[]  tags);

    /**
     * 批量删除淘客
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteCmsTaokeByIds(String ids);

    String importTaos(List<CmsTaoke> taokeList,Integer[] cats ,Integer[]  tags,Byte taoType,boolean updateSupport,Long templateId,String operName);

    int updateCmsTaokePutOn(String ids, Byte fettle);

    public int onTimeShelves(long currentTimeMillis);
}
