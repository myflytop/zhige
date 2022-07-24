package com.oly.cms.admin.service;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import com.oly.cms.common.domain.entity.CmsTheme;

import org.springframework.web.multipart.MultipartFile;

public interface ICmsThemeService {
    /**
     * 删除主题 通过主题名字
     * 
     * @param themeName
     * @return
     * @throws FileNotFoundException
     */
    int deleteByName(String themeName) throws FileNotFoundException;

    /**
     * 查询主题
     * 
     * @param themeName
     * @return
     */
    CmsTheme selectByName(String themeName);

    /**
     * 获取已经启用的主题
     * 
     * @return
     */
    CmsTheme selectThemeByUsed();

    /**
     * 
     * @param file   文件
     * @param covery 覆盖上传
     * @return
     * @throws IOException
     * @throws Throwable
     */
    int uploadTheme(MultipartFile file, boolean covery) throws Throwable, IOException;

    /**
     * 启用设置主题
     * 
     * @param themeName
     * @return
     * @throws FileNotFoundException
     */
    int setTheme(String themeName);

    /**
     * 获取主题列表
     * 
     * @return
     */
    List<CmsTheme> listThemes();

    public Map<String, CmsTheme> listThemesToMap();

    /**
     * 获取启用的主题
     * 
     * @return
     */
    String getUseTheme() throws FileNotFoundException;

    /**
     * 获取名列表
     * 
     * @return
     */
    List<String> listThemeNames();

    /**
     * 同步主题信息
     * 
     * @param themeName
     * @param iSync
     * @return
     */
    int syncThemeInfo(String themeName, boolean iSync);

}
