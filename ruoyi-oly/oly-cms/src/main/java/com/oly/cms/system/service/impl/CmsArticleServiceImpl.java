package com.oly.cms.system.service.impl;

import java.util.List;

import com.oly.cms.system.mapper.CmsArticleLiquidMapper;
import com.oly.cms.system.mapper.CmsArticleMapper;
import com.oly.cms.system.model.CmsConstants;
import com.oly.cms.system.model.po.CmsArticle;
import com.oly.cms.system.model.vo.ArticleVo;
import com.oly.cms.system.service.ICmsArticleService;
import com.oly.common.constant.CacheConstant;
import com.oly.common.model.properties.OlyCmsConfigPropetries;
import com.oly.framework.event.CacheWebRefreshEvent;
import com.ruoyi.common.exception.BusinessException;
import com.ruoyi.system.service.impl.SysConfigServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import cn.hutool.core.convert.Convert;
import cn.hutool.core.util.StrUtil;

@Service
public class CmsArticleServiceImpl implements ICmsArticleService {

	@Autowired
	private ApplicationEventPublisher app;
	@Autowired
	private CmsArticleMapper articleMapper;
	@Autowired
	private CmsArticleLiquidMapper cmsArticleLiquidMapper;
	@Autowired
	private SysConfigServiceImpl configService;

	/**
	 * 先插入文章 获取文章id 插入标签 插入分类
	 * 
	 * @param arVo
	 * @return
	 */
	@Transactional
	@Override
	public int insertCmsArticle(ArticleVo arVo) {
		int uqin = articleMapper.checkUrlAndTitleUnique(arVo.getArticleUrl(), arVo.getArticleTitle(), null);
		if (uqin == 0) {
			CmsArticle art = arVo;
			// 顶置默认
			art.setArticleTop(0);
			// 状态默认审核中
			art.setVisible(Integer.parseInt(
					configService.selectConfigByKey(OlyCmsConfigPropetries.ARTICLE_VISIBLE_DEFAULT.getValue())));
			// 插入文章
			int reInsertNum = articleMapper.insertCmsArticle(art);
			arVo.setArticleId(art.getArticleId());
			// 插入标签
			if (arVo.getTags().length > 0) {
				// 验证标签是否存在|过滤不存在的标签
				Integer ts[] = cmsArticleLiquidMapper.filterTags(arVo.getTags());
				if (ts.length > 0)
					// 插入关联标签
					cmsArticleLiquidMapper.insertCmsArticleTags(art.getArticleId(), ts);
				cmsArticleLiquidMapper.updateCmsTagCountByIds(ts);

			}
			// 插入关联分类
			cmsArticleLiquidMapper.insertCmsArticleCats(art.getArticleId(), arVo.getCats());
			cmsArticleLiquidMapper.updateCmsCatCountByIds(arVo.getCats());
			// 插入文章相关统计
			cmsArticleLiquidMapper.insertCmsArticleCount(art.getArticleId());
			app.publishEvent(new CacheWebRefreshEvent(this, CacheConstant.POSTS_CACHE_KEY_PREFIX));
			return reInsertNum;
		} else {
			throw new BusinessException("参数验证校验失败,请检查！");
		}
	}

	/**
	 * 删除关联cat 删除关联tag,批量删除文章
	 */
	@Transactional
	@Override
	public int deleteCmsArticleByIds(Long[] articleIds) {
		Integer[] catIds = cmsArticleLiquidMapper.selectCatIdsByArticleIds(articleIds);
		Integer[] tagIds = cmsArticleLiquidMapper.selectTagIdsByArticleIds(articleIds);
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
		articleMapper.deleteCmsArticleByIds(articleIds);
		this.updateCount(catIds, tagIds);
		app.publishEvent(new CacheWebRefreshEvent(this, CacheConstant.POSTS_CACHE_KEY_PREFIX));
		return articleIds.length;
	}

	/**
	 * 删除关联cat 删除关联tag,批量删除文章 不删除淘客类型
	 */
	@Override
	public int deleteCmsArticleByIdsNotTao(Long[] articleIds) {
		// 过滤类型为0 淘客
		Long[] ids = articleMapper.listNotIncludeTaoId(articleIds);
		return this.deleteCmsArticleByIds(ids);
	}

	/**
	 * 更新顶置
	 * 
	 * @param articleIds
	 * @param articleTop
	 * @return
	 */
	@Override
	public int updateArticleTop(Long[] articleIds, Long articleTop) {
		int re = articleMapper.updateArticleTop(articleIds, articleTop);
		app.publishEvent(new CacheWebRefreshEvent(this, CacheConstant.POSTS_CACHE_KEY_PREFIX));
		return re;
	}

	/**
	 *
	 * @param id
	 * @return
	 */
	@Override
	public CmsArticle getCmsArticleById(Long id) {
		return articleMapper.getCmsArticleById(id);
	}

	@Override
	public List<CmsArticle> listCmsArticle(ArticleVo artVo) {
		return articleMapper.listCmsArticle(artVo);
	}

	@Override
	public int updateCmsArticleById(CmsArticle cmsArticle) {
		// 修改文章
		if (articleMapper.checkUrlAndTitleUnique(cmsArticle.getArticleUrl(), cmsArticle.getArticleTitle(),
				cmsArticle.getArticleId()) == 0) {
			app.publishEvent(new CacheWebRefreshEvent(this, CacheConstant.POSTS_CACHE_KEY_PREFIX));
			return articleMapper.updateCmsArticleById(cmsArticle);
		} else {
			throw new BusinessException("参数验证校验失败,请检查！");
		}

	}

	@Override
	public String checkArticleUrl(String articleUrl, Long articleId) {
		if (StrUtil.hasEmpty(articleUrl)) {
			return CmsConstants.UNIQUE;
		}
		if (articleMapper.checkArticleUrlUnique(articleUrl, articleId) == 0) {
			return CmsConstants.UNIQUE;
		}
		return CmsConstants.NOT_UNIQUE;
	}

	@Override
	public String checkArticleTitle(String articleTitle, Long articleId) {
		if (articleMapper.checkArticleTitleUnique(articleTitle, articleId) == 0) {
			return CmsConstants.UNIQUE;
		}
		return CmsConstants.NOT_UNIQUE;
	}

	/**
	 * 关联分类文章
	 * 
	 * @param articleId
	 * @param catId
	 * @return
	 */
	@Override
	public int addCatArticle(Long articleId, Long catId) {
		Integer sc[] = Convert.toIntArray(catId);
		sc = cmsArticleLiquidMapper.filterCats(sc);
		if (sc.length == 0) {
			throw new BusinessException("关联失败,关联分类可能不存在。分类ID" + catId);
		}
		if (cmsArticleLiquidMapper.countArticleCat(articleId) >= Integer
				.parseInt(configService.selectConfigByKey(OlyCmsConfigPropetries.ARTICLE_CAT_MAXNUM.getValue()))) {
			throw new BusinessException("关联失败,关联分类已达上限。文章Id" + articleId);
		}
		int re = cmsArticleLiquidMapper.insertCatArticle(articleId, catId);
		cmsArticleLiquidMapper.updateCmsCatCountByIds(sc);
		app.publishEvent(new CacheWebRefreshEvent(this, CacheConstant.POSTS_CACHE_KEY_PREFIX));
		return re;
	}

	/**
	 * 移除关联分类 至少关联一个
	 */
	@Override
	public int removeCatArticle(Long articleId, Long catId) {
		if (cmsArticleLiquidMapper.countArticleCat(articleId) == 1) {
			throw new BusinessException("解除关联失败,请至少关联一个分类");
		}
		int re = cmsArticleLiquidMapper.deleteCatArticle(articleId, catId);
		cmsArticleLiquidMapper.updateCmsCatCountByIds(Convert.toIntArray(catId));
		app.publishEvent(new CacheWebRefreshEvent(this, CacheConstant.POSTS_CACHE_KEY_PREFIX));
		return re;
	}

	/**
	 * 关联标签文章
	 * 
	 * @param articleId
	 * @param tagId
	 * @return
	 */
	@Override
	public int addTagArticle(Long articleId, Long tagId) {
		Integer ts[] = Convert.toIntArray(tagId);
		ts = cmsArticleLiquidMapper.filterTags(ts);
		if (ts.length == 0) {
			throw new BusinessException("关联失败,关联标签可能不存在");
		}
		if (cmsArticleLiquidMapper.countArticleTag(articleId) >= Integer
				.parseInt(configService.selectConfigByKey(OlyCmsConfigPropetries.ARTICLE_TAG_MAXNUM.getValue()))) {
			throw new BusinessException("关联失败,关联标签已达上限");
		}
		int re = cmsArticleLiquidMapper.insertTagArticle(articleId, tagId);
		cmsArticleLiquidMapper.updateCmsTagCountByIds(ts);
		app.publishEvent(new CacheWebRefreshEvent(this, CacheConstant.POSTS_CACHE_KEY_PREFIX));
		return re;
	}

	/**
	 * 可以一个标签都没有
	 */
	@Override
	public int removeTagArticle(Long articleId, Long tagId) {
		int re = cmsArticleLiquidMapper.deleteTagArticle(articleId, tagId);
		cmsArticleLiquidMapper.updateCmsTagCountByIds(Convert.toIntArray(tagId));
		app.publishEvent(new CacheWebRefreshEvent(this, CacheConstant.POSTS_CACHE_KEY_PREFIX));
		return re;
	}

	@Override
	public int updateVisible(Long[] ids, Byte visible) {
		int re = articleMapper.updateVisible(ids, visible);
		app.publishEvent(new CacheWebRefreshEvent(this, CacheConstant.POSTS_CACHE_KEY_PREFIX));
		return re;
	}

	/**
	 * 过滤
	 */
	@Override
	public Integer[] filterCats(Integer[] cats) {
		return cmsArticleLiquidMapper.filterCats(cats);
	}

	@Override
	public Integer[] filterTags(Integer[] tags) {
		return cmsArticleLiquidMapper.filterTags(tags);
	}

	private void updateCount(Integer[] catIds, Integer[] tagIds) {
		cmsArticleLiquidMapper.updateCmsCatCountByIds(catIds);
		cmsArticleLiquidMapper.updateCmsTagCountByIds(tagIds);
	}
}
