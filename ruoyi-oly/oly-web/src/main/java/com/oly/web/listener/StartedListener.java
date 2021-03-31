package com.oly.web.listener;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Paths;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.oly.common.model.properties.OlyThemeProperties;
import com.oly.framework.web.service.OlyCommonService;
import com.oly.web.mapper.BlogHandleMapper;
import com.oly.web.mould.BlogTheme;
import com.ruoyi.common.config.RuoYiConfig;
import com.ruoyi.common.constant.UserConstants;
import com.ruoyi.common.enums.ConfigValueTypeEnum;
import com.ruoyi.common.enums.OlyStageRoot;
import com.ruoyi.system.domain.SysConfig;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.event.ApplicationStartedEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;

import cn.hutool.core.exceptions.UtilException;
import cn.hutool.core.io.FileUtil;
import cn.hutool.core.util.CharsetUtil;
import cn.hutool.core.util.ZipUtil;

@Configuration
@Order(Ordered.HIGHEST_PRECEDENCE)
public class StartedListener implements ApplicationListener<ApplicationStartedEvent> {
  private static final Logger log = LoggerFactory.getLogger(StartedListener.class);
  @Autowired
  private BlogHandleMapper handerMapper;

  @Autowired
  private OlyCommonService commonService;

  @Override
  public void onApplicationEvent(ApplicationStartedEvent arg0) {

    try {
      initTheme();
    } catch (JsonParseException e) {

    } catch (JsonMappingException e) {

    } catch (UtilException e) {

    } catch (IOException e) {

    }

  }

  private void initTheme() throws UtilException, JsonParseException, JsonMappingException, IOException {

    // 获取默认目录下的
    InputStream input = this.getClass().getResourceAsStream("/templates/themes/zip/bobey.zip");
    // 需要解压的目录
    File file = Paths.get(RuoYiConfig.getWorkPath(), OlyStageRoot.THEME_DIR.getDir()).toFile();
    // 解压
    ZipUtil.unzip(input, file, CharsetUtil.systemCharset());
    // 用于读取json
    ObjectMapper mapper = null;
    // 读取主题说明 将配置文件转换为BlogTheme
    BlogTheme theme = null;

    String themeUsed = commonService.checkConfigKeyUnique(OlyThemeProperties.THEME_USED.getValue());
    String themeInstall = commonService.checkConfigKeyUnique(OlyThemeProperties.THEME_DEFAULT_INSTALL.getValue());
    SysConfig sysConfig = new SysConfig();
    sysConfig.setConfigValueType((byte) ConfigValueTypeEnum.STRING.ordinal());
    // 不存在
    if (UserConstants.CONFIG_KEY_UNIQUE.equals(themeUsed)) {
      sysConfig.setConfigKey(OlyThemeProperties.THEME_USED.getValue());
      sysConfig.setConfigValue(OlyThemeProperties.THEME_USED.defaultValue());
      sysConfig.setConfigName("使用主题");
      sysConfig.setConfigGroup("主题配置");
      sysConfig.setRemark("使用的主题");
      commonService.insertConfig(sysConfig);

    }
    if (UserConstants.CONFIG_KEY_UNIQUE.equals(themeInstall)) {
      sysConfig.setConfigKey(OlyThemeProperties.THEME_DEFAULT_INSTALL.getValue());
      sysConfig.setConfigValue(OlyThemeProperties.THEME_DEFAULT_INSTALL.defaultValue());
      sysConfig.setConfigName("是否安装");
      sysConfig.setConfigGroup("主题配置");
      sysConfig.setRemark("默认主题是否安装,系统是否首次运行");
      commonService.insertConfig(sysConfig);
    }

    sysConfig.setConfigName(null);
    sysConfig.setConfigGroup(null);
    sysConfig.setRemark(null);

    File themeJson = new File(file.getPath() + "/bobey", OlyThemeProperties.THEME_INFO.defaultValue());
    if (themeJson.exists() && !themeJson.isDirectory()) {
      mapper = new ObjectMapper();
      theme = mapper.readValue(themeJson, BlogTheme.class);
      // 设置默认主题名字
      theme.setThemeName( OlyThemeProperties.THEME_USED.defaultValue());
       // 判断是否是首次启动
      if ("false".equals(commonService.selectConfigDefauleValue(OlyThemeProperties.THEME_DEFAULT_INSTALL))) {
      // 启用默认主题
      theme.setThemeEnabled((byte) 1);
      // 插入数据库上传主题
      handerMapper.insertBlogTheme(theme);
      // 启用默认主题
      sysConfig.setConfigKey(OlyThemeProperties.THEME_USED.getValue());
      sysConfig.setConfigValue(OlyThemeProperties.THEME_USED.defaultValue());
      commonService.updateConfigBy(sysConfig);
      //系统已经安装
      sysConfig.setConfigKey(OlyThemeProperties.THEME_DEFAULT_INSTALL.getValue());
      sysConfig.setConfigValue("true");
      commonService.updateConfigBy(sysConfig);
      log.info("首次安装,默认主题上传成功");
    } else {
      theme.setThemeEnabled(null);
    
     if(handerMapper.updateBlogThemeByName(theme)==0)
     {
       handerMapper.insertBlogTheme(theme);
     }
      log.info("主题覆盖成功");
    }
    } else {
      FileUtil.del(Paths
          .get(RuoYiConfig.getWorkPath(), OlyStageRoot.THEME_DIR.getDir(), OlyThemeProperties.THEME_USED.defaultValue())
          .toFile());
      log.info("默认主题设置失败");
    }
  }

}
