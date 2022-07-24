package com.oly.cms.web.config;

import com.ruoyi.common.enums.OlyStageRoot;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

        @Override
        public void addResourceHandlers(ResourceHandlerRegistry registry) {
                String path = ("file:" + OlyStageRoot.THEME_DIR.getRoot("") + "/").replace("\\", "/");
                /** 主题静态资源配置 */
                registry.addResourceHandler("/themes/**").addResourceLocations("classpath:/templates/themes/")
                                .addResourceLocations(path);
        }

}