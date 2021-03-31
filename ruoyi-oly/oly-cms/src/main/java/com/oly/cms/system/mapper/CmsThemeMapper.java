package com.oly.cms.system.mapper;

import org.apache.ibatis.annotations.Param;

import com.oly.cms.system.model.po.CmsTheme;

import java.util.List;

public interface CmsThemeMapper {
    int deleteByName(String themeName);

    int insert(CmsTheme theme);

    int insertSelective(CmsTheme theme);

    CmsTheme selectById(Integer themeId);

    CmsTheme selectByName(String themeName);

    /**
     * 获取已经启用的主题
     * 
     * @return
     */
    CmsTheme selectThemeByUsed();

    int updateById(CmsTheme theme);

    int updateThemeEnable(@Param("oldName") String oldName, @Param("newName") String newName);

    /**
     * 获取主题列表
     * 
     * @return
     */
    List<CmsTheme> listThemes();

    List<String> listThemeName();

    /**
     * 查询主题是否已经上传
     * @param themeName
     * @return
     */
    int countThemeByName(String themeName);
}