package com.ruoyi.blog.mapper;

import com.ruoyi.blog.mould.pam.BlogRecordParam;
import org.apache.ibatis.annotations.Param;

public interface BlogRecordMapper {
    /**
     * 通用插入记录表
      * @return
     */
  public int insertRecord(BlogRecordParam recordParam);

  public int updateBlogPostCount(@Param("countColumn") String countColumn,@Param("articleId")Long articleId);

    /**
     * 统计记录数
     * @param recordTable 记录的表
     * @param articleId  文章id
     * @param userId 用户id
     * @return
     */
  public int countRecord(@Param("recordTable") String recordTable,@Param("articleId")Long articleId,@Param("userId")Long userId);
}
