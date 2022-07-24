package com.ruoyi.oss.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Paths;

import javax.servlet.http.HttpServletResponse;

import com.ruoyi.common.enums.OlyStageRoot;
import com.ruoyi.common.utils.file.FileUtils;

import org.apache.tika.Tika;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/oss")
public class OlyOssLocalController {
    private static final Logger log = LoggerFactory.getLogger(OlyOssLocalController.class);

    /**
     * 
     * @param f        文件夹
     * @param y        年
     * @param m        月
     * @param d        日
     * @param filename 文件名
     * @param response
     */
    @GetMapping("/download/{f}/{y}/{m}/{d}/{file:.+}")
    public void download(@PathVariable("f") String f, @PathVariable("y") String y, @PathVariable("m") String m,
            @PathVariable("d") String d, @PathVariable("file") String filename, HttpServletResponse response) {

        outputFile(Paths.get(OlyStageRoot.UPLOAD_DIR.getRoot(""), f, y, m, d, filename).toString(), response);
    }

   /**
    * 头像请求地址
    * @param y
    * @param m
    * @param d
    * @param filename
    * @param response
    */
    @GetMapping("/download/avatar/{y}/{m}/{d}/{file:.+}")
    public void download(@PathVariable("y") String y, @PathVariable("m") String m, @PathVariable("d") String d,
            @PathVariable("file") String filename, HttpServletResponse response) {
        outputFile(Paths.get(OlyStageRoot.HEARD_DIR.getRoot(""), y, m, d, filename).toString(), response);
    }

    // 输出文件流
    private void outputFile(String fileDir, HttpServletResponse response) {
        // 判断文件是否存在
        File inFile = new File(fileDir);
        PrintWriter writer = null;
        if (!inFile.exists() || !inFile.isFile()) {
            try {
                response.setContentType("text/html;charset=UTF-8");
                writer = response.getWriter();
                writer.write(
                        "<!doctype html><title>404 Not Found</title><h1 style=\"text-align: center\">404 Not Found</h1><hr/><p style=\"text-align: center\">Oss File Server</p>");
                writer.flush();
            } catch (IOException e) {
                log.error("下载文件失败", e);
            }
            return;
        }
        // 获取文件类型
        String contentType = "application/force-download";
        try {
            contentType = new Tika().detect(inFile);
        } catch (IOException e) {
            log.error("获取contentType失败", e.getMessage());
        }
        response.setContentType(contentType);
        try {
            FileUtils.setAttachmentResponseHeader(response, inFile.getName());
            FileUtils.writeBytes(fileDir, response.getOutputStream());
        } catch (IOException e) {
            log.error("下载文件失败", e);
        }

    }

}
