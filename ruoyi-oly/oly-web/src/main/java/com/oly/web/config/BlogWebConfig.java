package com.oly.web.config;

import com.ruoyi.common.config.RuoYiConfig;
import com.ruoyi.common.enums.OlyStageRoot;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class BlogWebConfig implements WebMvcConfigurer {

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {

        /** 主题静态资源配置 */
        registry.addResourceHandler("/themes/**").addResourceLocations(
        "file:" + RuoYiConfig.getWorkPath() + "/" +
        OlyStageRoot.THEME_DIR.getDir() + "/");
        /** 主题静态资源配置 */
        // registry.addResourceHandler("/themes/**").addResourceLocations("classpath:/templates/themes/");

    }

}