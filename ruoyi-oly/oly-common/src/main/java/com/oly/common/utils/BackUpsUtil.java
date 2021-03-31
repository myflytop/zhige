package com.oly.common.utils;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class BackUpsUtil {
    private static final Logger log = LoggerFactory.getLogger(BackUpsUtil.class);
 /**
* 备份
*
* @param savePath       备份文件保存目录
* @param hostIP         需要备份的数据库所在服务器IP
* @param databaseName   需要备份的数据库名称
* @param username       需要备份的数据库登录账号
* @param password       需要备份的数据库登录密码
*/
public static void backUps(String savePath, String hostIP, String databaseName, String username, String password) {
   File saveFile = new File(savePath);
   if (!saveFile.exists()) {
       saveFile.mkdirs();
   }
   if (!savePath.endsWith(File.separator)) {
       savePath = savePath + File.separator;
   }

   PrintWriter printWriter = null;
   BufferedReader bufferedReader = null;
   try {
       printWriter = new PrintWriter(new OutputStreamWriter(new FileOutputStream(savePath + databaseName + ".sql"), "utf8"));
       Process process = Runtime.getRuntime().exec("mysqldump -h" + hostIP + " -u" + username + " -p" + password+ " --set-charset=UTF8 " + databaseName);
       InputStreamReader inputStreamReader = new InputStreamReader(process.getInputStream(), "utf8");
       bufferedReader = new BufferedReader(inputStreamReader);
       String line;
       while ((line = bufferedReader.readLine()) != null) {
           printWriter.println(line);
       }
       printWriter.flush();
       try {
           //0 表示线程正常终止。
           if (process.waitFor() == 0) {
              log.info("数据库备份成功!");
           }
       } catch (InterruptedException e) {
        log.info("数据库备份失败!"+e.getMessage());
           
       }
   } catch (IOException e) {
    log.info("数据库备份失败!");
      
   } finally {
       try {
           if (bufferedReader != null) {
               bufferedReader.close();
           }
           if (printWriter != null) {
               printWriter.close();
           }
       } catch (IOException e) {
        log.info("数据库备份失败!");
          
       }
   }
}   
}
