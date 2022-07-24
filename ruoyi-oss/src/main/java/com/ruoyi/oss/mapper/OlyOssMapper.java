package com.ruoyi.oss.mapper;

import java.util.List;
import com.ruoyi.oss.domain.OlyOss;

/**
 * 文件存储Mapper接口
 * 
 * @author ruoyi
 * @date 2021-02-26
 */
public interface OlyOssMapper {
    /**
     * 查询文件存储
     * 
     * @param id 文件存储ID
     * @return 文件存储
     */
    public OlyOss selectOlyOssById(Long id);

    /**
     * 查询文件存储
     * 
     * @param key 文件存储
     * @return 文件存储
     */
    public OlyOss selectOlyOssByFk(String key);

    /**
     * 查询文件存储列表
     * 
     * @param olyOss 文件存储
     * @return 文件存储集合
     */
    public List<OlyOss> selectOlyOssList(OlyOss olyOss);

    /**
     * 新增文件存储
     * 
     * @param olyOss 文件存储
     * @return 结果
     */
    public int insertOlyOss(OlyOss olyOss);

    /**
     * 删除文件存储
     * 
     * @param id 文件存储Key
     * @return 结果
     */
    public int deleteOlyOssByFk(String key);

    /**
     * 批量删除文件存储
     * 
     * @param ids 需要删除的数据Key
     * @return 结果
     */
    public int deleteOlyOssByFks(String[] Keys);

    public int deleteOlyOssById(Long id);
}
