package com.oly.web.listener;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Paths;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.dataformat.yaml.YAMLFactory;
import com.oly.common.model.properties.OlyThemeProperties;
import com.oly.web.mapper.BlogHandleMapper;
import com.oly.web.model.po.BlogTheme;
import com.ruoyi.common.config.RuoYiConfig;
import com.ruoyi.common.enums.OlyStageRoot;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.event.ApplicationStartedEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;

@Configuration
@Order(Ordered.HIGHEST_PRECEDENCE)
public class StartedListener implements ApplicationListener<ApplicationStartedEvent> {
  private static final Logger log = LoggerFactory.getLogger(StartedListener.class);

  @Autowired
  private BlogHandleMapper handerMapper;

  @Override
  public void onApplicationEvent(ApplicationStartedEvent arg0) {
    initRobots();
  }

  /**
   * 初始化默认Robots
   */
  private void initRobots() {
    // 获取默认目录下的
    InputStream input = this.getClass().getResourceAsStream("/templates/themes/zgblog/setting/theme.yaml");
    ObjectMapper mapper = new ObjectMapper(new YAMLFactory());
    try {
      BlogTheme theme = mapper.readValue(input, BlogTheme.class);
      if (handerMapper.updateBlogThemeByName(theme) == 0) {
        handerMapper.insertBlogTheme(theme);
      }
    } catch (JsonParseException e1) {
      log.info("JsonParseException:" + e1.getMessage());
    } catch (JsonMappingException e1) {
      log.info("JsonMappingException:" + e1.getMessage());
    } catch (IOException e1) {
      log.info("IOException:" + e1.getMessage());
    }
    File file = Paths.get(RuoYiConfig.getWorkPath(), OlyStageRoot.THEME_DIR.getDir(),
        OlyThemeProperties.THEME_USED.defaultValue(), "robots.txt").toFile();
    if (!file.exists()) {
      try {
        file.getParentFile().mkdirs();
        String msg = file.createNewFile() ? "成功" : "失败";
        log.info("robots.txt创建" + msg);
      } catch (IOException e) {
        log.error("创建robots.txt异常:" + e.getMessage());
      }
    } else {
      log.info("robots.txt已经存在！");
    }
  }

}
