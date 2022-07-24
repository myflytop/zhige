package com.oly.cms.common.utils;

import java.util.Arrays;
import java.util.Objects;

public class ClassToUrlUtils {
    /**
     * 实体类对象转URL参
     * 
     * @param t         实体类对象
     * @param callSuper 是否转换父类成员
     * @param <T>       实体类泛型
     * @return a=1&b=2
     */
    public static <T> String entityToUrlParam(T t, boolean callSuper) {
        // URL 参数存储器
        StringBuffer urlParam = new StringBuffer();
        // 扩展转换父类成员功能
        entitySuperclassToUrlParam(t, t.getClass(), callSuper, urlParam);
        if (urlParam.length() > 0) {
            // 去除最后一个&字符
            urlParam.deleteCharAt(urlParam.length() - 1);
        }
        return urlParam.toString();
    }

    /**
     * 实体类对象转URL参
     * 
     * @param t         实体类对象
     * @param clazz     实体类类型
     * @param callSuper 是否转换父类成员
     * @param urlParam  URL 参数存储器
     * @param <T>       实体类泛型
     * @return a=1&b=2
     */
    public static <T> void entitySuperclassToUrlParam(T t, Class clazz, boolean callSuper, StringBuffer urlParam) {
        // 如果实体类对象为Object类型，则不处理
        if (!clazz.equals(Object.class)) {
            // 获取实体类对象下的所有成员，并保存到 URL 参数存储器中
            Arrays.stream(clazz.getDeclaredFields()).forEach(field -> {
                // 设置可以操作私有成员
                field.setAccessible(true);
                try {
                    // 获取成员值
                    Object value = field.get(t);
                    // 成员值为 Null 时，则不处理
                    if (Objects.nonNull(value)) {
                        urlParam.append(field.getName()).append("=").append(value).append("&");
                    }
                } catch (IllegalAccessException e) {
                    e.printStackTrace();
                }
            });
            // 是否转换父类成员
            if (callSuper) {
                // 获取父类类型
                clazz = clazz.getSuperclass();
                // 递归调用，获取父类的处理结果
                entitySuperclassToUrlParam(t, clazz, callSuper, urlParam);
            }
        }
    }

}
