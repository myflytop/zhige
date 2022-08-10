package com.oly.cms.admin.service.impl;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.oly.cms.admin.mapper.CmsThemeMapper;
import com.oly.cms.common.domain.entity.CmsTheme;
import com.oly.cms.admin.service.ICmsThemeService;
import com.oly.cms.admin.utils.CmsUtils;
import com.oly.cms.common.model.properties.OlyThemeConfigProperties;
import com.oly.cms.common.model.properties.OlyWebConfigProperties;
import com.ruoyi.common.enums.OlyStageRoot;
import com.ruoyi.common.enums.SysConfigGroups;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.ShiroUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.oss.service.impl.NativeOssHandler;
import com.ruoyi.system.config.domain.SysConfig;
import com.ruoyi.system.config.service.impl.SysConfigServiceImpl;

import org.apache.commons.io.FilenameUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.YamlMapFactoryBean;
import org.springframework.core.io.FileSystemResource;
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
	private SysConfigServiceImpl sysConfigService;

	/**
	 * 删除主题
	 * 
	 * @param themeName
	 * @return
	 * @throws FileNotFoundException
	 */
	@Override
	public int deleteByName(String themeName) throws FileNotFoundException {
		Map<String, SysConfig> sysConfigs = sysConfigService.selectConfigMapByGroupName(themeName);
		Set<String> configSet = sysConfigs.keySet();
		Iterator<String> configIt = configSet.iterator();
		while (configIt.hasNext()) {
			sysConfigService.deleteConfigByGk(sysConfigs.get(configIt.next()));
		}
		// 删除主题包
		CmsUtils.deleteThemeFile(themeName);
		// 从数据库中删除
		return themeMapper.deleteByName(themeName);

	}

	@Override
	public CmsTheme selectThemeByUsed() {
		return themeMapper.selectThemeByUsed();
	}

	@Override
	public int uploadTheme(MultipartFile file, boolean cover) throws Throwable, IOException {
		String floadName = FilenameUtils.getBaseName(file.getOriginalFilename());
		if (SysConfigGroups.getValues().contains(floadName)) {
			throw new ServiceException("主题名不被系统允许!");
		}
		String fileName = FilenameUtils.getName(file.getOriginalFilename());
		// 主题文件
		File themeFile = Paths.get(OlyStageRoot.THEME_DIR.getRoot(fileName)).toFile();
		// 主题文件夹
		File themeFload = Paths.get(OlyStageRoot.THEME_DIR.getRoot(floadName)).toFile();
		// 主题信息是否同步数据库
		boolean iSync = (themeMapper.countThemeByName(floadName) == 0);
		// 文件夹存在
		if (themeFload.exists() && themeFload.isDirectory()) {
			if (cover) {
				ossHander.ossAppointUpload(file, OlyStageRoot.THEME_DIR, fileName);
				log.info("主题已覆盖");
			} else {
				throw new ServiceException("主题未上传,因为文件已经存在,你选择的是不覆盖上传！");
			}
		} else {
			ossHander.ossAppointUpload(file, OlyStageRoot.THEME_DIR, fileName);
			log.info("主题已经上传！");
		}
		// 解压到当前目录
		ZipUtil.unzip(themeFile.getAbsolutePath(), themeFile.getParent(), CharsetUtil.systemCharset());
		// 删除压缩文件
		FileUtil.del(themeFile);
		return this.syncThemeInfo(floadName, iSync);
	}

	/**
	 * 获取主题列表
	 * 
	 * @return
	 */
	@Override
	public Map<String, CmsTheme> listThemesToMap() {

		Map<String, CmsTheme> themeMap = listThemes().stream()
				.collect(Collectors.toMap(CmsTheme::getThemeName, a -> a, (k1, k2) -> k1));
		return themeMap;
	}

	/**
	 * 获启用的主题
	 */
	@Override
	public String getUseTheme() {
		Object ob = sysConfigService.selectConfigDefauleValue(
				OlyThemeConfigProperties.THEME_CONFIG_GROUP.defaultValue(), OlyThemeConfigProperties.THEME_USED);
		if (ob == null) {
			String u = null;
			try {
				// 获取启用的主题
				u = themeMapper.selectThemeByUsed().getThemeName();
			} catch (Exception e) {
				u = OlyThemeConfigProperties.THEME_USED.defaultValue();
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
		// 获取使用主题配置
		SysConfig sysConfig = sysConfigService.selectConfigByGk(
				OlyThemeConfigProperties.THEME_CONFIG_GROUP.defaultValue(),
				OlyThemeConfigProperties.THEME_USED.getValue());
		sysConfig.setConfigValue(themeName);
		sysConfig.setCreateBy(ShiroUtils.getUserIdStr());
		sysConfigService.updateConfigByGk(sysConfig);
		return themeMapper.updateThemeEnable(cmsTheme == null ? "" : cmsTheme.getThemeName(), themeName);
	}

	@Override
	public CmsTheme selectByName(String themeName) {
		return themeMapper.selectByName(themeName);
	}

	@Override
	public int syncThemeInfo(String themeName, boolean iSync) {
		int re = 0;
		File themeYaml = Paths
				.get(OlyStageRoot.THEME_DIR.getRoot(themeName), OlyThemeConfigProperties.THEME_INFO.defaultValue())
				.toFile();
		if (themeYaml.exists() && !themeYaml.isDirectory()) {
			YamlMapFactoryBean yamMap = new YamlMapFactoryBean();
			FileSystemResource fileResource = new FileSystemResource(themeYaml);
			yamMap.setResources(fileResource);
			// 读取主题说明 将配置文件转换为CmsTheme
			CmsTheme theme = JSONObject.parseObject(
					JSON.toJSONString(
							yamMap.getObject().get(OlyThemeConfigProperties.THEME_DATA_PREFIX.defaultValue())),
					CmsTheme.class);
			if (theme == null) {
				throw new ServiceException("获取主题说明异常");
			}
			// 读取配置
			addThemeConfig(JSON.parseArray(
					JSON.toJSONString(
							yamMap.getObject().get(OlyThemeConfigProperties.THEME_CONFIG_PREFIX.defaultValue())),
					SysConfig.class), themeName);
			// 设置主题名字
			theme.setThemeName(themeName);
			// 插入数据库上传主题
			if (iSync) {
				log.info("主题上传完毕,配置文件已经加载");
				// 默认不开启
				theme.setThemeEnabled(0);
				re = themeMapper.insert(theme);
			} else {
				log.info("主题上传完毕,配置文件已更新");
				re = themeMapper.updateByName(theme);
			}
		} else {
			try {
				CmsUtils.deleteThemeFile(themeName);
				throw new ServiceException("同步主题信息失败,找不到或者读取配置文件");
			} catch (FileNotFoundException e) {
				throw new ServiceException("主题配置文件不存在:" + themeName + e.getMessage());
			}

		}
		return re;
	}

	@Override
	public List<CmsTheme> listThemes() {
		return themeMapper.listThemes();
	}

	/**
	 * 读取配置
	 * 
	 * @param listConfigs
	 * @param themeName
	 */
	private void addThemeConfig(List<SysConfig> listConfigs, String themeName) {
		if (StringUtils.isNotEmpty(listConfigs)) {
			for (SysConfig sysConfig : listConfigs) {
				if (themeName.equals(sysConfig.getConfigGroup())
						&& sysConfig.getConfigKey().startsWith(OlyWebConfigProperties.THEME_CONFIG_PREFIX.getValue())) {
					sysConfig.setConfigType(1);
					if (sysConfigService.selectConfigByGk(sysConfig.getConfigGroup(),
							sysConfig.getConfigKey()) != null) {
						sysConfig.setUpdateBy(ShiroUtils.getUserIdStr());
						sysConfigService.updateConfigByGk(sysConfig);
					} else {
						sysConfig.setCreateBy(ShiroUtils.getUserIdStr());
						sysConfigService.insertConfig(sysConfig);
					}
				}
			}
		}
	}

}
