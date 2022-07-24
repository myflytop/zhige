package com.oly.cms.web.config;

import javax.annotation.PostConstruct;

import com.ruoyi.common.enums.OlyStageRoot;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.thymeleaf.spring5.SpringTemplateEngine;
import org.thymeleaf.templatemode.TemplateMode;
import org.thymeleaf.templateresolver.ClassLoaderTemplateResolver;
import org.thymeleaf.templateresolver.FileTemplateResolver;

/**
 * 加载任意目录模板
 */
@Configuration
public class ThymeleafConfigration {
    @Autowired
    private SpringTemplateEngine templateEngine;

    /**
     * 加载任意目录模板
     */
    @PostConstruct
    public void extension() {
        FileTemplateResolver resolver = new FileTemplateResolver();
        // 模板位置
        resolver.setPrefix(OlyStageRoot.THEME_DIR.getRoot("") + "/");
        resolver.setSuffix(".html");
        resolver.setTemplateMode(TemplateMode.HTML);
        resolver.setOrder(2);
        resolver.setCacheable(false);
        resolver.setCharacterEncoding(("UTF-8"));
        templateEngine.addTemplateResolver(resolver);
    }

    /**
     * ClassLoader加载
     */
    @Bean
    public ClassLoaderTemplateResolver thirdTemplateResolver() {
        ClassLoaderTemplateResolver templateResolver = new ClassLoaderTemplateResolver();
        templateResolver.setPrefix("templates/themes/");
        templateResolver.setSuffix(".html");
        templateResolver.setTemplateMode(TemplateMode.HTML);
        templateResolver.setCharacterEncoding("UTF-8");
        // 越小优先级别越高
        templateResolver.setOrder(2);
        templateResolver.setCheckExistence(true);
        return templateResolver;
    }

    // @Bean
    // public SpringResourceTemplateResolver firstTemplateResolver() {
    // SpringResourceTemplateResolver templateResolver = new
    // SpringResourceTemplateResolver();
    // templateResolver.setPrefix("file:////"+RuoYiConfig.getWorkPath()+"/themes/");
    // templateResolver.setSuffix(".html");
    // templateResolver.setTemplateMode(TemplateMode.HTML);
    // templateResolver.setCharacterEncoding("UTF-8");
    // templateResolver.setOrder(0);
    // templateResolver.setCheckExistence(true);
    // templateResolver.setCacheable(false);
    // System.out.println("+++++++{PPPPPPPPPPPPPPPPPPPPPPPPPP");
    // return templateResolver;
    // }

    // @Bean
    // public ClassLoaderTemplateResolver secondTemplateResolver() {
    // ClassLoaderTemplateResolver templateResolver = new
    // ClassLoaderTemplateResolver();
    // templateResolver.setPrefix("file:////"+RuoYiConfig.getWorkPath()+"/themes/");
    // templateResolver.setSuffix(".html");
    // templateResolver.setTemplateMode(TemplateMode.HTML);
    // templateResolver.setCharacterEncoding("UTF-8");
    // templateResolver.setOrder(0);
    // templateResolver.setCheckExistence(true);
    // templateResolver.setCacheable(false);
    // System.out.println("+++++++{PPPPPPPPPPPPPPPPPPPPPPPPPP");
    // return templateResolver;

    // }

}