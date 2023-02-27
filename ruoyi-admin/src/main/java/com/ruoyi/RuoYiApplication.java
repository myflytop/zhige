package com.ruoyi;

import java.io.File;
import java.nio.file.Paths;
import com.ruoyi.common.config.RuoYiConfig;
import com.ruoyi.common.enums.OlyStageRoot;
import com.ruoyi.common.utils.YamlUtil;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.ComponentScan;
import cn.hutool.core.util.BooleanUtil;

/**
 * 启动程序
 * 
 * @author ruoyi
 */
@SpringBootApplication(exclude = { DataSourceAutoConfiguration.class })
@ComponentScan(basePackages = { "com.ruoyi", "com.oly" })
@EnableCaching
public class RuoYiApplication {
    static {
        // 覆盖默认文件配置位置
        File ymlFile = Paths.get(RuoYiConfig.getUserWork(), "config", "application.yml").toFile();
        String workPath = null;
        boolean appointProfile;
        // 如果使用默认配置
        if (ymlFile.exists() && ymlFile.isFile()) {
            workPath = YamlUtil.yamlPropertiesByFile("zg.profile", ymlFile).toString();
            appointProfile = BooleanUtil
                    .toBoolean(YamlUtil.yamlPropertiesByFile("zg.appointProfile", ymlFile).toString());
            // 覆盖默认配置
            System.setProperty("spring.config.additional-location", "file:" + ymlFile.getParent() + File.separator);
        } else {
            workPath = YamlUtil.yamlPropertiesByResources("zg.profile", "application.yml").toString();
            appointProfile = BooleanUtil.toBoolean(
                    YamlUtil.yamlPropertiesByResources("zg.appointProfile", "application.yml").toString());
        }
        if (!appointProfile) {
            workPath = Paths.get(RuoYiConfig.getUserWork(), workPath).toString();
        }
        // 日志路径
        System.setProperty("log_path", Paths.get(workPath, OlyStageRoot.LOGS_DIR.getValue()).toString());
        // 临时目录
        System.setProperty("tmp_path", Paths.get(workPath, OlyStageRoot.TMP_DIR.getValue()).toString());
        // 缓存目录
        System.setProperty("cache_path", Paths.get(workPath, OlyStageRoot.CACHE_DIR.getValue()).toString());
    }

    public static void main(String[] args) {
        SpringApplication.run(RuoYiApplication.class, args);
        System.out.println(
                "ZZZZZZZZZZZZZZZZZZZ        GGGGGGGGGGGGG\n"
                        + "Z:::::::::::::::::Z     GGG::::::::::::G\n"
                        + "Z:::::::::::::::::Z   GG:::::::::::::::G\n"
                        + "Z:::ZZZZZZZZ:::::Z   G:::::GGGGGGGG::::G\n"
                        + "ZZZZZ     Z:::::Z   G:::::G       GGGGGG\n"
                        + "        Z:::::Z    G:::::G              \n"
                        + "   止  Z:::::Z     G:::::G      戈       \n"
                        + "      Z:::::Z      G:::::G    GGGGGGGGGG\n"
                        + "     Z:::::Z       G:::::G    G::::::::G\n"
                        + "    Z:::::Z        G:::::G    GGGGG::::G\n"
                        + "Z:::::Z        Z:::::::::G        G::::G\n"
                        + "ZZZ:::::Z     ZZZZZ G:::::G       G::::G\n"
                        + "Z::::::ZZZZZZZZ:::Z  G:::::GGGGGGGG::::G\n"
                        + "Z:::::::::::::::::Z   GG:::::::::::::::G\n"
                        + "Z:::::::::::::::::Z     GGG::::::GGG:::G\n"
                        + "ZZZZZZZZZZZZZZZ  启动成功 GGGGGG    GGGG");
    }
}