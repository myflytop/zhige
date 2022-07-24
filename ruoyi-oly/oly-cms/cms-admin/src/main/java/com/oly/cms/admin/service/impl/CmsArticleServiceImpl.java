package com.oly.cms.admin.service.impl;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.ArrayUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oly.cms.admin.mapper.CmsArticleLiquidMapper;
import com.oly.cms.admin.mapper.CmsArticleMapper;
import com.oly.cms.admin.mapper.CmsCatMapper;
import com.oly.cms.admin.mapper.CmsTagMapper;
import com.oly.cms.admin.mapper.CmsThemeMapper;
import com.oly.cms.common.domain.entity.CmsArticle;
import com.oly.cms.common.domain.entity.CmsCat;
import com.oly.cms.common.domain.entity.CmsTag;
import com.oly.cms.admin.model.vo.ArticleVo;
import com.oly.cms.admin.service.ICmsArticleService;
import com.oly.cms.common.constant.CacheConstant;
import com.oly.cms.common.constant.OlySystemConstant;
import com.oly.cms.common.event.CacheWebRefreshAllEvent;
import com.oly.cms.common.model.properties.OlyCmsConfigProperties;
import com.oly.cms.common.model.properties.OlyWebConfigProperties;
import com.oly.cms.general.mapper.CategorySearchMapper;
import com.oly.cms.general.mapper.TagSearchMapper;
import com.ruoyi.common.constant.UserConstants;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.system.config.service.impl.SysConfigServiceImpl;

import cn.hutool.core.convert.Convert;

@Service
public class CmsArticleServiceImpl implements ICmsArticleService {

	@Autowired
	private ApplicationEventPublisher app;
	@Autowired
	private CmsArticleMapper articleMapper;
	@Autowired
	private TagSearchMapper tagSearchMapper;
	@Autowired
	private CmsCatMapper catMapper;
	@Autowired
	private CategorySearchMapper categorySearchMapper;
	@Autowired
	private CmsThemeMapper themeMapper;
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

		if (UserConstants.UNIQUE.equals(this.checkArticleUnique(arVo))) {
			CmsArticle art = arVo;
			// 顶置默认
			art.setArticleTop(OlySystemConstant.DEFAULT_POST_TOP);
			// 状态默认审核中
			art.setVisible(Integer.parseInt(
					configService.selectConfigDefauleValue(OlyCmsConfigProperties.CMS_CONFIG_GROUP.defaultValue(),
							OlyCmsConfigProperties.ARTICLE_VISIBLE_DEFAULT)));
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
			// 更新分类关联文章数
			cmsArticleLiquidMapper.updateCmsCatCountByIds(arVo.getCats());
			// 插入文章相关统计
			cmsArticleLiquidMapper.insertCmsArticleCount(art.getArticleId());
			// 关联主题
			insertArticleTheme(art.getArticleId());
			app.publishEvent(new CacheWebRefreshAllEvent(this, CacheConstant.POST_CACHE_KEY_PREFIX));
			return reInsertNum;
		} else {
			throw new ServiceException("参数验证校验失败,请检查！");
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
		app.publishEvent(new CacheWebRefreshAllEvent(this, CacheConstant.POST_CACHE_KEY_PREFIX));
		return articleIds.length;
	}

	/**
	 * 更新顶置
	 * 
	 * @param articleIds
	 * @param articleTop
	 * @return
	 */
	@Override
	public int updateArticleTop(Long[] articleIds, int articleTop) {
		int re = articleMapper.updateArticleTop(articleIds, articleTop);
		app.publishEvent(new CacheWebRefreshAllEvent(this, CacheConstant.POST_CACHE_KEY_PREFIX));
		return re;
	}

	/**
	 *
	 * @param id
	 * @return
	 */
	@Override
	public CmsArticle selectCmsArticleById(Long id) {
		return articleMapper.selectCmsArticleById(id);
	}

	@Override
	public List<CmsArticle> listCmsArticle(ArticleVo artVo) {
		return articleMapper.listCmsArticle(artVo);
	}

	@Override
	public int updateCmsArticleById(CmsArticle cmsArticle) {
		// 修改文章
		if (UserConstants.UNIQUE.equals(this.checkArticleUnique(cmsArticle))) {
			app.publishEvent(new CacheWebRefreshAllEvent(this, CacheConstant.POST_CACHE_KEY_PREFIX));
			return articleMapper.updateCmsArticleById(cmsArticle);
		} else {
			throw new ServiceException("参数验证校验失败,请检查！");
		}

	}

	@Override
	public String checkArticleUnique(CmsArticle cmsArticle) {
		CmsArticle c = articleMapper.checkArticleUnique(cmsArticle);
		Long articleId = cmsArticle.getArticleId() == null ? -1L : cmsArticle.getArticleId();
		if (c == null || c.getArticleId().longValue() == articleId.longValue()) {
			return UserConstants.UNIQUE;
		}
		return UserConstants.NOT_UNIQUE;
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
			throw new ServiceException("关联失败,关联分类可能不存在。分类ID" + catId);
		}
		if (cmsArticleLiquidMapper.countArticleCat(articleId) >= Integer
				.parseInt(configService.selectConfigDefauleValue(OlyCmsConfigProperties.CMS_CONFIG_GROUP.defaultValue(),
						OlyCmsConfigProperties.ARTICLE_CAT_MAXNUM))) {
			throw new ServiceException("关联失败,关联分类已达上限。文章Id" + articleId);
		}
		int re = cmsArticleLiquidMapper.insertCatArticle(articleId, catId);
		cmsArticleLiquidMapper.updateCmsCatCountByIds(sc);
		updateArticleThemeByType(articleId);
		app.publishEvent(new CacheWebRefreshAllEvent(this, CacheConstant.POST_CACHE_KEY_PREFIX));
		return re;
	}

	/**
	 * 移除关联分类 至少关联一个
	 */
	@Override
	public int removeCatArticle(Long articleId, Long catId) {
		if (cmsArticleLiquidMapper.countArticleCat(articleId) == 1) {
			throw new ServiceException("解除关联失败,请至少关联一个分类");
		}
		int re = cmsArticleLiquidMapper.deleteCatArticle(articleId, catId);
		cmsArticleLiquidMapper.updateCmsCatCountByIds(Convert.toIntArray(catId));
		updateArticleThemeByType(articleId);
		app.publishEvent(new CacheWebRefreshAllEvent(this, CacheConstant.POST_CACHE_KEY_PREFIX));
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
			throw new ServiceException("关联失败,关联标签可能不存在");
		}
		if (cmsArticleLiquidMapper.countArticleTag(articleId) >= Integer
				.parseInt(configService.selectConfigDefauleValue(OlyCmsConfigProperties.CMS_CONFIG_GROUP.defaultValue(),
						OlyCmsConfigProperties.ARTICLE_TAG_MAXNUM))) {
			throw new ServiceException("关联失败,关联标签已达上限");
		}
		int re = cmsArticleLiquidMapper.insertTagArticle(articleId, tagId);
		cmsArticleLiquidMapper.updateCmsTagCountByIds(ts);
		updateArticleThemeByType(articleId);
		app.publishEvent(new CacheWebRefreshAllEvent(this, CacheConstant.POST_CACHE_KEY_PREFIX));
		return re;
	}

	/**
	 * 可以一个标签都没有
	 */
	@Override
	public int removeTagArticle(Long articleId, Long tagId) {
		int re = cmsArticleLiquidMapper.deleteTagArticle(articleId, tagId);
		cmsArticleLiquidMapper.updateCmsTagCountByIds(Convert.toIntArray(tagId));
		updateArticleThemeByType(articleId);
		app.publishEvent(new CacheWebRefreshAllEvent(this, CacheConstant.POST_CACHE_KEY_PREFIX));
		return re;
	}

	@Override
	public int updateVisible(Long[] ids, Integer visible) {
		int re = articleMapper.updateVisible(ids, visible);
		app.publishEvent(new CacheWebRefreshAllEvent(this, CacheConstant.POST_CACHE_KEY_PREFIX));
		return re;
	}

	/**
	 * 过滤 重复选择分类
	 */
	@Override
	public Integer[] filterCats(Integer[] cats) {
		return cmsArticleLiquidMapper.filterCats(cats);
	}

	@Override
	public Integer[] filterTags(Integer[] tags) {
		return cmsArticleLiquidMapper.filterTags(tags);
	}

	@Override
	public int buildArticleIndex(String themeName) {
		Integer[] supportTypes = Convert.toIntArray(
				configService.selectConfigValueByGk(themeName, OlyWebConfigProperties.ARTICLE_TYPES.getValue()));
		// 支持所有文章 所有文章不需要关联
		cmsArticleLiquidMapper.deleteCmsArticleThemeByTheme(themeName);
		int count = 0;
		if (supportTypes != null) {
			for (Integer support : supportTypes) {
				CmsCat cmsCat = new CmsCat();
				cmsCat.setCatType(support);
				List<CmsCat> cats = categorySearchMapper.listCmsCats(cmsCat);
				for (CmsCat cat : cats) {
					ArticleVo artVo = new ArticleVo();
					artVo.setCatId(cat.getCatId());
					List<CmsArticle> arts = articleMapper.listCmsArticle(artVo);
					for (CmsArticle art : arts) {
						cmsArticleLiquidMapper.insertCmsArticleTheme(art.getArticleId(), themeName);
						count++;
					}
				}
			}
		}
		return count;
	}

	private void updateCount(Integer[] catIds, Integer[] tagIds) {
		if (!ArrayUtils.isEmpty(catIds)) {
			cmsArticleLiquidMapper.updateCmsCatCountByIds(catIds);
		}
		if (!ArrayUtils.isEmpty(tagIds)) {
			cmsArticleLiquidMapper.updateCmsTagCountByIds(tagIds);
		}
	}

	private void insertArticleTheme(long articleId) {
		List<String> listThemeName = themeMapper.listThemeNames();
		if (listThemeName == null) {
			return;
		}
		List<Integer> tagTypes = tagSearchMapper.listCmsTagByArticleId(articleId).stream().map(CmsTag::getTagType)
				.collect(Collectors.toList());
		List<Integer> catTypes = categorySearchMapper.listCmsCatByArticleId(articleId).stream().map(CmsCat::getCatType)
				.collect(Collectors.toList());
		tagTypes.addAll(catTypes);
		List<Integer> types = tagTypes.stream().distinct().collect(Collectors.toList());
		for (String themeName : listThemeName) {
			Integer[] supportTypes = Convert.toIntArray(
					configService.selectConfigValueByGk(themeName, OlyWebConfigProperties.ARTICLE_TYPES.getValue()));
			if (supportTypes == null || CollectionUtils.intersection(types, Arrays.asList(supportTypes)) != null) {
				cmsArticleLiquidMapper.insertCmsArticleTheme(articleId, themeName);
			}
		}
	}

	private void updateArticleThemeByType(long articleId) {
		cmsArticleLiquidMapper.deleteCmsArticleThemeByArticleId(articleId);
		insertArticleTheme(articleId);
	}

}
