package com.ruoyi.common.utils.uuid;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * ID生成器工具类
 * 
 * @author ruoyi
 */
public class IdUtils {
    /**
     * 获取随机UUID
     * 
     * @return 随机UUID
     */
    public static String randomUUID() {
        return UUID.randomUUID().toString();
    }

    /**
     * 简化的UUID，去掉了横线
     * 
     * @return 简化的UUID，去掉了横线
     */
    public static String simpleUUID() {
        return UUID.randomUUID().toString(true);
    }

    /**
     * 获取随机UUID，使用性能更好的ThreadLocalRandom生成UUID
     * 
     * @return 随机UUID
     */
    public static String fastUUID() {
        return UUID.fastUUID().toString();
    }

    /**
     * 简化的UUID，去掉了横线，使用性能更好的ThreadLocalRandom生成UUID
     * 
     * @return 简化的UUID，去掉了横线
     */
    public static String fastSimpleUUID() {
        return UUID.fastUUID().toString(true);
    }

    /**
     * 依据给定字符 返回16位数字字符
     * 
     * @param surcoreStr
     * @return
     */
    public static String getMd5(String surcoreStr) {
        byte[] surcore = surcoreStr.getBytes(StandardCharsets.UTF_8);
        char hexDigits[] = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9' };
        String s = null;
        MessageDigest md;
        try {
            md = MessageDigest.getInstance("MD5");
            md.update(surcore);
            byte tem[] = md.digest();
            char str[] = new char[16];
            int k = 0;
            for (int i = 0; i < 16; i++) {
                byte byte0 = tem[i];
                str[k++] = hexDigits[(byte0 >>> 4 & 0xf) % 10];
            }
            s = new String(str);
        } catch (NoSuchAlgorithmException e) {
        }
        return s;
    }

}
