package com.ruoyi.template.utils;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class TemplatesUtil {

    private static final Logger log = LoggerFactory.getLogger(TemplatesUtil.class);
    private static String pl = "\\$\\{\\w+\\}";

    /**
     * 
     * @param template 模板
     * @param params   参数
     * @return
     */
    public static String processTemplate(String template, Map<String, Object> params) {
        if (template == null || params == null)
            return null;
        StringBuffer sb = new StringBuffer();
        Matcher m = Pattern.compile(pl).matcher(template);
        while (m.find()) {
            String param = m.group();
            Object value = params.get(param.substring(2, param.length() - 1));
            m.appendReplacement(sb, value == null ? "" : value.toString());
        }
        m.appendTail(sb);
        return sb.toString();
    }

    /**
     * 
     * @param htmlString 文件内容
     * @param path       生成路径
     * @return
     */
    public static void saveHtml(String htmlString, String path) {
        // 生成的文件路径
        File file = new File(path);
        if (!file.exists()) {
            file.getParentFile().mkdirs();
        }
        try {
            file.createNewFile();
            OutputStreamWriter fw = new OutputStreamWriter(new FileOutputStream(file), "UTF-8");
            BufferedWriter bw = new BufferedWriter(fw);
            bw.write(htmlString);
            bw.flush();
            bw.close();
            fw.close();
            log.info("文件写入成功!路径为：" + file.getPath());
        } catch (IOException e) {
            log.info("文件写入失败!" + e.getMessage());
        }
    }

}
