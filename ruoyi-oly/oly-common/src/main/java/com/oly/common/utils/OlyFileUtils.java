package com.oly.common.utils;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class OlyFileUtils {

    private OlyFileUtils(){

    }

    /**
     *
     * @return 返回斜杠
     */
    public static String getSeparator(){
        //斜杠,在 windows 中 文件文件分隔符 用 ' \ ' 或者 ' / ' 都可以
        //但是在 Linux 中，不识别 ' \ '  的，而
        //    //File.separator 是系统默认的文件分隔符号
        //    //在 UNIX 系统上，此字段的值为 ' / '
        return File.separator;
    }
    public static String getHttpURLPath(String path) {
        return path.replace("\\", "/");
    }

    public static String getPath(String ...args){
        String path="";
        for(int i=0;i<args.length;i++){
            path+=getSeparator()+args[i];
        }
        return path;
    }

    /**
     *
     * @return 返回形如20201222
     */
    public static String getDataName(){
        Calendar current = Calendar.getInstance();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        return sdf.format(current.getTime());


    }


    /**
     *
     * @return 形如 /2020/7
     */
    static String getDataPath() {
        // Get current time
        Calendar current = Calendar.getInstance();
        // Get month and day of month
        int year = current.get(Calendar.YEAR);
        //  Get month and day of year
        int month = current.get(Calendar.MONTH) + 1;
        return getPath(Integer.toString(year),Integer.toString(month));
    }

    public static void main(String[] args) {
        System.out.println(getDataName());
    }
}
