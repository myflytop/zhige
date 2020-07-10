package com.ruoyi.cms.system.utils;


import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.util.ResourceUtils;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.ruoyi.cms.system.model.po.CmsTheme;


public class CmsUtils {

	/**
	 * 删除主题
	 * @param themeName
	 * @return
	 * @throws FileNotFoundException 
	 */
	public static boolean deleteThemeFile(String themeName) throws FileNotFoundException {
		 // 获取项目根路径
        final File basePath = new File(ResourceUtils.getURL("classpath:").getPath());
        // 获取主题路径
        final File themesPath = new File(basePath.getAbsolutePath(), "templates/themes/"+themeName);
        
        if(themesPath.exists())
        {
        return deleteDir(themesPath);
        }
        else
        {
            return true;
        }

	}
	
	/**
     * 递归删除目录下的所有文件及子目录下所有文件
     * @param dir 将要删除的文件目录
     * @return boolean Returns "true" if all deletions were successful.
     *                 If a deletion fails, the method stops attempting to
     *                 delete and returns "false".
     */
    private static boolean deleteDir(File dir) {
        if (dir.isDirectory()) {
            String[] children = dir.list();
          //递归删除目录中的子目录下
            for (int i=0; i<children.length; i++) {
                boolean success = deleteDir(new File(dir, children[i]));
                if (!success) {
                    return false;
                }
            }
        }
        // 目录此时为空，可以删除
        return dir.delete();
    }
}
