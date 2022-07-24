package com.oly.cms.admin.controller.page;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.oly.cms.common.domain.entity.CmsArticle;
import com.oly.cms.common.domain.entity.CmsTag;
import com.oly.cms.admin.model.vo.ArticleVo;
import com.oly.cms.admin.service.impl.CmsArticleServiceImpl;
import com.oly.cms.admin.service.impl.CmsCatServiceImpl;
import com.oly.cms.admin.service.impl.CmsTagServiceImpl;
import com.oly.cms.admin.service.impl.CmsThemeServiceImpl;
import com.oly.cms.admin.web.CmsCommonController;
import com.oly.cms.common.model.properties.OlyWebConfigProperties;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.text.Convert;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.enums.CommonVisibleEnums;
import com.ruoyi.common.enums.OperateTitle;
import com.ruoyi.common.exception.file.FileSizeLimitExceededException;
import com.ruoyi.common.exception.file.InvalidExtensionException;
import com.ruoyi.common.utils.ShiroUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.file.MimeExtxensionEnum;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.oss.domain.OlyOss;
import com.ruoyi.oss.factory.OssFactory;
import com.ruoyi.oss.properties.OssConfigProperties;
import com.ruoyi.system.config.service.ISysConfigService;
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

/** 文章管理 */
@Controller
@RequestMapping("/cms/article")
public class CmsArticleController extends CmsCommonController {
	@Autowired
	private CmsCatServiceImpl cmsCatService;
	@Autowired
	private CmsTagServiceImpl cmsTagService;
	@Autowired
	private CmsArticleServiceImpl articleService;
	@Autowired
	private CmsThemeServiceImpl themeServiceImpl;
	@Autowired
	private ISysConfigService configService;
	@Autowired
	private OssFactory ossHandler;
	private String prefix = acceptPrefix + "article";

	/**
	 * 文章管理/列表 视图
	 * 
	 * @return
	 */
	@RequiresPermissions("cms:article:view")
	@GetMapping
	public String article(ModelMap map) {
		map.put("themeNames", themeServiceImpl.listThemeNames());
		CmsTag cmsTag = new CmsTag();
		cmsTag.setVisible(CommonVisibleEnums.SHOW.ordinal());
		map.put("tags", cmsTagService.listCmsTagByTag(cmsTag));
		return prefix + "/article";
	}

	/**
	 * 文章列表
	 * 
	 * @param artVo
	 * @return
	 */
	@RequiresPermissions("cms:article:list")
	@PostMapping("/list")
	@ResponseBody
	public TableDataInfo list(ArticleVo artVo) {
		String configGroup = artVo.getParams().get("supportTheme").toString();
		if (StringUtils.isNotEmpty(configGroup)) {
			artVo.getParams().put("supportTheme", StringUtils.isEmpty(
					configService.selectConfigDefauleValue(configGroup.toString(),
							OlyWebConfigProperties.ARTICLE_TYPES))
									? ""
									: configGroup);
		}
		startPage();
		List<CmsArticle> list = articleService.listCmsArticle(artVo);
		return getDataTable(list);
	}

	/**
	 * 导出文章模板
	 */
	@RequiresPermissions("cms:article:export")
	@Log(title = OperateTitle.CMS_POST, businessType = BusinessType.EXPORT)
	@PostMapping("/export")
	@ResponseBody
	public AjaxResult export(ArticleVo artVo) {
		List<CmsArticle> list = articleService.listCmsArticle(artVo);
		ExcelUtil<CmsArticle> util = new ExcelUtil<CmsArticle>(CmsArticle.class);
		return util.exportExcel(list, "template");
	}

	/**
	 * 添加文章 视图
	 * 
	 * @param mmap
	 * @return
	 */
	@GetMapping("/add/{build}")
	@RequiresPermissions("cms:article:add")
	public String add(ModelMap mmap, @PathVariable("build") Integer build) {
		mmap.put("catId", 0L);
		mmap.put("catName", "根类目");
		if (build == 1) {
			return prefix + "/editor/add_markdown";
		}
		return prefix + "/editor/add_froala";
	}

	/**
	 * 添加文章说明 1.默认审核中 2.必须有一个可用分类(后期可以隐藏)
	 * 
	 * @param artVo
	 * @return
	 */
	@Log(title = OperateTitle.CMS_POST, businessType = BusinessType.INSERT)
	@RequiresPermissions("cms:article:add")
	@PostMapping("/add")
	@ResponseBody
	public AjaxResult add(ArticleVo artVo) {
		artVo.setCreateBy(ShiroUtils.getUserIdStr());
		Integer cats[] = articleService.filterCats(artVo.getCats());
		if (cats.length < 0) {
			return AjaxResult.error("必须保证一个有效分类！");
		}
		artVo.setCats(cats);
		return toAjax(articleService.insertCmsArticle(artVo));
	}

	/**
	 * 修改文章 视图
	 * 
	 * @param articleId
	 * @param mmap
	 * @return
	 */
	@RequiresPermissions("cms:article:edit")
	@GetMapping("/edit/{articleId}")
	public String editArticleView(@PathVariable("articleId") Long articleId, ModelMap mmap) {
		CmsArticle article = articleService.selectCmsArticleById(articleId);
		mmap.put("article", article);
		mmap.put("cats", cmsCatService.listCmsCatByArticleId(articleId));
		mmap.put("tags", cmsTagService.listCmsTagByArticleId(articleId));
		if (article.getArticleBuild() == 1) {
			return prefix + "/editor/edit_markdown";
		}
		return prefix + "/editor/edit_froala";
	}

	/**
	 * 修改文章
	 * 
	 * @param art
	 * @return
	 */
	@Log(title = OperateTitle.CMS_POST, businessType = BusinessType.UPDATE)
	@RequiresPermissions("cms:article:edit")
	@PostMapping("/edit")
	@ResponseBody
	public AjaxResult editSave(CmsArticle art) {
		art.setUpdateBy(ShiroUtils.getUserIdStr());
		return toAjax(articleService.updateCmsArticleById(art));
	}

	/**
	 * 删除文章
	 * 
	 * @param ids
	 * @return
	 */
	@Log(title = OperateTitle.CMS_POST, businessType = BusinessType.DELETE)
	@RequiresPermissions("cms:article:remove")
	@PostMapping("/remove")
	@ResponseBody
	public AjaxResult remove(String ids) {
		Long[] articleIds = Convert.toLongArray(ids);
		return toAjax(articleService.deleteCmsArticleByIds(articleIds));
	}

	/**
	 * 文章顶置操作
	 * 
	 * @param articleIds
	 * @return
	 */
	@PostMapping("/editArticleTop")
	@Log(title = OperateTitle.CMS_POST, businessType = BusinessType.UPDATE)
	@RequiresPermissions("cms:article:edit")
	@ResponseBody
	public AjaxResult editArticleTop(String articleIds, int articleTop) {
		Long[] ids = Convert.toLongArray(articleIds);
		return toAjax(articleService.updateArticleTop(ids, articleTop));
	}

	/**
	 * 文章状态操作
	 * 
	 * @param articleIds
	 * @param visible
	 * @return
	 */
	@PostMapping("/editVisible")
	@Log(title = OperateTitle.CMS_POST, businessType = BusinessType.UPDATE)
	@RequiresPermissions("cms:article:edit")
	@ResponseBody
	public AjaxResult editVisible(String articleIds, Integer visible) {
		Long[] ids = Convert.toLongArray(articleIds);
		return toAjax(articleService.updateVisible(ids, visible));
	}

	/**
	 * 标签批量关联文章
	 * 
	 * @param articleIds
	 * @return
	 */
	@PostMapping("/addTagArticles")
	@Log(title = OperateTitle.CMS_POST, businessType = BusinessType.UPDATE)
	@RequiresPermissions("cms:article:edit")
	@ResponseBody
	public AjaxResult addTagArticles(String articleIds, Long tagId) {
		Long[] ids = Convert.toLongArray(articleIds);
		int success = 0;
		for (Long id : ids) {
			success += articleService.addTagArticle(id, tagId);
		}
		return toAjax(success);
	}

	/**
	 * 分类批量关联文章
	 * 
	 * @param articleIds
	 * @return
	 */
	@PostMapping("/addCatArticles")
	@Log(title = OperateTitle.CMS_POST, businessType = BusinessType.UPDATE)
	@RequiresPermissions("cms:article:edit")
	@ResponseBody
	public AjaxResult addCatArticles(String articleIds, Long catId) {
		Long[] ids = Convert.toLongArray(articleIds);
		int success = 0;
		for (Long id : ids) {
			success += articleService.addCatArticle(id, catId);
		}
		return toAjax(success);
	}

	/**
	 * 标签批量解除关联文章
	 * 
	 * @param articleIds
	 * @return
	 */
	@PostMapping("/removeTagArticles")
	@Log(title = OperateTitle.CMS_POST, businessType = BusinessType.UPDATE)
	@RequiresPermissions("cms:article:edit")
	@ResponseBody
	public AjaxResult removeTagArticles(String articleIds, Long tagId) {
		Long[] ids = Convert.toLongArray(articleIds);
		int success = 0;
		for (Long id : ids) {
			success += articleService.removeTagArticle(id, tagId);
		}
		return toAjax(success);
	}

	/**
	 * 分类批量解除关联文章
	 * 
	 * @param articleIds
	 * @return
	 */
	@PostMapping("/removeCatArticles")
	@Log(title = OperateTitle.CMS_POST, businessType = BusinessType.UPDATE)
	@RequiresPermissions("cms:article:edit")
	@ResponseBody
	public AjaxResult removeCatArticles(String articleIds, Long catId) {
		Long[] ids = Convert.toLongArray(articleIds);
		int success = 0;
		for (Long id : ids) {
			success += articleService.removeCatArticle(id, catId);
		}
		return toAjax(success);
	}

	/**
	 * 关联文章分类
	 * 
	 * @param articleId
	 * @param catId
	 * @return
	 */
	@PostMapping("/addCatArticle")
	@Log(title = OperateTitle.CMS_POST, businessType = BusinessType.UPDATE)
	@RequiresPermissions("cms:article:edit")
	@ResponseBody
	public AjaxResult addCatArticle(Long articleId, Long catId) {
		return toAjax(articleService.addCatArticle(articleId, catId));
	}

	@PostMapping("/removeCatArticle")
	@RequiresPermissions("cms:article:delete")
	@ResponseBody
	public AjaxResult removeCatArticle(Long articleId, Long catId) {

		return toAjax(articleService.removeCatArticle(articleId, catId));
	}

	@PostMapping("/addTagArticle")
	@Log(title = OperateTitle.CMS_POST, businessType = BusinessType.UPDATE)
	@RequiresPermissions("cms:article:edit")
	@ResponseBody
	public AjaxResult addTagArticle(Long articleId, Long tagId) {

		return toAjax(articleService.addTagArticle(articleId, tagId));
	}

	@PostMapping("/removeTagArticle")
	@RequiresPermissions("cms:article:delete")
	@ResponseBody
	public AjaxResult removeTagArticle(Long articleId, Long tagId) {

		return toAjax(articleService.removeTagArticle(articleId, tagId));
	}

	/**
	 * 校验url名称
	 * 
	 * @param articleUrl
	 * @param articleId
	 * @return
	 */
	@PostMapping("/checkArticleUnique")
	@ResponseBody
	public String checkArticleUnique(CmsArticle cmsArticle) {

		return articleService.checkArticleUnique(cmsArticle);
	}

	/**
	 * 上传文章 图片 froala
	 * 
	 * @param file
	 * @return
	 * @throws IOException
	 * @throws InvalidExtensionException
	 * @throws FileSizeLimitExceededException
	 */
	@PostMapping("/articleImgByFroala")
	@Log(title = OperateTitle.SYS_OSS, businessType = BusinessType.INSERT)
	@ResponseBody
	public String articleImgUploadFroala(@RequestParam("file") MultipartFile file)
			throws FileSizeLimitExceededException, InvalidExtensionException, IOException {
		Map<String, String> mp = new HashMap<>();
		OlyOss resultData = uploadImg(file);
		mp.put("uploaded", true + "");
		mp.put("link", resultData.getDomain() + resultData.getFk());
		mp.put("msg", "上传成功");
		ObjectMapper mo = new ObjectMapper();
		return mo.writeValueAsString(mp);
	}

	/**
	 * 上传文章 图片 Markdown
	 * 
	 * @param file
	 * @return
	 * @throws IOException
	 * @throws InvalidExtensionException
	 * @throws FileSizeLimitExceededException
	 */
	@PostMapping("/articleImgByMarkdown")
	@Log(title = OperateTitle.SYS_OSS, businessType = BusinessType.INSERT)
	@ResponseBody
	public String articleImgUploadMarkdown(@RequestParam("editormd-image-file") MultipartFile file)
			throws FileSizeLimitExceededException, InvalidExtensionException, IOException {
		Map<String, Object> mp = new HashMap<>();
		OlyOss resultData = uploadImg(file);
		mp.put("success", 1);
		mp.put("url", resultData.getDomain() + resultData.getFk());
		mp.put("message", "上传成功");
		ObjectMapper mo = new ObjectMapper();
		return mo.writeValueAsString(mp);
	}

	private OlyOss uploadImg(MultipartFile file)
			throws FileSizeLimitExceededException, InvalidExtensionException, IOException {
		String groupName = OssConfigProperties.OSS_CONFIG_GROUP.defaultValue();
		int maxLength = Integer.parseInt(
				configService.selectConfigDefauleValue(groupName, OssConfigProperties.OSS_FILE_NAME_MAX_LENGTH));
		long maxSize = Long
				.parseLong(configService.selectConfigDefauleValue(groupName, OssConfigProperties.OSS_FILE_MAX_SIZE));
		boolean chan = Boolean.parseBoolean(
				configService.selectConfigDefauleValue(groupName, OssConfigProperties.OSS_FILE_NAME_ZH_PY));
		return ossHandler.get().ossUpload(file, maxLength, maxSize, chan,
				new String[] { MimeExtxensionEnum.IMAGE.name().toLowerCase() }).getData();
	}

}
