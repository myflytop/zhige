package com.oly.cms.system.service;

import java.util.List;

import com.oly.cms.system.mapper.CmsToolMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CmsToolService {
    @Autowired
    private CmsToolMapper cmsToolMapper;

    public List<String> listCatIds() {
        return cmsToolMapper.listCatIds();
    }

    public List<String> listTagIds() {
        return cmsToolMapper.listTagIds();
    }

    public List<String> listPostIds() {
        return cmsToolMapper.listPostIds();
    }
}
