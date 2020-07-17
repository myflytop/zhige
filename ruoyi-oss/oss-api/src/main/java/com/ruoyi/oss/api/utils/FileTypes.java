package com.ruoyi.oss.api.utils;

import org.apache.tika.Tika;
import org.springframework.http.MediaType;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;

/**
 * 文本：text ，（doc docx）， （xls xlsx），（ ppt pptx）， pdf
 * 音乐：mp3
 * 视频：mp4
 * 压缩：zip，rar
 * 图片：png，jpg，jpge
 */
public class FileTypes {

public static  String getSuffex(String fileName,int index){

    return fileName.substring(index+1);

}

    public static  String getSuffex(String fileName){

        return fileName.substring(fileName.lastIndexOf(".")+1);

    }
    public static  String getPreifx(String fileName,int index){

        return fileName.substring(0,index);

    }
    public static  boolean includeDot(String fileName){

        return fileName.contains(".");

    }

    public static  boolean getImg(String fileName){
        String suffix=getSuffex(fileName);
        return "png".equalsIgnoreCase(suffix)||"jpeg".equalsIgnoreCase(suffix)||"jpg".equalsIgnoreCase(suffix);

    }

     public static String getFileHeader(InputStream stream) throws IOException {
         Tika tika = new Tika();
         return tika.detect(stream);
     }

    public static String endWidth(String fileDir) {
        if (fileDir == null) {
            fileDir = "/";
        }
        if (!fileDir.endsWith("/")) {
            fileDir += "/";
        }
        return fileDir;
    }


     public static String getSmPath(String fileName,String smSuffix){
    int index =fileName.lastIndexOf(".");
    return getPreifx(fileName,index)+smSuffix+"."+getSuffex(fileName,index);
     }
    public static String getFileType(String suffix) {
        String type;
        // 获取文件图标
        if ("ppt".equalsIgnoreCase(suffix) || "pptx".equalsIgnoreCase(suffix)) {
            type = "ppt";
        } else if ("doc".equalsIgnoreCase(suffix) || "docx".equalsIgnoreCase(suffix)) {
            type = "doc";
        } else if ("xls".equalsIgnoreCase(suffix) || "xlsx".equalsIgnoreCase(suffix)) {
            type = "xls";
        } else if ("pdf".equalsIgnoreCase(suffix)) {
            type = "pdf";
        }  else if ("txt".equalsIgnoreCase(suffix)) {
            type = "txt";
        }  else if ("zip".equalsIgnoreCase(suffix) || "rar".equalsIgnoreCase(suffix)) {
            type = "zip";
        } else if ("mp3".equalsIgnoreCase(suffix)) {
            type = "mp3";
        } else if ("mp4".equalsIgnoreCase(suffix)) {
            type = "mp4";
        }
        else if ("png".equalsIgnoreCase(suffix)||"jpeg".equalsIgnoreCase(suffix)||"jpg".equalsIgnoreCase(suffix)||"ico".equalsIgnoreCase(suffix)) {
            type = "img";
        } else {
            type = "dir";
        }
        return type;
    }



    public static void main(String[] args) throws Exception {

        //assume example.mp3 is in your current directory
       File file = new File("C:\\Users\\huazh\\Downloads\\若依环境使用手册.docx");//

        //Instantiating tika facade class
      Tika tika = new Tika();

        //detecting the file type using detect method
     String filetype = tika.detect(file);
       // System.out.println(filetype);
        System.out.println(includeDot("."));
    }//原文出自【易百教程】，商业转载请联系作者获得授权，非商业请保留原文链接：https://www.yiibai.com/tika/tika_document_type_detection.html?app=post



}
