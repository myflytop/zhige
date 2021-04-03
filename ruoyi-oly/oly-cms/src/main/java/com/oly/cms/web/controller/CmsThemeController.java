package com.oly.cms.web.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.oly.cms.system.model.support.ThemeTreeNode;
import com.oly.cms.system.service.impl.CmsThemeServiceImpl;
import com.oly.cms.web.CmsCommonController;
import com.oly.common.model.properties.OlyThemeProperties;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.config.RuoYiConfig;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.enums.OlyStageRoot;
import com.ruoyi.common.utils.ShiroUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.domain.SysConfig;
import com.ruoyi.system.service.impl.SysConfigServiceImpl;

import org.apache.commons.io.FilenameUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

/**
 * 系统主题不支持编辑 不支持修改删除
 */
@Controller
@RequestMapping("/cms/theme")
public class CmsThemeController extends CmsCommonController {
	private String prefix = acceptPreifx + "theme";
	@Autowired
	private CmsThemeServiceImpl themeService;

	@Autowired
	private SysConfigServiceImpl sysConfigService;

	

	/**
	 * 转向列表页设置页面
	 * 
	 * @return
	 * @throws IOException
	 * @throws JsonMappingException
	 * @throws JsonParseException
	 */
	@GetMapping
	@RequiresPermissions("cms:theme:view")
	public String themeView(ModelMap mp) throws JsonParseException, JsonMappingException, IOException {
		mp.put("themes", themeService.listThemes());
		return prefix + "/theme";
	}
   
	/**
	 * 主题编辑视图
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
	 * @param covery  覆盖上传
	 * @param request
	 * @return
	 * @throws Throwable
	 */
	@PostMapping("/uploadTheme")
	@RequiresPermissions("cms:theme:upload")
	@Log(title = "主题管理-主题上传", businessType = BusinessType.INSERT)
	@ResponseBody
	public AjaxResult themeUpload(@RequestParam("themeFile") MultipartFile file,
			@RequestParam(value = "covery", defaultValue = "false", required = false) boolean covery,
			HttpServletRequest request) throws Throwable {
		if (file.isEmpty()||!"zip|gz|rar".contains(FilenameUtils.getExtension(file.getOriginalFilename()))) {
			return AjaxResult.error("文件不存在或者不支持压缩类型,请上传zip|.gz|.rar压缩包");
		} else {
			return toAjax(themeService.uploadTheme(file, covery));
		}

	}

	/**
	 * 启用主题
	 * 
	 * @return
	 * @throws FileNotFoundException
	 */
	@Log(title = "主题管理-主题设置", businessType = BusinessType.UPDATE)
	@PostMapping("/setTheme")
	@RequiresPermissions("cms:theme:edit")
	@ResponseBody
	public AjaxResult setTheme(String themeName) throws FileNotFoundException {
		if (themeName.equals(sysConfigService.selectConfigByKey(OlyThemeProperties.THEME_USED.getValue()))) {
			return AjaxResult.error("使用的就是当前主题,无需切换!");
		} else if (!Paths.get(RuoYiConfig.getWorkPath(), OlyStageRoot.THEME_DIR.getDir(), themeName).toFile()
				.exists()) {
			return AjaxResult.error("当前主题本地可能不存在,请确定!");
		} else if (themeService.selectByName(themeName) == null) {
			return AjaxResult.error("当前主题数据库可能不存在,请确定!");
		} else  {
			themeService.setTheme(themeName);
			SysConfig sysConfig = new SysConfig();
			sysConfig.setConfigKey(OlyThemeProperties.THEME_USED.getValue());
			sysConfig.setConfigValue(themeName);
			sysConfig.setUpdateBy(ShiroUtils.getUserId().toString());
			sysConfigService.updateConfigByKey(sysConfig);
			return AjaxResult.success("主题切换成功!");
		}
	}

	@Log(title = "主题管理-主题删除", businessType = BusinessType.DELETE)
	@PostMapping("/deleteTheme")
	@RequiresPermissions("cms:theme:remove")
	@ResponseBody
	public AjaxResult deleteTheme(String themeName) throws FileNotFoundException {
		if (OlyThemeProperties.THEME_USED.defaultValue().equals(themeName)) {
			return AjaxResult.error("系统主题不允许删除!");
		}
		if (themeName.equals(sysConfigService.selectConfigByKey(themeName))) {
			return AjaxResult.error("当前主题已经启用,不允许删除!");
		}
		if (themeService.deleteByName(themeName) == 0) {
			return AjaxResult.error("删除失败");
		}
		return AjaxResult.success("删除成功");
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
	 * 获取主题文件 不获取默认主题
	 * 
	 * @return
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
		final File themesPath = new File(RuoYiConfig.getWorkPath(),OlyStageRoot.THEME_DIR.getDir());
		// 默认无法获取内置配置文件
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
		final File themesPath = Paths.get(RuoYiConfig.getWorkPath(), OlyStageRoot.THEME_DIR.getDir(), path).toFile();
		if (!themesPath.exists()) {
			return AjaxResult.error("文件不存在");
		}
		if (themesPath.isDirectory()) {
			return AjaxResult.error("所选文件为文件夹！");
		}
		return AjaxResult.success(readFileContent(themesPath));
	}


	@Log(title = "主题管理-保存主题内容", businessType = BusinessType.UPDATE)
	@PostMapping("/themeContentSave")
	@RequiresPermissions("cms:theme:edit")
	@ResponseBody
	public AjaxResult themeContentSave(String path, String content) throws FileNotFoundException {
		writetxtfile(content, Paths.get(RuoYiConfig.getWorkPath(), OlyStageRoot.THEME_DIR.getDir(), path).toString());
		return AjaxResult.success();
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
		StringBuffer sbf = new StringBuffer();
		try {
			reader = new BufferedReader(new FileReader(file));
			String tempStr;
			while ((tempStr = reader.readLine()) != null) {
				sbf.append(tempStr).append("\n");;
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
		return sbf.toString();
	}

	// 覆盖原内容
	public static boolean writetxtfile(String Content, String filepath) {
		boolean flag = false;
		try {
			// 写入文档的路径
			PrintWriter pw = new PrintWriter(filepath);
			// 写入的内容
			pw.write(Content);
			pw.flush();
			pw.close();
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}


	/**
	 * 确定主题本地存在
	 * 
	 * @param themeName
	 * @return
	 */
	private boolean checkThemeExist(String themeName) {

		return (themeService.selectByName(themeName) == null);

	}

}
