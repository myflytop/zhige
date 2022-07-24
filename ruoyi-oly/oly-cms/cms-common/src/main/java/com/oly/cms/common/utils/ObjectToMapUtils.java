package com.oly.cms.common.utils;

import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.Map;

import com.ruoyi.common.utils.StringUtils;

public class ObjectToMapUtils {
    public static Map<String, Object> objToMap(Object obj) throws IllegalArgumentException, IllegalAccessException {
        Class<?> clazz = obj.getClass();
        Map<String, Object> map = new HashMap<>();
        Field[] fields = clazz.getDeclaredFields();
        for (Field field : fields) {
            field.setAccessible(true);
            String fieldName = field.getName();
            Object value = StringUtils.nvl(field.get(obj), "");
            map.put(fieldName, value);
        }
        return map;
    }

}
