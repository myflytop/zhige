package com.oly.cms.hand.mapper;

import com.oly.cms.hand.model.param.WebRecordParam;

import org.apache.ibatis.annotations.Param;

public interface HandRecordMapper {
  /**
   * 通用插入记录表
   * 
   * @return
   */
  int insertRecord(WebRecordParam recordParam);

  /**
   * 更新文章统计
   * 
   * @param countColumn
   * @param articleId
   * @return
   */
  int updateCmsArticleCount(@Param("countColumn") String countColumn, @Param("articleId") Long articleId);

  /**
   * 统计记录数
   * 
   * @param recordTable 记录的表
   * @param articleId   文章id
   * @param userId      用户id
   * @return
   */
  int getCountRecord(@Param("recordTable") String recordTable, @Param("articleId") Long articleId,
      @Param("userId") Long userId);
}
