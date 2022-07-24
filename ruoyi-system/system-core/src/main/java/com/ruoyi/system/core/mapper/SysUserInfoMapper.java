package com.ruoyi.system.core.mapper;

import java.util.List;
import com.ruoyi.common.core.domain.entity.SysUserInfo;

/**
 * 用户详细信息Mapper接口
 * 
 * @author ZD
 * @date 2022-04-28
 */
public interface SysUserInfoMapper {
    /**
     * 查询用户详细信息
     * 
     * @param userId 用户详细信息主键
     * @return 用户详细信息
     */
    public SysUserInfo selectSysUserInfoByUserId(Long userId);

    /**
     * 查询用户详细信息列表
     * 
     * @param sysUserInfo 用户详细信息
     * @return 用户详细信息集合
     */
    public List<SysUserInfo> selectSysUserInfoList(SysUserInfo sysUserInfo);

    /**
     * 新增用户详细信息
     * 
     * @param sysUserInfo 用户详细信息
     * @return 结果
     */
    public int insertSysUserInfo(SysUserInfo sysUserInfo);

    /**
     * 修改用户详细信息
     * 
     * @param sysUserInfo 用户详细信息
     * @return 结果
     */
    public int updateSysUserInfo(SysUserInfo sysUserInfo);

    /**
     * 删除用户详细信息
     * 
     * @param userId 用户详细信息主键
     * @return 结果
     */
    public int deleteSysUserInfoByUserId(Long userId);

    /**
     * 批量删除用户详细信息
     * 
     * @param userIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysUserInfoByUserIds(Long[] userIds);
}
