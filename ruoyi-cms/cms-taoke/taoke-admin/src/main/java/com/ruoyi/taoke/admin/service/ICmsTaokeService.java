package com.ruoyi.taoke.admin.service;


import com.ruoyi.taoke.admin.model.CmsTaoke;

import java.util.List;

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
     * 批量删除淘客
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteCmsTaokeByIds(String ids);

    /**
     * 删除淘客信息
     *
     * @param shopId 淘客ID
     * @return 结果
     */
    public int deleteCmsTaokeById(String shopId);

    String importTaos(List<CmsTaoke> taokeList,Integer[] cats ,Integer[]  tags,boolean updateSupport, String operName);

    int updateCmsTaokePutOn(String ids, Byte fettle);

   public int onTimeShelves(long currentTimeMillis);
}
