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
        String path = ("file:" + RuoYiConfig.getWorkPath() + "/" + OlyStageRoot.THEME_DIR.getDir() + "/").replace("\\",
                "/");
        /** 主题静态资源配置 */
        registry.addResourceHandler("/themes/**").addResourceLocations(path);
        registry.addResourceHandler("/site/**")
                .addResourceLocations("file:" + RuoYiConfig.getWorkPath() + "/" + OlyStageRoot.SITE_DIR.getDir() + "/");
        registry.addResourceHandler("/robots.txt")
                .addResourceLocations("file:" + RuoYiConfig.getWorkPath() + "/" + OlyStageRoot.SITE_DIR.getDir() + "/");
        /** 主题静态资源配置 */
        // registry.addResourceHandler("/themes/**").addResourceLocations("classpath:/templates/themes/");

    }

}