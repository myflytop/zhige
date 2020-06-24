package com.ruoyi.oss.api;

import java.util.*;

/**
 * 文本：text ，（doc docx）， （xls xlsx），（ ppt pptx）， pdf
 * 音乐：mp3
 * 视频：mp4
 * 压缩：zip，rar
 * 图片：png，jpg，jpge
 *
 *
 * 获取后缀
 * 获取文件头
 * 文件头和后缀一致
 */
public class SupportType {

    /*public final static Map<String, List<String>> SUPPORT_MEDIA = new HashMap<String, List<String>>();*/
    public final static Map<String, String> SUPPORT_MEDIA = new HashMap<String, String>();

    public  final static List<String> SUPPORT_SUFFER=new ArrayList<>();
    private SupportType() {

    }

    static {
        InitSupportType(); // 初始化文件类型信息
    }

    /**
     * Discription:[getAllFileType,常见文件头信息]
     */
    private static void  InitSupportType(){
        /**
         * application/msword 	word(.doc)
         * application/vnd.ms-powerpoint 	powerpoint(.ppt)
         * application/vnd.ms-excel 	excel(.xls)
         * application/vnd.openxmlformats-officedocument.wordprocessingml.document 	word(.docx)
         * application/vnd.openxmlformats-officedocument.presentationml.presentation 	powerpoint(.pptx)
         * application/vnd.openxmlformats-officedocument.spreadsheetml.sheet 	excel(.xlsx)
         * application/pdf 	pdf
         * text/plain 	纯文本
         * text/css 	css文件
         * text/html 	html文件
         * text/x-java-source 	java源代码
         * text/x-csrc 	c源代码
         * text/x-c++src 	c++源代码
         *
         *
         */
 /*   SUPPORT_MEDIA.put("world", Arrays.asList(
            "application/msword",
            "application/vnd.ms-powerpoint",
            "application/vnd.ms-excel",
            "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
            "application/vnd.openxmlformats-officedocument.presentationml.presentation",
            "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
            "application/x-rar-compressed",
            "application/pdf"
    ));
          *//**
         * application/x-rar-compressed 	rar
        * application/zip 	zip
         **//*
    SUPPORT_MEDIA.put("reduce", Arrays.asList(
     "application/zip",
    "application/x-rar-compressed"));
    SUPPORT_MEDIA.put("video", Arrays.asList(
      "video/mp4"));
    SUPPORT_MEDIA.put("img",Arrays.asList(
            "image/png",
            "image/jpeg"));
    SUPPORT_MEDIA.put("music", Arrays.asList(
            "audio/mpeg"));
*/

        SUPPORT_SUFFER.add("png");
        SUPPORT_MEDIA.put("png","image/png");
        SUPPORT_SUFFER.add("ico");
        SUPPORT_MEDIA.put("ico","image/x-icon");
        SUPPORT_SUFFER.add("jpeg");
        SUPPORT_MEDIA.put("jpeg","image/jpeg");
        SUPPORT_SUFFER.add("jpg");
        SUPPORT_MEDIA.put("jpg","image/jpeg");

        SUPPORT_SUFFER.add("doc");
        SUPPORT_MEDIA.put("doc","application/msword");
        SUPPORT_SUFFER.add("docx");
        SUPPORT_MEDIA.put("docx","application/vnd.openxmlformats-officedocument.wordprocessingml.document");
        SUPPORT_SUFFER.add("xls");
        SUPPORT_MEDIA.put("xls","application/vnd.ms-excel");
        SUPPORT_SUFFER.add("xlsx");
        SUPPORT_MEDIA.put("xlsx","application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        SUPPORT_SUFFER.add("ppt");
        SUPPORT_MEDIA.put("ppt","application/vnd.ms-powerpoint");
        SUPPORT_SUFFER.add("pptx");
        SUPPORT_MEDIA.put("pptx","application/vnd.openxmlformats-officedocument.presentationml.presentation");
        SUPPORT_SUFFER.add("pdf");
        SUPPORT_MEDIA.put("pdf","application/pdf");
        SUPPORT_SUFFER.add("txt");
        SUPPORT_MEDIA.put("txt","text/plain");

        SUPPORT_SUFFER.add("mp3");
        SUPPORT_MEDIA.put("mp3","audio/mpeg");

        SUPPORT_SUFFER.add("mp4");
        SUPPORT_MEDIA.put("mp4","video/mp4");

        SUPPORT_SUFFER.add("rar");
        SUPPORT_MEDIA.put("rar","application/rar");
        SUPPORT_SUFFER.add("zip");
        SUPPORT_MEDIA.put("zip","application/zip");
    }

    public static Map<String, String> getSupportType(){
        return SUPPORT_MEDIA;
    }

    public static List<String> getSupportSuffer(){
        return SUPPORT_SUFFER;
    }
}
