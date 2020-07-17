package com.ruoyi;

import com.ruoyi.common.constant.RuoYiConstants;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

/**
 * 启动程序
 * 
 * @author ruoyi
 */
@SpringBootApplication(exclude = { DataSourceAutoConfiguration.class })
public class RuoYiApplication extends SpringBootServletInitializer {
    public static void main(String[] args)
    {
        //自定义配置文件位置,用户工作目录下workDir
        System.setProperty("spring.config.additional-location","file:${user.home}"+ RuoYiConstants.workDir +"/,file:${user.home}/halo-dev/");
        // System.setProperty("spring.devtools.restart.enabled", "false");
        SpringApplication.run(RuoYiApplication.class, args);
        System.out.println("(♥◠‿◠)ﾉﾞ  若依启动成功   ლ(´ڡ`ლ)ﾞ  \n" +
                " .-------.       ____     __        \n" +
                " |  _ _   \\      \\   \\   /  /    \n" +
                " | ( ' )  |       \\  _. /  '       \n" +
                " |(_ o _) /        _( )_ .'         \n" +
                " | (_,_).' __  ___(_ o _)'          \n" +
                " |  |\\ \\  |  ||   |(_,_)'         \n" +
                " |  | \\ `'   /|   `-'  /           \n" +
                " |  |  \\    /  \\      /           \n" +
                " ''-'   `'-'    `-..-'              ");
    }

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        //自定义配置文件位置,用户工作目录下workDir
        System.setProperty("spring.config.additional-location", "file:${user.home}"+ RuoYiConstants.workDir +"/,file:${user.home}/halo-dev/");
        return application.sources(RuoYiApplication.class);
    }
}