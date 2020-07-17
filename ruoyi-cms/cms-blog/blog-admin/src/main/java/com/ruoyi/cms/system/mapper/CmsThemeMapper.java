package com.ruoyi.cms.system.mapper;

import org.apache.ibatis.annotations.Param;

import com.ruoyi.cms.system.model.po.CmsTheme;

import java.util.List;

public interface CmsThemeMapper {
    int deleteByName(String themeName);

    int insert(CmsTheme theme);

    int insertSelective(CmsTheme theme);

    CmsTheme selectById(Integer themeId);

    /**
     * 获取已经启用的主题
     * @return
     */
    CmsTheme selectThemeByUsed();

    int updateById(CmsTheme theme);

    int updateThemeEnable(@Param("oldName") String oldName, @Param("newName") String newName);

    /**
     * 获取主题列表
     * @return
     */
    List<CmsTheme> listThemes();

    List<String> listThemeName();
}