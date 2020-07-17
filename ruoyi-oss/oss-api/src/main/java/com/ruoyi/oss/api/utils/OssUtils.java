package com.ruoyi.oss.api.utils;

public class OssUtils {
    private  OssUtils(){}

    /**
     * 获取文件名,个别浏览器文件名是全路径
     * @return
     */
    public static String getFileName( String originalBasename){
        //edge包含全路径
        if(originalBasename.contains("\\")) {
            originalBasename = originalBasename.substring(originalBasename.lastIndexOf('\\') + 1);
        }
        return originalBasename;
    }


}
