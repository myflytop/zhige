package com.ruoyi;
import com.ruoyi.common.config.RuoYiConfig;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.ComponentScan;

/**
 * 启动程序
 * 
 * @author ruoyi
 */
@SpringBootApplication(exclude = { DataSourceAutoConfiguration.class })
@ComponentScan(basePackages = { "com.ruoyi", "com.oly" })
@EnableCaching
public class RuoYiApplication {
    public static void main(String[] args) {
        // System.setProperty("spring.devtools.restart.enabled", "false");
        // 可覆盖spring boot 配置文件的配置
        System.setProperty("spring.config.additional-location", "file:"+RuoYiConfig.getWorkPath()+"/");
        SpringApplication.run(RuoYiApplication.class, args);
        System.out.println("(♥◠‿◠)ﾉﾞ  止戈启动成功   ლ(´ڡ`ლ)ﾞ  \n" + " .-------.       ____     __        \n"
                + " |  _ _   \\      \\   \\   /  /    \n" + " | ( ' )  |       \\  _. /  '       \n"
                + " |(_ o _) /        _( )_ .'         \n" + " | (_,_).' __  ___(_ o _)'          \n"
                + " |  |\\ \\  |  ||   |(_,_)'         \n" + " |  | \\ `'   /|   `-'  /           \n"
                + " |  |  \\    /  \\      /           \n" + " ''-'   `'-'    `-..-'              ");
    }
} 