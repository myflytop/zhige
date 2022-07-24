package com.oly.cms.general.config;

import java.lang.reflect.Method;
import java.net.URI;
import java.net.URL;
import java.util.Date;
import java.util.Locale;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;

import org.apache.commons.lang3.ClassUtils;
import org.springframework.cache.interceptor.KeyGenerator;
import org.springframework.stereotype.Component;

@Component
public class MyKeyGenerator implements KeyGenerator {

    @Override
    public Object generate(Object target, Method method, Object... params) {

        StringBuilder strBuilder = new StringBuilder(30);
        // 类名
        strBuilder.append(target.getClass().getCanonicalName());
        strBuilder.append('.');
        // 方法名
        strBuilder.append(method.getName());

        if (params.length > 0) {
            // 参数值
            for (Object object : params) {
                strBuilder.append('_');
                try {
                    if (isSimpleValueType(object.getClass())) {
                        strBuilder.append(object);
                    } else {
                        strBuilder.append(toJson(object).hashCode());
                    }
                } catch (Exception e) {

                }

            }
        }
        return strBuilder.toString();
    }

    /**
     * 判断是否是简单值类型.包括：基础数据类型、CharSequence、Number、Date、URL、URI、Locale、Class;
     *
     * @param clazz
     * @return
     */
    public static boolean isSimpleValueType(Class<?> clazz) {
        return (ClassUtils.isPrimitiveOrWrapper(clazz) || clazz.isEnum() || CharSequence.class.isAssignableFrom(clazz)
                || Number.class.isAssignableFrom(clazz) || Date.class.isAssignableFrom(clazz) || URI.class == clazz
                || URL.class == clazz || Locale.class == clazz || Class.class == clazz);
    }

    /**
     * Java对象序列化为JSON字符串
     *
     * @param obj Java对象
     * @return json字符串
     */
    public static String toJson(Object obj) {
        return JSON.toJSONString(obj, SerializerFeature.WriteMapNullValue);
    }

}
