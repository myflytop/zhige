package com.ruoyi.cms.system.service;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import com.ruoyi.cms.common.mould.support.OperateStatus;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.ruoyi.cms.system.model.po.CmsTheme;

public interface ICmsThemeService {
    /**
     * 删除主题 通过主题名字
     * @param themeName
     * @return
     * @throws FileNotFoundException 
     */
	int deleteByName(String themeName) throws FileNotFoundException;
    /**
     * 添加主题
     * @param theme
     * @return
     */
    int insert(CmsTheme theme);
    /**
     * 有选择添加
     * @param theme
     * @return
     */
    int insertSelective(CmsTheme theme);
    /**
     * 查询主题
     * @param themeId
     * @return
     */
    CmsTheme selectById(Integer themeId);

    /**
     * 获取已经启用的主题
     * @return
     */
    CmsTheme selectThemeByUsed();

    /**
     * 更新主题
     * @param theme
     * @return
     */
    int updateById(CmsTheme theme);
    /**
     * 
     * @param file 文件
     * @param themePath 主题路径
     * @return
     * @throws IOException 
     * @throws Throwable 
     */
    OperateStatus uploadTheme(MultipartFile file, File themePath) throws Throwable, IOException;

    /**
     * 启用设置主题
     * @param themeName
     * @return
     * @throws FileNotFoundException
     */
	int setTheme(String themeName);

    /**
     * 获取主题列表
     * @return
     */
	Map<String, CmsTheme> listThemes() ;

    /**
     * 获取启用的主题
     * @return
     */
	String getUseTheme() throws FileNotFoundException;

    /**
     * 获取名列表
     * @return
     */
    List<String> listThemeName();
}
