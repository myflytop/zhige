package com.oly.oss.utils;

import org.apache.tika.Tika;
import java.io.IOException;
import java.io.InputStream;

/**
 * 文本：text ，（doc docx）， （xls xlsx），（ ppt pptx）， pdf 音乐：mp3 视频：mp4 压缩：zip，rar
 * 图片：png，jpg，jpge
 */
public class FileTypes {

    public static String getSuffex(String fileName, int index) {

        return fileName.substring(index + 1);

    }

    public static String getSuffex(String fileName) {

        return fileName.substring(fileName.lastIndexOf(".") + 1);

    }

    public static String getPreifx(String fileName, int index) {

        return fileName.substring(0, index);

    }

    public static boolean includeDot(String fileName) {

        return fileName.contains(".");

    }

    public static boolean getImg(String suffix) {

        return "png".equalsIgnoreCase(suffix) || "jpeg".equalsIgnoreCase(suffix) || "jpg".equalsIgnoreCase(suffix);

    }

    /**
     * 获取文件头 如图片png :获取到的为 image/png
     * 
     * @param stream
     * @return
     * @throws IOException
     */
    public static String getFileHeader(InputStream stream) throws IOException {
        Tika tika = new Tika();
        String hString = tika.detect(stream);
        stream.close();
        return hString;
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

    public static String getSmPath(String fileName, String smSuffix) {
        int index = fileName.lastIndexOf(".");
        return smSuffix + getPreifx(fileName, index) + "." + getSuffex(fileName, index);
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
        } else if ("txt".equalsIgnoreCase(suffix)) {
            type = "txt";
        } else if ("zip".equalsIgnoreCase(suffix) || "rar".equalsIgnoreCase(suffix)) {
            type = "zip";
        } else if ("mp3".equalsIgnoreCase(suffix)) {
            type = "mp3";
        } else if ("mp4".equalsIgnoreCase(suffix)) {
            type = "mp4";
        } else if ("png".equalsIgnoreCase(suffix) || "jpeg".equalsIgnoreCase(suffix) || "jpg".equalsIgnoreCase(suffix)
                || "ico".equalsIgnoreCase(suffix)) {
            type = "img";
        } else {
            type = "dir";
        }
        return type;
    }

}
