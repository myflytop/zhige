package com.ruoyi.cms.system.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ruoyi.cms.system.model.po.CmsColumn;

public interface CmsColumnMapper {
    /**
      * 添加栏目
     * @param cmsColumn
     * @return
     */
	int insertCmsColumn(CmsColumn cmsColumn);
	
	/**
     * 修改栏目
    * @param cmsColumn
    * @return
    */
	int updateCmsColumn(CmsColumn cmsColumn); 
	
	/**
	 * 删除单个栏目导航
	 * @param columnId
	 * @return
	 */
	int deleteCmsColumnById(Long columnId);
	
	/**
	 * 获取栏目列表 所有字段
	 * @param cmsColumn
	 * @return
	 */
	List<CmsColumn> listCmsColumn(CmsColumn cmsColumn);
	
	/**
	 * 获取一条栏目 所有字段
	 * @param columnId
	 * @return
	 */
	CmsColumn getCmsColumnById(Long columnId);

	/**
	 * 通过 parentId获取子节点 所有字段
	 * @param parentId
	 * @return
	 */
	List<CmsColumn> listCmsColumnById(Long parentId);
		
	/**
	 * 验证同栏目下栏目名唯一
	 * @param parentId
	 * @param columnName
	 * @return
	 */
	int checkColumnNameUnique(@Param("parentId") Long parentId, @Param("columnName") String columnName, @Param("columnId") Long columnId);

	/**
	 * 确保路径唯一
	 * @param columnId
	 * @param columnUrl
	 * @return
	 */
	int checkColumnUrlUnique(@Param("columnId") Long columnId, @Param("columnUrl") String columnUrl);
	
	/**
	 * 获取父类目名
	 * @param parentId
	 * @return
	 */
	String getCmsColumnNameById(Long parentId);
	
	/**
	 * 统计是否存在子节点的
	 * @param columnId
	 * @return
	 */
	int countCmsColumnById(Long columnId);
	
    /**
      * 获取导航菜单
     * @param cmsColumn
     * @return
     */
	List<CmsColumn> listCmsColumnView(CmsColumn cmsColumn);

	int checkColumnParent(Long parentId);


    List<Long> listColumnIdsById(Long catId);

	int updateAncestors(@Param("parentId")Long parentId,@Param("ancestors") String ancestors);

    int updateTagVisible(@Param("columnId") Long columnId,@Param("visible") Byte visible);
}
