package com.oly.cms.system.utils;

import java.io.File;
import java.io.FileNotFoundException;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import com.ruoyi.common.config.RuoYiConfig;
import com.ruoyi.common.enums.OlyStageRoot;

public class CmsUtils {

    /**
     * 删除主题
     * 
     * @param themeName
     * @return
     * @throws FileNotFoundException
     */
    public static boolean deleteThemeFile(String themeName) throws FileNotFoundException {
        File file = Paths.get(RuoYiConfig.getWorkPath(), OlyStageRoot.THEME_DIR.getDir(), themeName).toFile();
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
        File f = Paths.get(RuoYiConfig.getWorkPath(), OlyStageRoot.THEME_DIR.getDir()).toFile();
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
}
