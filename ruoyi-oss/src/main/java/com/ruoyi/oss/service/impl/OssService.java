package com.ruoyi.oss.service.impl;

import java.util.List;

import com.ruoyi.oss.domain.OlyOss;
import com.ruoyi.oss.mapper.OlyOssMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OssService {

    @Autowired
    private OlyOssMapper ossMapper;

    /**
     * 查询文件存储
     * 
     * @param id 文件存储ID
     * @return 文件存储
     */
    public OlyOss selectOlyOssById(Long id) {
        return ossMapper.selectOlyOssById(id);
    }

    /**
     * 查询文件存储列表
     * 
     * @param olyOss 文件存储
     * @return 文件存储集合
     */
    public List<OlyOss> selectOlyOssList(OlyOss olyOss) {
        return ossMapper.selectOlyOssList(olyOss);
    }

    /**
     * 删除文件存储
     * 
     * @param key 文件存储Key
     * @return 结果
     */
    public int deleteOlyOssByFk(String key) {
        return ossMapper.deleteOlyOssByFk(key);
    }

    /**
     * 删除文件存储
     * 
     * @param id
     * @return 结果
     */
    public int deleteOlyOssById(Long id) {
        return ossMapper.deleteOlyOssById(id);
    }

    /**
     * 批量删除文件存储
     * 
     * @param ids 需要删除的数据Key
     * @return 结果
     */
    public int deleteOlyOssByFks(String[] keys) {
        return ossMapper.deleteOlyOssByFks(keys);
    }
}
