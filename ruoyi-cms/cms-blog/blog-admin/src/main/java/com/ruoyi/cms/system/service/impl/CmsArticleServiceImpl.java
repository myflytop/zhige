package com.ruoyi.cms.system.service.impl;
import cn.hutool.core.convert.Convert;
import cn.hutool.core.util.StrUtil;
import com.ruoyi.cms.system.mapper.CmsArticleLiquidMapper;
import com.ruoyi.cms.system.model.CmsConstants;
import com.ruoyi.cms.system.model.po.CmsCat;
import com.ruoyi.cms.system.model.po.CmsTag;
import com.ruoyi.framework.web.domain.server.Sys;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.ruoyi.cms.system.mapper.CmsArticleMapper;
import com.ruoyi.cms.system.model.po.CmsArticle;
import com.ruoyi.cms.system.model.vo.ArticleVo;
import com.ruoyi.cms.system.service.ICmsArticleService;

import java.util.List;

@Service
public class CmsArticleServiceImpl implements ICmsArticleService {
	@Autowired
	private CmsArticleMapper articleMapple;

	@Autowired
    private CmsArticleLiquidMapper cmsArticleLiquidMapper;
	/**
	 * 先插入文章
	 * 获取文章id
	 * 插入标签
	 * 插入分类
	 * @param arVo
	 * @return
	 */
	@Transactional
	@Override
	public int insertCmsArticle(ArticleVo arVo) {
		int uqin = articleMapple.checkUrlAndTitleUnique(arVo.getArticleUrl(), arVo.getArticleTitle(), null);
		if (uqin == 0) {
			CmsArticle art = new CmsArticle();
			art.setAllowComment(arVo.getAllowComment());
			art.setArticleBuild(arVo.getArticleBuild());
			art.setArticleContent(arVo.getArticleContent());
			art.setArticleImg(arVo.getArticleImg());
			art.setArticleType(arVo.getArticleType());
			art.setArticleSummary(arVo.getArticleSummary());
			art.setArticleTitle(arVo.getArticleTitle());
			art.setCreateBy(arVo.getCreateBy());
			art.setReprintUrl(arVo.getReprintUrl());
			art.setArticleUrl(arVo.getArticleUrl());
			art.setKeywords(arVo.getKeywords());
			art.setArticleTop((byte) 0);
			art.setVisible((byte) 1);
            //插入文章
			articleMapple.insertCmsArticle(art);
			arVo.setArticleId(art.getArticleId());
			//插入标签
			if (arVo.getTags()!=null&&arVo.getTags().length > 0) {
				//验证标签是否存在|过滤不存在的标签
				Integer ts[]=cmsArticleLiquidMapper.filterTags(arVo.getTags());
				cmsArticleLiquidMapper.insertCmsArticleTags(art.getArticleId(), ts);
			}
			//插入分类
			if (arVo.getCats()!=null&&arVo.getCats().length > 0) {
				//验证分类是否存在|过滤不存在的分类
				Integer cs[]=cmsArticleLiquidMapper.filterCats(arVo.getTags());
				cmsArticleLiquidMapper.insertCmsArticleCats(art.getArticleId(), cs);

			}
			//插入文章相关统计
			cmsArticleLiquidMapper.insertCmsArticleCount(art.getArticleId());


			return 1;
		}
		return 0;
	}

	@Override
	public int deleteCmsArticleById(Long id) {
		return articleMapple.deleteCmsArticleById(id);
	}

	/**
	 * 删除关联cat 删除关联tag,批量删除文章
	 */
	@Override
	public int deleteCmsArticleByIds(Long[] articleIds) {
		cmsArticleLiquidMapper.deleteArticleTagByIds(articleIds);
		cmsArticleLiquidMapper.deleteArticleCatByIds(articleIds);
		cmsArticleLiquidMapper.deleteCmsCommentByIds(articleIds);
		cmsArticleLiquidMapper.deleteCmsCommentRecordByIds(articleIds);
		cmsArticleLiquidMapper.deleteCmsCollectRecordByIds(articleIds);
		cmsArticleLiquidMapper.deleteCmsLookRecordByIds(articleIds);
		cmsArticleLiquidMapper.deleteCmsLikeRecordByIds(articleIds);
		cmsArticleLiquidMapper.deleteCmsNastyRecordByIds(articleIds);
		cmsArticleLiquidMapper.deleteCmsShareRecordByIds(articleIds);
		cmsArticleLiquidMapper.deleteCmsScoreRecordByIds(articleIds);
		cmsArticleLiquidMapper.deleteCmsArticleCountByIds(articleIds);
		return articleMapple.deleteCmsArticleByIds(articleIds);
	}

	@Override
	public int updateArticleTop(Long[] articleIds, Long articleTop) {
		return articleMapple.updateArticleTop(articleIds,articleTop);
	}

	@Override
	public CmsArticle getCmsArticleById(Long id) {
		return articleMapple.getCmsArticleById(id);
	}

	@Override
	public List<CmsArticle> listCmsArticle(ArticleVo artVo) {
		return articleMapple.listCmsArticle(artVo);
	}

	@Override
	public int updateCmsArticleById(CmsArticle cmsArticle) {
		if(cmsArticle.getArticleTitle()==null&&cmsArticle.getArticleId()!=null)
		{
			return articleMapple.updateCmsArticleById(cmsArticle);
		}
		//修改文章
		if (articleMapple.checkUrlAndTitleUnique(cmsArticle.getArticleUrl(), cmsArticle.getArticleTitle(),
				cmsArticle.getArticleId()) == 0) {
			return articleMapple.updateCmsArticleById(cmsArticle);
		}
		return -1;
	}

	@Override
	public String checkArticleUrl(String articleUrl, Long articleId) {
		if(StrUtil.hasEmpty(articleUrl))
		{
			return CmsConstants.UNIQUE;
		}
		if(articleMapple.checkArticleUrlUnique(articleUrl,articleId)==0)
		{
			return CmsConstants.UNIQUE;
		}
		return CmsConstants.NOT_UNIQUE;
	}

	@Override
	public String checkArticleTitle(String articleTitle, Long articleId) {
		if(articleMapple.checkArticleTitleUnique(articleTitle,articleId)==0)
		{
			return CmsConstants.UNIQUE;
		}
		return CmsConstants.NOT_UNIQUE;
	}

	/**
	 * 关联分类文章
	 * @param articleId
	 * @param catId
	 * @return
	 */
	@Override
	public int addCatArticle(Long articleId, Long catId) {
		Integer sc[]= Convert.toIntArray(catId);
		sc=cmsArticleLiquidMapper.filterCats(sc);
		if (sc==null||sc.length==0)
		{
			return 0;
		}
		return cmsArticleLiquidMapper.insertCatArticle(articleId,catId);
	}

	@Override
	public int removeCatArticle(Long articleId, Long catId) {
		return cmsArticleLiquidMapper.deleteCatArticle(articleId,catId);
	}

	/**
	 * 关联标签文章
	 * @param articleId
	 * @param tagId
	 * @return
	 */
	@Override
	public int addTagArticle(Long articleId, Long tagId) {
		return cmsArticleLiquidMapper.insertTagArticle(articleId,tagId);
	}

	@Override
	public int removeTagArticle(Long articleId, Long tagId) {
		Integer ts[]= Convert.toIntArray(tagId);
		ts=cmsArticleLiquidMapper.filterCats(ts);
		if (ts==null||ts.length==0)
		{
			return 0;
		}
		return cmsArticleLiquidMapper.deleteTagArticle(articleId,tagId);
	}

	@Override
	public int updateVisible(Long[] ids, Byte visible) {
		return articleMapple.updateVisible(ids,visible);
	}


}
