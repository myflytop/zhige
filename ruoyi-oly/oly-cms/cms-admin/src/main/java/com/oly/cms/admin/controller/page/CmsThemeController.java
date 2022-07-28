package com.oly.cms.admin.controller.page;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.nio.charset.Charset;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oly.cms.admin.model.support.ThemeTreeNode;
import com.oly.cms.admin.service.impl.CmsArticleServiceImpl;
import com.oly.cms.admin.service.impl.CmsThemeServiceImpl;
import com.oly.cms.admin.utils.CmsUtils;
import com.oly.cms.admin.web.CmsCommonController;
import com.oly.cms.common.model.properties.OlyThemeConfigProperties;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.enums.OlyStageRoot;
import com.ruoyi.common.enums.OperateTitle;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.mail.domain.OlyMail;
import com.ruoyi.mail.service.impl.OlyMailServiceImpl;
import com.ruoyi.oss.domain.OlyOss;
import com.ruoyi.system.config.service.impl.SysConfigServiceImpl;
import com.ruoyi.template.utils.TemplatesUtil;

import org.apache.commons.io.FilenameUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/cms/theme")
public class CmsThemeController extends CmsCommonController {
	private String prefix = acceptPrefix + "theme";
	@Autowired
	private CmsThemeServiceImpl themeService;
	@Autowired
	private SysConfigServiceImpl sysConfigService;
	@Autowired
	private OlyMailServiceImpl mailService;
	@Autowired
	private CmsArticleServiceImpl articleService;

	/**
	 * 转向列表页设置页面
	 * 
	 * @return
	 */
	@GetMapping
	@RequiresPermissions("cms:theme:view")
	public String themeView(ModelMap mp) {
		mp.put("themes", themeService.listThemesToMap());
		return prefix + "/theme";
	}

	/**
	 * 主题编辑视图
	 * 
	 * @return
	 */
	@GetMapping("/themeEdit")
	@RequiresPermissions("cms:theme:edit")
	public String themeEdit() {
		return prefix + "/themeEdit";
	}

	/**
	 * 上传主题
	 * 
	 * @param file
	 * @param cover   覆盖上传
	 * @param request
	 * @return
	 * @throws Throwable
	 */
	@PostMapping("/uploadTheme")
	@RequiresPermissions("cms:theme:upload")
	@Log(title = OperateTitle.CMS_THEME, businessType = BusinessType.INSERT)
	@ResponseBody
	public AjaxResult themeUpload(@RequestParam("themeFile") MultipartFile file,
			@RequestParam(value = "cover", defaultValue = "false", required = false) boolean cover,
			HttpServletRequest request) throws Throwable {
		if (file.isEmpty() || !"zip|gz|rar".contains(FilenameUtils.getExtension(file.getOriginalFilename()))) {
			return AjaxResult.error("文件不存在或者不支持压缩类型,请上传.zip|.gz|.rar压缩包");
		} else {
			return toAjax(themeService.uploadTheme(file, cover));
		}

	}

	/**
	 * 主题配置
	 */
	@GetMapping("/themeConfig")
	@RequiresPermissions("theme:config:view")
	public String themeConfig(ModelMap map) {
		return prefix + "/themeConfig";
	}

	/**
	 * 站点配置
	 */
	@GetMapping("/webConfig/{configGroup}")
	@RequiresPermissions("theme:config:view")
	public String webConfig(@PathVariable("configGroup") String configGroup, ModelMap map) {
		map.put("configName", configGroup);
		return prefix + "/webConfig";
	}

	/**
	 * 主题设置
	 *
	 * @return
	 */
	@GetMapping("/themeSetting/{configGroup}")
	@RequiresPermissions("theme:config:view")
	public String themeSetting(@PathVariable("configGroup") String configGroup, ModelMap map) {
		map.put("webConfig", configGroup);
		return configGroup + "/setting/setting";
	}

	/**
	 * 修改保存参数配置
	 * 通过key批量保存
	 * 默认设置为字符串类型
	 * 
	 * @param mp
	 * @return
	 */
	@RequiresPermissions("theme:config:edit")
	@Log(title = OperateTitle.CMS_THEME, businessType = BusinessType.UPDATE)
	@PostMapping("/updateByGk")
	@ResponseBody
	public AjaxResult editByGkSaves(@RequestParam Map<String, String> mp) {
		return toAjax(sysConfigService.updatesByMap(mp));
	}

	/**
	 * 启用主题
	 * 
	 * @return
	 * @throws FileNotFoundException
	 */
	@Log(title = OperateTitle.CMS_THEME, businessType = BusinessType.UPDATE)
	@PostMapping("/enableTheme")
	@RequiresPermissions("cms:theme:edit")
	@ResponseBody
	public AjaxResult setTheme(String themeName) throws FileNotFoundException {
		if (themeName.equals(sysConfigService.selectConfigDefauleValue(
				OlyThemeConfigProperties.THEME_CONFIG_GROUP.defaultValue(), OlyThemeConfigProperties.THEME_USED))) {
			return AjaxResult.error("使用的就是当前主题,无需切换!");
		} else if (!checkThemeExist(themeName)) {
			return AjaxResult.error("当前主题本地可能不存在,请确定!");
		} else if (themeService.selectByName(themeName) == null) {
			return AjaxResult.error("当前主题数据库可能不存在,请确定!");
		} else {
			// 启用主题
			themeService.setTheme(themeName);
			return AjaxResult.success("主题切换成功!");
		}
	}

	@Log(title = OperateTitle.CMS_THEME, businessType = BusinessType.DELETE)
	@PostMapping("/deleteTheme")
	@RequiresPermissions("cms:theme:remove")
	@ResponseBody
	public AjaxResult deleteTheme(String themeName) throws FileNotFoundException {
		if (themeName.equals(sysConfigService.selectConfigDefauleValue(
				OlyThemeConfigProperties.THEME_CONFIG_GROUP.defaultValue(), OlyThemeConfigProperties.THEME_USED))) {
			return AjaxResult.error("当前主题已经启用,不允许删除!");
		}
		if (themeService.deleteByName(themeName) == 0) {
			return AjaxResult.error("删除失败");
		}
		return AjaxResult.success("删除成功");
	}

	/**
	 * 同步主题信息到数据库
	 * 
	 * @return
	 */
	@Log(title = OperateTitle.CMS_THEME, businessType = BusinessType.UPDATE)
	@PostMapping("/syncThemes")
	@RequiresPermissions("cms:theme:update")
	@ResponseBody
	public AjaxResult syncThemes() {
		List<String> themes = CmsUtils.listThemeNames();
		for (String themeName : themes) {
			themeService.syncThemeInfo(themeName, false);
		}
		return AjaxResult.success(themes.size());
	}

	@GetMapping("/themeBack")
	@RequiresPermissions("cms:themeBack:view")
	public String themeBack(ModelMap mp) {
		return prefix + "/themeBack";
	}

	@RequiresPermissions("cms:themeBack:view")
	@PostMapping("/themeBackList")
	@ResponseBody
	public TableDataInfo backList() {
		TableDataInfo rspData = new TableDataInfo();
		List<OlyOss> list = CmsUtils.listBackThemes();
		rspData.setCode(0);
		rspData.setRows(list);
		rspData.setTotal(list.size());
		return rspData;
	}

	/**
	 * 主题备份
	 * 
	 * @param themeName
	 * @return
	 */
	@Log(title = OperateTitle.CMS_THEME, businessType = BusinessType.EXPORT)
	@PostMapping("/packageTheme")
	@RequiresPermissions("cms:theme:update")
	@ResponseBody
	public AjaxResult packageTheme(String themeName) {
		CmsUtils.backUpTheme(themeName);
		return AjaxResult.success();
	}

	/**
	 * 删除备份主题
	 * 
	 * @param themeName
	 * @return
	 */
	@Log(title = OperateTitle.CMS_THEME, businessType = BusinessType.EXPORT)
	@PostMapping("/removeBackTheme")
	@RequiresPermissions("cms:theme:update")
	@ResponseBody
	public AjaxResult deleteBackTheme(String themeName) {
		CmsUtils.removeBackTheme(themeName);
		return AjaxResult.success();
	}

	/**
	 * 下载备份主题
	 * 
	 * @param themeName
	 * @return
	 */
	@Log(title = OperateTitle.CMS_THEME, businessType = BusinessType.EXPORT)
	@GetMapping("/downloadBackTheme")
	@RequiresPermissions("cms:theme:update")
	@ResponseBody
	public AjaxResult downloadBackTheme(String themeName, HttpServletResponse response, HttpServletRequest request) {
		CmsUtils.downloadBackTheme(themeName, response, request);
		return AjaxResult.success();
	}

	/**
	 * 将主题发送到邮箱
	 * 
	 * @param themeName
	 * @return
	 */
	@Log(title = OperateTitle.CMS_THEME, businessType = BusinessType.EXPORT)
	@PostMapping("/sendMailBackTheme")
	@RequiresPermissions("cms:theme:update")
	@ResponseBody
	public AjaxResult sendMailTheme(String themeName, String toMail) {
		OlyMail olyMail = new OlyMail();
		String attachKeys = Paths.get(OlyStageRoot.BACK_DIR.getRoot(OlyStageRoot.THEME_DIR.getValue()), themeName)
				.toString();
		olyMail.setToMail(toMail);
		olyMail.setSubject("你收到来自于止戈管理系统的备份邮件");
		olyMail.setContent("你收到来自于止戈管理系统的备份邮件,邮件名为" + themeName);
		olyMail.setAttachKeys(attachKeys);
		mailService.sendTextMail(olyMail, true);
		return AjaxResult.success();
	}

	/**
	 * 获取启用主题
	 * 
	 * @return
	 */
	@GetMapping("/getThemeUsed")
	@RequiresPermissions("cms:theme:update")
	@ResponseBody
	public AjaxResult getThemeUsed() {
		return AjaxResult.success("获取使用的主题", themeService.selectThemeByUsed());
	}

	/**
	 * @param path
	 * @return
	 * @throws FileNotFoundException
	 */
	@GetMapping("/treeData")
	@RequiresPermissions("cms:theme:view")
	@ResponseBody
	public List<ThemeTreeNode> getThemeFiles(String path) throws FileNotFoundException {
		if (StringUtils.isEmpty(path)) {
			path = "";
		}
		List<ThemeTreeNode> themeTreeNodes = new ArrayList<>();
		// 获取主题路径
		final File themesPath = new File(OlyStageRoot.THEME_DIR.getRoot(""));
		listFile(themesPath, path, themeTreeNodes);
		return themeTreeNodes;
	}

	/**
	 * 获取文件内容
	 * 
	 * @param path
	 * @return
	 */
	@GetMapping("/themeContent")
	@RequiresPermissions("cms:theme:view")
	@ResponseBody
	public AjaxResult themeContent(String path) throws FileNotFoundException {
		if (!"html|js|css|txt|json".contains(FilenameUtils.getExtension(path))) {
			return AjaxResult.error("不支持文件类型！");
		}
		final File themesPath = Paths.get(OlyStageRoot.THEME_DIR.getRoot(path)).toFile();
		if (!themesPath.exists()) {
			return AjaxResult.error("文件不存在");
		}
		if (themesPath.isDirectory()) {
			return AjaxResult.error("所选文件为文件夹！");
		}
		return AjaxResult.success(readFileContent(themesPath));
	}

	@Log(title = OperateTitle.CMS_THEME, businessType = BusinessType.UPDATE)
	@PostMapping("/themeContentSave")
	@RequiresPermissions("cms:theme:edit")
	@ResponseBody
	public AjaxResult themeContentSave(String path, String content) throws FileNotFoundException {
		TemplatesUtil.saveHtml(content, Paths.get(OlyStageRoot.THEME_DIR.getRoot(path)).toString());
		return AjaxResult.success();
	}

	@Log(title = OperateTitle.CMS_THEME, businessType = BusinessType.UPDATE)
	@PostMapping("/buildArticleIndex/{themeName}")
	@RequiresPermissions("cms:theme:buildArticleIndex")
	@ResponseBody
	public AjaxResult buildArticleIndex(@PathVariable("themeName") String themeName) {
		if (!themeService.listThemeNames().contains(themeName)) {
			return error("主题可能不存在,请确定!");
		}
		return AjaxResult.success(articleService.buildArticleIndex(themeName));
	}

	/**
	 * 遍历主题文件
	 * 
	 * @param dir
	 * @param prefix
	 * @param themeList
	 */
	public static void listFile(File dir, String prefix, List<ThemeTreeNode> themeList) {
		File[] files = dir.listFiles();
		if (null != files) {
			for (File file : files) {
				ThemeTreeNode themeTreeNode = new ThemeTreeNode();
				themeTreeNode.setParentId(prefix);
				themeTreeNode.setpId(prefix);
				themeTreeNode.setId(prefix + "/" + file.getName());
				themeTreeNode.setName(file.getName());
				themeTreeNode.setTitle(file.getName());
				if (file.isDirectory()) {
					themeTreeNode.setParent(file.isDirectory());
					listFile(file, prefix + "/" + file.getName(), themeList);
				}
				themeList.add(themeTreeNode);
			}
		}
	}

	// 读取主题配置
	private String readFileContent(File file) {
		BufferedReader reader = null;
		try {
			StringBuffer sbf = new StringBuffer();
			reader = new BufferedReader(new FileReader(file, Charset.forName("utf-8")));
			String tempStr;
			while ((tempStr = reader.readLine()) != null) {
				sbf.append(tempStr).append("\n");
			}
			reader.close();
			return sbf.toString();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (reader != null) {
				try {
					reader.close();
				} catch (IOException e1) {
					e1.printStackTrace();
				}
			}
		}
		return null;
	}

	/**
	 * 确定主题本地存在
	 * 
	 * @param themeName
	 * @return
	 */
	private boolean checkThemeExist(String themeName) {
		final File themePath = Paths.get(OlyStageRoot.THEME_DIR.getRoot(themeName)).toFile();
		return themePath.exists() && themePath.isDirectory();
	}

}