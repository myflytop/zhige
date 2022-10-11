package com.oly.cms.general.mapper;

import com.oly.cms.common.domain.vo.UserVo;

/**
 * 通用查询
 */
public interface CommonSearchMapper {

    UserVo selectUserVo(String userId);
}
