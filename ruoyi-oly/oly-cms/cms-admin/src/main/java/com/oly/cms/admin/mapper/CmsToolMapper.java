package com.oly.cms.admin.mapper;

import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CmsToolMapper {

    public List<String> listCatIds(@Param("beginTime") String beginTime, @Param("types") String types);

    public List<String> listTagIds(@Param("beginTime") String beginTime, @Param("types") String types);

    public List<String> listPostIds(@Param("beginTime") String beginTime, @Param("types") String types);

}
