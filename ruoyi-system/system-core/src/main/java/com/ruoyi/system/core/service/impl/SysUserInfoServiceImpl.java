package com.ruoyi.system.core.service.impl;

import java.util.List;

import com.ruoyi.common.core.domain.entity.SysUserInfo;
import com.ruoyi.system.core.mapper.SysUserInfoMapper;
import com.ruoyi.system.core.service.ISysUserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 用户详细信息Service业务层处理
 * 
 * @author ZD
 * @date 2022-04-28
 */
@Service
public class SysUserInfoServiceImpl implements ISysUserInfoService {
    @Autowired
    private SysUserInfoMapper sysUserInfoMapper;

    /**
     * 查询用户详细信息
     * 
     * @param userId 用户详细信息主键
     * @return 用户详细信息
     */
    @Override
    public SysUserInfo selectSysUserInfoByUserId(Long userId) {
        SysUserInfo u = sysUserInfoMapper.selectSysUserInfoByUserId(userId);
        if (u == null) {
            u = new SysUserInfo();
            u.setUserId(userId);
            sysUserInfoMapper.insertSysUserInfo(u);
        }
        return u;
    }

    /**
     * 查询用户详细信息列表
     * 
     * @param sysUserInfo 用户详细信息
     * @return 用户详细信息
     */
    @Override
    public List<SysUserInfo> selectSysUserInfoList(SysUserInfo sysUserInfo) {
        return sysUserInfoMapper.selectSysUserInfoList(sysUserInfo);
    }

    /**
     * 新增用户详细信息
     * 
     * @param sysUserInfo 用户详细信息
     * @return 结果
     */
    @Override
    public int insertSysUserInfo(SysUserInfo sysUserInfo) {
        return sysUserInfoMapper.insertSysUserInfo(sysUserInfo);
    }

    /**
     * 修改用户详细信息
     * 
     * @param sysUserInfo 用户详细信息
     * @return 结果
     */
    @Override
    public int updateSysUserInfo(SysUserInfo sysUserInfo) {
        return sysUserInfoMapper.updateSysUserInfo(sysUserInfo);
    }

}
