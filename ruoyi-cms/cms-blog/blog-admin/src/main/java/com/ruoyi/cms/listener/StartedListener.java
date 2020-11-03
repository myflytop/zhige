package com.ruoyi.cms.listener;

import com.ruoyi.cms.common.constant.CmsSystemConstant;
import com.ruoyi.cms.common.utils.ThemeUtils;
import com.ruoyi.cms.system.service.impl.CmsThemeServiceImpl;
import com.ruoyi.common.constant.RuoYiConstants;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.event.ApplicationStartedEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.lang.NonNull;
import org.springframework.util.Assert;
import org.springframework.util.ResourceUtils;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.URI;
import java.nio.file.*;
import java.nio.file.attribute.BasicFileAttributes;
import java.util.Collections;
import java.util.List;

@Configuration
@Order(Ordered.HIGHEST_PRECEDENCE)
public class StartedListener implements ApplicationListener<ApplicationStartedEvent> {
    private static final Logger log = LoggerFactory.getLogger(StartedListener.class);
    @Autowired
    private CmsThemeServiceImpl themeService;
    /**
     * 首次启动监听器
     * @param event
     */
    @Override
    public void onApplicationEvent(ApplicationStartedEvent event) {
        //初始化工作目录
        initWorkDir();
    }

    /**
     * 启动校验本地数据库列表是否和数据库一致
     * 不一致以本地为准
     * 初始化主题
     * 未完成
     */
    private  void initTheme() {
      /*String themeRoot= ThemeUtils.getThemeDir();*/
      //验证主题
      /*List<String> themesLocal=ThemeUtils.getFileList(themeRoot);*/
      //修正数据库主题
     /* List<String> themesKu=themeService.listThemeName();*/
        //1.获取本都主题列表
        //2.获取数据库主题列表
        //3.对比主题是否失效


        try {
            String themeClassPath = ResourceUtils.CLASSPATH_URL_PREFIX;

            URI themeUri = ResourceUtils.getURL(themeClassPath).toURI();

            log.debug("Theme uri: [{}]", themeUri);

            Path source;
             //忽略大小写 themeUri.getScheme()获取文件类型
            if ("jar".equalsIgnoreCase(themeUri.getScheme())) {
                // 为jar创建新的文件系统
                FileSystem fileSystem = getFileSystem(themeUri);
                source = fileSystem.getPath(CmsSystemConstant.THEME_ROOT);
            } else {
                source = Paths.get(themeUri);
            }

            // 创建主题目录
            Path themePath = Paths.get(Paths.get(System.getProperties().getProperty("user.home"),RuoYiConstants.themeDir).toString());

            // Fix the problem that the project cannot start after moving to a new server
            if (Files.notExists(themePath)) {
                //复制
                copyFolder(source, themePath);
                log.debug("Copied theme folder from [{}] to [{}]", source, themePath);
            } else {
                log.debug("Skipped copying theme folder due to existence of theme folder");
            }
        } catch (Exception e) {
            log.error("Initialize internal theme to user path error!", e);
        }
    }

    /**
     * 初始化工作目录
     * 1. 静态资源
     * 2. 自定义配置
     * 3. 备份
     * 4. 用户上传文件
     * 5. 日志目录
     */
    private void initWorkDir(){

        Path workPath =  Paths.get(System.getProperties().getProperty("user.home"), RuoYiConstants.workDir);
        Path backupPath = Paths.get(System.getProperties().getProperty("user.home"), RuoYiConstants.backDir);

        try {
            if (Files.notExists(workPath)) {
                Files.createDirectories(workPath);
                log.info("创建工作目录: [{}]", workPath);
            }

            if (Files.notExists(backupPath)) {
                Files.createDirectories(backupPath);
                log.info("创建备份目录: [{}]", backupPath);
            }

        } catch (IOException ie) {
            throw new RuntimeException("Failed to initialize directories", ie);
        }
    }


    /**
     * 访问文件系统的接口
     * @param uri
     * @return
     * @throws IOException
     */
    @NonNull
    private FileSystem getFileSystem(@NonNull URI uri) throws IOException {
        Assert.notNull(uri, "Uri must not be null");
        FileSystem fileSystem;
        try {
            //获取文件系统访问接口
            fileSystem = FileSystems.getFileSystem(uri);
        } catch (FileSystemNotFoundException e) {
            //创建新的文件系统访问接口
            fileSystem = FileSystems.newFileSystem(uri, Collections.emptyMap());
        }
        return fileSystem;
    }

    /**
     * Copies folder.
     *
     * @param source source path must not be null
     * @param target target path must not be null
     */
    public static void copyFolder(@NonNull Path source, @NonNull Path target) throws IOException {
        Assert.notNull(source, "Source path must not be null");
        Assert.notNull(target, "Target path must not be null");

        Files.walkFileTree(source, new SimpleFileVisitor<Path>() {

            @Override
            public FileVisitResult preVisitDirectory(Path dir, BasicFileAttributes attrs) throws IOException {
                Path current = target.resolve(source.relativize(dir).toString());
                Files.createDirectories(current);
                return FileVisitResult.CONTINUE;
            }

            @Override
            public FileVisitResult visitFile(Path file, BasicFileAttributes attrs) throws IOException {
                Files.copy(file, target.resolve(source.relativize(file).toString()), StandardCopyOption.REPLACE_EXISTING);
                return FileVisitResult.CONTINUE;
            }
        });
    }

}
