package com.ruoyi.cms.web.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ruoyi.cms.system.service.impl.CmsTagServiceImpl;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.oss.api.ResultData;
import com.ruoyi.oss.factory.OssFactory;
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

import com.fasterxml.jackson.databind.ObjectMapper;
import com.ruoyi.cms.system.model.po.CmsArticle;
import com.ruoyi.cms.system.model.po.CmsCat;
import com.ruoyi.cms.system.model.vo.ArticleVo;
import com.ruoyi.cms.system.service.impl.CmsArticleServiceImpl;
import com.ruoyi.cms.system.service.impl.CmsCatServiceImpl;
import com.ruoyi.common.config.Global;
import com.ruoyi.common.constant.UserConstants;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.Ztree;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.text.Convert;
import com.ruoyi.framework.util.ShiroUtils;
/**
 * 文章 控制层
 * 
 * @author bobey
 * 
 */
@Controller
@RequestMapping("/cms/article")
public class CmsArticleController extends BaseController {
	@Autowired
	private CmsCatServiceImpl cmsCatService;
	@Autowired
	private CmsTagServiceImpl cmsTagService;
	@Autowired
	private CmsArticleServiceImpl articleService;
	@Autowired
	private OssFactory ossHandler;
	private static final String prefix = "blog/admin/article";
	/**
	 * 文章管理/列表 视图
	 * @return
	 */
	@RequiresPermissions("cms:article:view")
	@GetMapping
	public String article() {
		return prefix + "/article";
	}

	/**
	 * 文章列表
	 * @param artVo
	 * @return
	 */
	@RequiresPermissions("cms:article:list")
	@PostMapping("/list")
	@ResponseBody
	public TableDataInfo list(ArticleVo artVo) {
		startPage();
		List<CmsArticle> list = articleService.listCmsArticle(artVo);
		return getDataTable(list);
	}

	/**
	 * 导出文章模板
	 */
	@RequiresPermissions("cms:article:export")
	@Log(title = "数据模板", businessType = BusinessType.EXPORT)
	@PostMapping("/export")
	@ResponseBody
	public AjaxResult export(ArticleVo artVo)
	{
		List<CmsArticle> list = articleService.listCmsArticle(artVo);
		ExcelUtil<CmsArticle> util = new ExcelUtil<CmsArticle>(CmsArticle.class);
		return util.exportExcel(list, "template");
	}

	/**
	 * 添加文章 视图
	 * @param mmap
	 * @return
	 */
	@GetMapping("/add")
	@RequiresPermissions("cms:article:add")
	public String add(ModelMap mmap) {
		mmap.put("catId",0L );
		mmap.put("catName", "根类目");		
		return prefix + "/add";
	}

	/**
	 * 添加文章
	 * @param artVo
	 * @return
	 */
	@Log(title = "内容文章管理", businessType = BusinessType.INSERT)
	@RequiresPermissions("cms:article:add")
	@PostMapping("/add")
	@ResponseBody
	public AjaxResult add(ArticleVo artVo) {
	
		artVo.setCreateBy(ShiroUtils.getUserId());
		if(articleService.insertCmsArticle(artVo)==1)
		{
			return AjaxResult.success("添加成功！");
		}
		else
		{
			return AjaxResult.error("验证未通过，请检查！");
		}
	}

	/**
	 * 修改文章 视图
	 * @param articleId
	 * @param mmap
	 * @return
	 */
	@RequiresPermissions("cms:article:edit")
	@GetMapping("/edit/{articleId}")
	public String editArticleView(@PathVariable("articleId") Long articleId,ModelMap mmap) {
		mmap.put("article", articleService.getCmsArticleById(articleId));
		mmap.put("cats",cmsCatService.listCmsCatByArticleTagId(articleId));
		mmap.put("tags",cmsTagService.listCmsTagByArticleTagId(articleId));
		return prefix + "/edit";
	}

	/**
	 * 修改文章
	 * @param art
	 * @return
	 */
	@Log(title = "内容文章管理", businessType = BusinessType.UPDATE)
	@RequiresPermissions("cms:article:edit")
	@PostMapping("/edit")
	@ResponseBody
	public AjaxResult editSave(CmsArticle art) {
		art.setUpdateBy(ShiroUtils.getUserId());
		if(articleService.updateCmsArticleById(art)==1)
		{
			return AjaxResult.success("修改成功！");
		}
		else
		{
		return AjaxResult.error("验证未通过，请检查！");
		}
	}

	/**
	 * 删除文章
	 * @param ids
	 * @return
	 */
	@Log(title = "内容文章管理", businessType = BusinessType.DELETE)
	@RequiresPermissions("cms:article:remove")
	@PostMapping("/remove")
	@ResponseBody
	public AjaxResult remove(String ids) {
		Long[] articleIds = Convert.toLongArray(ids);
		return toAjax(articleService.deleteCmsArticleByIds(articleIds));
	}



	/**
	 * 文章顶置操作
	 * @param articleIds
	 * @return
	 */
	@PostMapping("/editArticleTop")
	@Log(title = "内容文章管理", businessType = BusinessType.UPDATE)
	@RequiresPermissions("cms:article:edit")
	@ResponseBody
	public AjaxResult editArticleTop(String articleIds,Long articleTop ) {
		Long[] ids = Convert.toLongArray(articleIds);
		return toAjax(articleService.updateArticleTop(ids,articleTop));
	}

	/**
	 * 文章状态操作
	 * @param articleIds
	 * @return
	 */
	@PostMapping("/editVisible")
	@Log(title = "内容文章管理", businessType = BusinessType.UPDATE)
	@RequiresPermissions("cms:article:edit")
	@ResponseBody
	public AjaxResult editVisible(String articleIds,Byte visible ) {
		Long[] ids = Convert.toLongArray(articleIds);
		return toAjax(articleService.updateVisible(ids,visible));
	}

	/**
	 * 关联文章分类
	 * @param articleId
	 * @param catId
	 * @return
	 */
	@PostMapping("/addCatArticle")
	@Log(title = "内容文章管理", businessType = BusinessType.UPDATE)
	@RequiresPermissions("cms:article:edit")
	@ResponseBody
    public AjaxResult addCatArticle(Long articleId,Long catId){

		return toAjax(articleService.addCatArticle(articleId,catId));
	}

	@PostMapping("/removeCatArticle")
	@RequiresPermissions("cms:article:delete")
	@ResponseBody
	public AjaxResult removeCatArticle(Long articleId,Long catId){

		return toAjax(articleService.removeCatArticle(articleId,catId));
	}

	@PostMapping("/addTagArticle")
	@Log(title = "内容文章管理", businessType = BusinessType.UPDATE)
	@RequiresPermissions("cms:article:edit")
	@ResponseBody
	public AjaxResult addTagArticle(Long articleId,Long tagId){

		return	toAjax(articleService.addTagArticle(articleId,tagId));
	}

	@PostMapping("/removeTagArticle")
	@RequiresPermissions("cms:article:delete")
	@ResponseBody
	public AjaxResult removeTagArticle(Long articleId,Long tagId){

		return toAjax(articleService.removeTagArticle(articleId,tagId));
	}


	/**
	 * 校验url名称
	 * @param articleUrl
	 * @param articleId
	 * @return
	 */
	@PostMapping("/checkArticleUrl")
	@ResponseBody
	public String checkArticleUrl(String articleUrl,Long articleId){

		return articleService.checkArticleUrl(articleUrl,articleId);
	}

	/**
	 * 校验Title名称
	 * @param articleTitle
	 * @param articleId
	 * @return
	 */
	@PostMapping("/checkArticleTitle")
	@ResponseBody
	public String checkArticleTitle(String articleTitle,Long articleId) {
		
		return articleService.checkArticleTitle(articleTitle,articleId);
	}

	/**
	 * 上传文章 图片
	 * @param file
	 * @return
	 * @throws IOException
	 */
	@PostMapping("/articleImg")
	@Log(title = "文章上传图片", businessType = BusinessType.INSERT)
	@ResponseBody
	public String articleImmUpload(@RequestParam("file") MultipartFile file) throws IOException {
        Map mp=new HashMap();
		ResultData resultData=ossHandler.get().ossUpload(file,null).getData();
		System.err.println(resultData);
        mp.put("uploaded", true+"");
		mp.put("link", resultData.getDomain()+resultData.getFilePath());
        mp.put("msg","上传成功");
        ObjectMapper mo=new ObjectMapper();
        return mo.writeValueAsString(mp);
	}
	
}
