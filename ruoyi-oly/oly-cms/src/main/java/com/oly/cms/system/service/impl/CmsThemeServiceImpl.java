package com.oly.cms.system.service.impl;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.dataformat.yaml.YAMLFactory;
import com.oly.cms.system.mapper.CmsThemeMapper;
import com.oly.cms.system.model.po.CmsTheme;
import com.oly.cms.system.service.ICmsThemeService;
import com.oly.cms.system.utils.CmsUtils;
import com.oly.common.model.properties.OlyThemeProperties;
import com.oly.oss.service.impl.NativeOssHandler;
import com.oly.web.mapper.BlogHandleMapper;
import com.oly.web.model.po.BlogTheme;
import com.ruoyi.common.config.RuoYiConfig;
import com.ruoyi.common.enums.OlyStageRoot;
import com.ruoyi.common.exception.BusinessException;
import com.ruoyi.system.domain.SysConfig;
import com.ruoyi.system.service.impl.SysConfigServiceImpl;

import org.apache.commons.io.FilenameUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import cn.hutool.core.io.FileUtil;
import cn.hutool.core.util.CharsetUtil;
import cn.hutool.core.util.ZipUtil;

@Service
public class CmsThemeServiceImpl implements ICmsThemeService {
	private static final Logger log = LoggerFactory.getLogger(CmsThemeServiceImpl.class);
	@Autowired
	private CmsThemeMapper themeMapper;

	@Autowired
	private NativeOssHandler ossHander;

	@Autowired
	private BlogHandleMapper blogHandleMapper;

	@Autowired
	private SysConfigServiceImpl sysConfigService;

	@Autowired
	private CmsConfigBackServiceImpl configBackService;

	/**
	 * 删除主题
	 * 
	 * @param themeName
	 * @return
	 * @throws FileNotFoundException
	 */
	@Override
	public int deleteByName(String themeName) throws FileNotFoundException {
		// 删除主题配置
		configBackService.deleteCmsConfigBackByGroup(themeName);
		// 删除主题淘客配置
		configBackService.deleteCmsConfigBackByGroup(themeName + "_tao");
		CmsUtils.deleteThemeFile(themeName);
		return themeMapper.deleteByName(themeName);

	}

	@Override
	public CmsTheme selectThemeByUsed() {
		return themeMapper.selectThemeByUsed();
	}

	@Override
	public int uploadTheme(MultipartFile file, boolean covery) throws Throwable, IOException {
		String fileName = FilenameUtils.getName(file.getOriginalFilename());
		String baseName = FilenameUtils.getBaseName(file.getOriginalFilename());
		int re = 0;
		// 需要复制的地方
		File f = Paths.get(RuoYiConfig.getWorkPath(), OlyStageRoot.THEME_DIR.getDir(), fileName).toFile();
		// 主题文件夹
		File fl = Paths.get(RuoYiConfig.getWorkPath(), OlyStageRoot.THEME_DIR.getDir(), baseName).toFile();
		// 说明主题未上传
		boolean uDb = (themeMapper.countThemeByName(baseName) == 0);
		// 文件夹存在
		if (fl.exists() && fl.isDirectory()) {
			if (covery) {
				ossHander.ossAppointUpload(file, OlyStageRoot.THEME_DIR, fileName);
				log.info("主题已经覆盖上传");
			} else {
				new BusinessException("主题未上传,因为文件已经存在,你选择的是不覆盖上传！");
			}
		} else {
			ossHander.ossAppointUpload(file, OlyStageRoot.THEME_DIR, fileName);
			log.info("主题已经上传！");
		}
		// 解压到当前目录
		ZipUtil.unzip(f.getAbsolutePath(), f.getParent(), CharsetUtil.systemCharset());
		// 删除压缩文件
		FileUtil.del(f);
		File themeYaml = new File(fl.getPath(), OlyThemeProperties.THEME_INFO.defaultValue());
		if (themeYaml.exists() && !themeYaml.isDirectory()) {
			// 用于读取yaml
			ObjectMapper mapper = new ObjectMapper(new YAMLFactory());
			// 读取主题说明 将配置文件转换为CmsTheme
			BlogTheme theme = mapper.readValue(themeYaml, BlogTheme.class);
			// 默认不开启
			theme.setThemeEnabled((byte) 0);
			// 设置主题名字
			theme.setThemeName(baseName);
			// 插入数据库上传主题
			if (uDb) {
				log.info("主题上传完毕,配置文件已经加载");
				re = blogHandleMapper.insertBlogTheme(theme);
			} else {
				log.info("主题上传完毕,配置文件已更新");
				re = blogHandleMapper.updateBlogThemeByName(theme);
			}

		} else {
			FileUtil.del(fl);
			new BusinessException("主题安装失败,找不到或者读取配置文件");
		}
		return re;
	}

	/**
	 * 获取主题列表
	 * 
	 * @return
	 */
	@Override
	public Map<String, CmsTheme> listThemes() {
		List<CmsTheme> themeList = themeMapper.listThemes();
		Map<String, CmsTheme> themeMap = themeList.stream()
				.collect(Collectors.toMap(CmsTheme::getThemeName, a -> a, (k1, k2) -> k1));
		return themeMap;
	}

	/**
	 * 获启用的主题
	 */
	@Override
	public String getUseTheme() {
		Object ob = sysConfigService.selectConfigByKey(OlyThemeProperties.THEME_USED.getValue());
		if (ob == null) {
			String u = null;
			try {
				// 获取启用的主题
				u = themeMapper.selectThemeByUsed().getThemeName();
			} catch (Exception e) {
				u = OlyThemeProperties.THEME_USED.defaultValue();
				this.setTheme(u);
			}
			return u;
		} else {
			return ob.toString();
		}

	}

	@Override
	public List<String> listThemeNames() {
		return themeMapper.listThemeNames();
	}

	/**
	 * 设置更新主题
	 * 
	 * @param themeName
	 * @return
	 * @throws FileNotFoundException
	 */
	@Transactional
	@Override
	public int setTheme(String themeName) {
		// 获取使用的主题
		CmsTheme cmsTheme = themeMapper.selectThemeByUsed();
		SysConfig sysConfig = new SysConfig();
		sysConfig.setConfigKey(OlyThemeProperties.THEME_USED.getValue());
		sysConfig.setConfigValue(themeName);
		sysConfigService.updateConfigByKey(sysConfig);
		int re = 0;
		if (cmsTheme == null) {
			re = themeMapper.updateThemeEnable(OlyThemeProperties.THEME_USED.defaultValue(), themeName);
		}
		re = themeMapper.updateThemeEnable(cmsTheme.getThemeName(), themeName);
		return re;
	}

	@Override
	public CmsTheme selectByName(String themeName) {
		return themeMapper.selectByName(themeName);
	}

}
