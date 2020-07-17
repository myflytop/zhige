package com.ruoyi.cms.web.controller;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;


import com.ruoyi.cache.redis.util.RedisUtils;
import com.ruoyi.cms.common.enums.ThemeEnums;
import com.ruoyi.cms.system.model.po.CmsTheme;
import com.ruoyi.cms.system.model.support.ThemeTreeNode;
import com.ruoyi.cms.system.service.impl.CmsThemeServiceImpl;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.oss.api.utils.FileTypes;
import com.ruoyi.oss.api.utils.OssUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.aspectj.weaver.loadtime.Aj;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.AjaxResult.Type;

@Controller
@RequestMapping("/cms/theme")
public class CmsThemeController {
	private String prefix = "blog/admin/theme";
	@Autowired
	private CmsThemeServiceImpl themeService;
	@Autowired
	private RedisUtils redisUtils;
	/**
	 * 转向列表页设置页面
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

	@GetMapping("/themeEdit")
	@RequiresPermissions("cms:theme:edit")
	public String themeEdit()  {
		return prefix + "/themeEdit";
	}

	/**
	 * 上传主题
	 * @param file
	 * @param covery
	 * @param request
	 * @return
	 * @throws Throwable
	 */
	@PostMapping("/uploadTheme")
	@RequiresPermissions("cms:theme:edit")
	@Log(title = "主题管理-主题上传", businessType = BusinessType.INSERT)
	@ResponseBody
	public AjaxResult themeUpload(@RequestParam("themeFile") MultipartFile file, @RequestParam(value ="covery", defaultValue = "false", required = false) boolean covery,HttpServletRequest request
			)
			throws Throwable {
		if (!StringUtils.endsWithIgnoreCase(file.getOriginalFilename(), ".zip")) {
			return AjaxResult.error("不支持压缩类型,请上传zip压缩包");
		}

		try {
			if (!file.isEmpty()) {
				String fileName = OssUtils.getFileName(file.getOriginalFilename());
				String filePrefix=fileName.substring(0, fileName.lastIndexOf("."));
				// 获取项目根路径,jar所在的目录
				final File basePath = new File(ResourceUtils.getURL("classpath:").getPath());  
				// 构建路径
				final File themePath = new File(basePath.getAbsolutePath(),
						new StringBuffer("templates/themes/").append(fileName).toString());
				final File par = new File(themePath.getParent());	
				// 判断是否存在(多模块.jar的内容不向外暴露)
				if (!par.exists()) {
					par.mkdirs();
				}
				// 判断主题是否已经上传 是否可以覆盖上传
				if (new File(themePath.getParent(),"/"+filePrefix).exists()) {
					if (covery) {
						themeService.uploadTheme(file, themePath);
					}
					else {
						return new AjaxResult(Type.ERROR, "文件已经存在！", null);
					}
				} else {
					themeService.uploadTheme(file, themePath);
				}

			} else {
				return new AjaxResult(Type.ERROR, "文件不能为空！", null);
			}
		} catch (Exception e) {
			return new AjaxResult(Type.ERROR, "服务异常！", e.getMessage());
		}
		return AjaxResult.success("上传成功！");
	}
	/**
	 * 启用主题
	 * @return
	 * @throws FileNotFoundException 
	 */
	@Log(title = "主题管理-主题设置", businessType = BusinessType.UPDATE)
	@PostMapping("/setTheme")
	@RequiresPermissions("cms:theme:edit")
	@ResponseBody
	public AjaxResult setTheme(String themeName) throws FileNotFoundException {
		if(themeName.equals(redisUtils.get1(ThemeEnums.DEFAULT_THEME.getValue()))) {
			return AjaxResult.error("Theme is used");
		}
		
		if(themeService.setTheme(themeName)==0)
		{   
			return AjaxResult.error("set fial");
		}
		return AjaxResult.success("set Success");
	}
	@Log(title = "主题管理-主题删除", businessType = BusinessType.DELETE)
	@PostMapping("/deleteTheme")
	@RequiresPermissions("cms:theme:remove")
	@ResponseBody
	public AjaxResult deleteTheme(String themeName) throws FileNotFoundException {
		if(ThemeEnums.DEFAULT_THEME.getValue().equals(themeName))
		{   
			return AjaxResult.error("系统主题不允许删除");
		}
		if(themeName.equals(redisUtils.get(ThemeEnums.THEME_USED.getValue())))
		{
			return AjaxResult.error("当前主题启用,不允许删除");
		}
		if(themeService.deleteByName(themeName)==0)
		{   
			return AjaxResult.error("删除失败");
		}
		return AjaxResult.success("删除成功");
	}

	/**
	 * 获取启用主题
	 * @return
	 */
	@GetMapping("/getThemeUsed")
	@RequiresPermissions("cms:theme:update")
	@ResponseBody
	public AjaxResult getThemeUsed() {
		return AjaxResult.success("get used theme success!",themeService.selectThemeByUsed());
	}

	/**
	 * 获取主题文件
	 * 不获取默认主题
	 * @return
	 */
	@GetMapping("/treeData")
	@RequiresPermissions("cms:theme:view")
	@ResponseBody
	public List<ThemeTreeNode> getThemeFiles(String path) throws FileNotFoundException {
		if("".equals(path)||path==null)
		{
			path="";
		}
	     List<ThemeTreeNode> themeTreeNodes=new ArrayList<>();
		// 获取项目根路径
		final File basePath = new File(ResourceUtils.getURL("classpath:").getPath());
		// 获取主题路径
		final File themesPath = new File(basePath.getAbsolutePath(), "templates/themes");
		// 默认无法获取内置配置文件
		listFile(themesPath,path,themeTreeNodes);
		return themeTreeNodes;
	}

	/**
	 * 获取文件内容
	 * @param path
	 * @return
	 */
	@GetMapping("/themeContent")
	@RequiresPermissions("cms:theme:view")
	@ResponseBody
	public AjaxResult themeContent(String path) throws FileNotFoundException {

		if (!"html|js|css|txt|json".contains(FileTypes.getSuffex(path)))
		{
			return AjaxResult.error("不支持文件类型！");
		}
		// 获取项目根路径
		final File basePath = new File(ResourceUtils.getURL("classpath:").getPath());
		// 获取文件路径
		final File themesPath = new File(basePath.getAbsolutePath(), "templates/themes"+path);
		if(!themesPath.exists())
		{
			return AjaxResult.error("文件不存在");
		}
		if(themesPath.isDirectory())
		{
			return AjaxResult.error("所选文件为文件夹！");
		}
		return AjaxResult.success(readFileContent(themesPath));
	}
	@Log(title = "主题管理-保存主题内容", businessType = BusinessType.UPDATE)
	@PostMapping("/themeContentSave")
	@RequiresPermissions("cms:theme:edit")
	@ResponseBody
	public AjaxResult themeContentSave(String path,String content) throws FileNotFoundException {
		// 获取项目根路径
		final File basePath = new File(ResourceUtils.getURL("classpath:").getPath());
		// 获取文件路径
		final File themesPath = new File(basePath.getAbsolutePath(), "templates/themes"+path);
		writetxtfile(content,themesPath.toString());
		return AjaxResult.success();
	}

	/**
	 * 遍历主题文件
	 * @param dir
	 * @param prefix
	 * @param themeList
	 */
	public static void listFile(File dir, String prefix, List<ThemeTreeNode> themeList)
	{
		File[] files=dir.listFiles();
		if (null != files) {
			for (File file : files) {
				ThemeTreeNode themeTreeNode=new ThemeTreeNode();
				themeTreeNode.setParentId(prefix);
				themeTreeNode.setpId(prefix);
				themeTreeNode.setId(prefix+"/"+file.getName());
				themeTreeNode.setName(file.getName());
				themeTreeNode.setTitle(file.getName());
				if(file.isDirectory()){
					themeTreeNode.setParent(file.isDirectory());
					listFile(file,prefix+"/"+file.getName(),themeList);
				}
				themeList.add(themeTreeNode);
			}
		}
	}

	public static String readFileContent(File file) {
		BufferedReader reader = null;
		StringBuffer sbf = new StringBuffer();
		try {
			reader = new BufferedReader(new FileReader(file));
			String tempStr;
			while ((tempStr = reader.readLine()) != null) {
				sbf.append(tempStr);
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
	//写入txt内容 覆盖原内容
	public static boolean writetxtfile(String Content,String filepath) {
		boolean flag=false;
		try {
			//写入的txt文档的路径
			PrintWriter pw=new PrintWriter(filepath);
			//写入的内容
			pw.write(Content);
			pw.flush();
			pw.close();
			flag=true;
		}catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
}
