package com.oly.cms.admin.utils;

import java.io.File;
import java.io.FileNotFoundException;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.common.enums.OlyStageRoot;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.file.FileUtils;
import com.ruoyi.oss.domain.OlyOss;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.io.FileUtil;
import cn.hutool.core.util.CharsetUtil;
import cn.hutool.core.util.ZipUtil;

public class CmsUtils {

    private static final Logger log = LoggerFactory.getLogger(CmsUtils.class);

    /**
     * 删除主题
     * 
     * @param themeName
     * @return
     * @throws FileNotFoundException
     */
    public static boolean deleteThemeFile(String themeName) throws FileNotFoundException {
        File file = Paths.get(OlyStageRoot.THEME_DIR.getRoot(themeName)).toFile();
        if (file.exists()) {
            return deleteDir(file);
        } else {
            return true;
        }

    }

    /**
     * 递归删除目录下的所有文件及子目录下所有文件
     * 
     * @param dir 将要删除的文件目录
     * @return boolean Returns "true" if all deletions were successful. If a
     *         deletion fails, the method stops attempting to delete and returns
     *         "false".
     */
    private static boolean deleteDir(File dir) {
        if (dir.isDirectory()) {
            String[] children = dir.list();
            // 递归删除目录中的子目录下
            for (int i = 0; i < children.length; i++) {
                boolean success = deleteDir(new File(dir, children[i]));
                if (!success) {
                    return false;
                }
            }
        }
        // 目录此时为空，可以删除
        return dir.delete();
    }

    public static List<String> listThemeNames() {
        File f = Paths.get(OlyStageRoot.THEME_DIR.getRoot("")).toFile();
        if (f.exists() && f.isDirectory()) {
            File[] files = f.listFiles();
            List<String> listThemeNames = new ArrayList<>();
            for (File file : files) {
                if (file.isDirectory()) {
                    listThemeNames.add(file.getName());
                }
            }
            return listThemeNames;
        }
        return null;
    }

    public static List<OlyOss> listBackThemes() {
        File f = Paths.get(OlyStageRoot.BACK_DIR.getRoot(OlyStageRoot.THEME_DIR.getValue())).toFile();
        List<OlyOss> listThemes = new ArrayList<>();
        if (f.exists() && f.isDirectory()) {
            File[] files = f.listFiles();
            for (File file : files) {
                if (!file.isDirectory()) {
                    OlyOss olyOss = new OlyOss();
                    olyOss.setFileName(file.getName());
                    olyOss.setUpdateTime(DateUtil.date(file.lastModified()));
                    olyOss.setSize(file.length());
                    listThemes.add(olyOss);
                }
            }
        }
        return listThemes;
    }

    public static void backUpTheme(String themeName) {
        String backPath = Paths.get(OlyStageRoot.THEME_DIR.getRoot(themeName)).toString();
        String savePath = Paths.get(OlyStageRoot.BACK_DIR.getRoot(OlyStageRoot.THEME_DIR.getValue()),
                themeName + "_" + DateUtils.dateTimeNow() + ".zip").toString();
        ZipUtil.zip(backPath, savePath, CharsetUtil.systemCharset(), true);
    }

    public static void removeBackTheme(String themeName) {
        File file = Paths.get(OlyStageRoot.BACK_DIR.getRoot(OlyStageRoot.THEME_DIR.getValue()), themeName).toFile();
        FileUtil.del(file);

    }

    public static void downloadBackTheme(String themeName, HttpServletResponse response, HttpServletRequest request) {
        try {
            String filePath = Paths.get(OlyStageRoot.BACK_DIR.getRoot(OlyStageRoot.THEME_DIR.getValue()), themeName)
                    .toString();
            response.setContentType(MediaType.APPLICATION_OCTET_STREAM_VALUE);
            FileUtils.setAttachmentResponseHeader(response, themeName);
            FileUtils.writeBytes(filePath, response.getOutputStream());
        } catch (Exception e) {
            log.error("下载文件失败", e);
        }
    }

}
