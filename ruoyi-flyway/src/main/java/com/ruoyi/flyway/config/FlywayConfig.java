package com.ruoyi.flyway.config;

import javax.annotation.PostConstruct;
import javax.sql.DataSource;

import org.flywaydb.core.Flyway;
import org.flywaydb.core.api.FlywayException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;

@Configuration
@Order(Ordered.HIGHEST_PRECEDENCE)
public class FlywayConfig {

    @Autowired
    private DataSource dataSource;
    private static final Logger logger = LoggerFactory.getLogger(FlywayConfig.class);

    // flyway.baseline-description对执行迁移时基准版本的描述.
    // flyway.baseline-on-migrate当迁移时发现目标schema非空，而且带有没有元数据的表时，是否自动执行基准迁移，默认false.
    // flyway.baseline-version开始执行基准迁移时对现有的schema的版本打标签，默认值为1.
    // flyway.check-location检查迁移脚本的位置是否存在，默认false.
    // flyway.clean-on-validation-error当发现校验错误时是否自动调用clean，默认false.
    // flyway.enabled是否开启flywary，默认true.
    // flyway.encoding设置迁移时的编码，默认UTF-8.
    // flyway.ignore-failed-future-migration当读取元数据表时是否忽略错误的迁移，默认false.
    // flyway.init-sqls当初始化好连接时要执行的SQL.
    // flyway.locations迁移脚本的位置，默认db/migration.
    // flyway.out-of-order是否允许无序的迁移，默认false.
    // flyway.password目标数据库的密码.
    // flyway.placeholder-prefix设置每个placeholder的前缀，默认${.
    // flyway.placeholder-replacementplaceholders是否要被替换，默认true.
    // flyway.placeholder-suffix设置每个placeholder的后缀，默认}.
    // flyway.placeholders.[placeholder name]设置placeholder的value
    // flyway.schemas设定需要flywary迁移的schema，大小写敏感，默认为连接默认的schema.
    // flyway.sql-migration-prefix迁移文件的前缀，默认为V.
    // flyway.sql-migration-separator迁移脚本的文件名分隔符，默认__
    // flyway.sql-migration-suffix迁移脚本的后缀，默认为.sql
    // flyway.tableflyway使用的元数据表名，默认为schema_version
    // flyway.target迁移时使用的目标版本，默认为latest version
    // flyway.url迁移时使用的JDBC URL，如果没有指定的话，将使用配置的主数据源
    // flyway.user迁移数据库的用户名
    // flyway.validate-on-migrate迁移时是否校验，默认为true
    @PostConstruct
    public void migrate() {
        Flyway flyway = Flyway.configure().dataSource(dataSource).locations("db/migration").baselineOnMigrate(true)
                .outOfOrder(false).encoding("UTF-8").load();
        try {
            flyway.migrate();
        } catch (FlywayException e) {
            logger.error("Flyway配置第一次加载出错", e);
            try {
                flyway.repair();// 生成版本记录表
                logger.info("Flyway配置修复成功");
                flyway.migrate();
                logger.info("Flyway配置重新加载成功");
            } catch (Exception e1) {
                logger.error("Flyway配置第二次加载出错", e1);
                throw e1;
            }
        }
    }

}
