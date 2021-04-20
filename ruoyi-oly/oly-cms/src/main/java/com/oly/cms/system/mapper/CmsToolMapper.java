package com.oly.cms.system.mapper;

import java.util.List;

public interface CmsToolMapper {

    public List<String> listCatIds(String beginTime);

    public List<String> listTagIds(String beginTime);

    public List<String> listPostIds(String beginTime);
    
}
