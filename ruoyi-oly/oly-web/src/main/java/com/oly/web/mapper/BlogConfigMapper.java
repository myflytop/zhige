package com.oly.web.mapper;

import java.util.List;

import com.oly.web.model.po.BlogConfig;

import org.apache.ibatis.annotations.Param;

public interface BlogConfigMapper {

  public  BlogConfig getConfigByUnink(@Param("configGroup") String configGroup, @Param("configKey") String configKey);
  
  public  List<BlogConfig> listBlogConfigBackByGroup(String configGroup);
    
}
