package com.ruoyi.blog.utils;


public class ThymeleafUtils {

    public static String[] split(String s){
        if(s==null||"".equals(s))
        {
            return null;
        }
        return  s.split(",");
    }

}
