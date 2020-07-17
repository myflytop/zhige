package com.ruoyi.cms.common.utils;

import com.ruoyi.cms.common.constant.CmsSystemConstant;
import org.springframework.util.ResourceUtils;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.List;

public class ThemeUtils {
    private  ThemeUtils(){

    }

    /**
     * 获取主题文件所在目录
     * @return
     * @throws FileNotFoundException
     */
    public static String getThemeDir() throws FileNotFoundException {
        // 获取项目根路径,jar所在的目录
        final File basePath = new File(ResourceUtils.getURL("classpath:").getPath());
        // 构建路径
        final File themePath = new File(basePath.getAbsolutePath(), CmsSystemConstant.THEME_ROOT);
        return themePath.toString();
    }

    /**
     * 获取当前目录下的文件夹列表
     * @param path 路径
     * @return
     */
  public static List<String>  getFileList(String path){
        File themeRoot=new File(path);
      ArrayList<String> fileList=new ArrayList();
        if(themeRoot.exists()&&themeRoot.isDirectory()) {
            File[] files = themeRoot.listFiles();
            if(files.length>0)
            {
                for (File file:files ) {
                    if(file.isDirectory())
                    {
                        fileList.add(file.getName());
                    }
                }
            }
        }
        return fileList;
    }

}
