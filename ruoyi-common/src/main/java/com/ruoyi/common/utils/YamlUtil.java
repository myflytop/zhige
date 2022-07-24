package com.ruoyi.common.utils;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.beans.factory.config.YamlMapFactoryBean;
import org.springframework.beans.factory.config.YamlPropertiesFactoryBean;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.FileSystemResource;
import org.yaml.snakeyaml.DumperOptions;
import org.yaml.snakeyaml.Yaml;

/**
 * 配置处理工具类
 * 
 * @author yml
 */
public class YamlUtil {
    public static Map<?, ?> loadYaml(String fileName) throws FileNotFoundException {
        InputStream in = YamlUtil.class.getClassLoader().getResourceAsStream(fileName);
        return StringUtils.isNotEmpty(fileName) ? (LinkedHashMap<?, ?>) new Yaml().load(in) : null;
    }

    public static void dumpYaml(String fileName, Map<?, ?> map) throws IOException {
        if (StringUtils.isNotEmpty(fileName)) {
            FileWriter fileWriter = new FileWriter(YamlUtil.class.getResource(fileName).getFile());
            DumperOptions options = new DumperOptions();
            options.setDefaultFlowStyle(DumperOptions.FlowStyle.BLOCK);
            Yaml yaml = new Yaml(options);
            yaml.dump(map, fileWriter);
        }
    }

    public static Object getProperty(Map<?, ?> map, Object qualifiedKey) {
        if (map != null && !map.isEmpty() && qualifiedKey != null) {
            String input = String.valueOf(qualifiedKey);
            if (!"".equals(input)) {
                if (input.contains(".")) {
                    int index = input.indexOf(".");
                    String left = input.substring(0, index);
                    String right = input.substring(index + 1, input.length());
                    return getProperty((Map<?, ?>) map.get(left), right);
                } else if (map.containsKey(input)) {
                    return map.get(input);
                } else {
                    return null;
                }
            }
        }
        return null;
    }

    @SuppressWarnings("unchecked")
    public static void setProperty(Map<?, ?> map, Object qualifiedKey, Object value) {
        if (map != null && !map.isEmpty() && qualifiedKey != null) {
            String input = String.valueOf(qualifiedKey);
            if (!input.equals("")) {
                if (input.contains(".")) {
                    int index = input.indexOf(".");
                    String left = input.substring(0, index);
                    String right = input.substring(index + 1, input.length());
                    setProperty((Map<?, ?>) map.get(left), right, value);
                } else {
                    ((Map<Object, Object>) map).put(qualifiedKey, value);
                }
            }
        }
    }

    /**
     * 
     * @param prefix 支持a 不支持a.b
     * @param path
     * @return
     */
    public static Object yamlMapByResources(String prefix, String path) {
        YamlMapFactoryBean yamMap = new YamlMapFactoryBean();
        ClassPathResource reourcesPath = new ClassPathResource(path);
        yamMap.setResources(reourcesPath);
        return yamMap.getObject().get(prefix);
    }

    /**
     * 
     * @param prefix 支持 a.b|a
     * @param path
     * @return
     */
    public static Object yamlPropertiesByResources(String prefix, String path) {
        YamlPropertiesFactoryBean yamMap = new YamlPropertiesFactoryBean();
        ClassPathResource reourcesPath = new ClassPathResource(path);
        yamMap.setResources(reourcesPath);
        return yamMap.getObject().get(prefix);
    }

    /**
     * 
     * @param prefix 支持a 不支持a.b
     * @param file
     * @return
     */
    public static Object yamlMapByFile(String prefix, File file) {
        YamlMapFactoryBean yamMap = new YamlMapFactoryBean();
        FileSystemResource fileResource = new FileSystemResource(file);
        yamMap.setResources(fileResource);
        return yamMap.getObject().get(prefix);
    }

    /**
     * 
     * @param prefix 支持 a.b|a
     * @param file
     * @return
     */
    public static Object yamlPropertiesByFile(String prefix, File file) {
        YamlPropertiesFactoryBean yamMap = new YamlPropertiesFactoryBean();
        FileSystemResource fileResource = new FileSystemResource(file);
        yamMap.setResources(fileResource);
        return yamMap.getObject().get(prefix);
    }

}