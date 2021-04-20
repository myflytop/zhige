package com.oly.cms.system.service;

import java.util.List;

import com.oly.cms.system.mapper.CmsToolMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CmsToolService {
    @Autowired
    private CmsToolMapper cmsToolMapper;

    public List<String> listCatIds(String beginTime) {
        return cmsToolMapper.listCatIds(beginTime);
    }

    public List<String> listTagIds(String beginTime) {
        return cmsToolMapper.listTagIds(beginTime);
    }

    public List<String> listPostIds(String beginTime) {
        return cmsToolMapper.listPostIds(beginTime);
    }
}
