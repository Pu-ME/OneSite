package com.pu.blog.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.pu.blog.model.entity.Category;

public interface CategoryMapper {
	
	/**
	 * 查询所有分类
	 * @return
	 */
	List<Category> selectCategories();
	/**
	 * 添加新的分类
	 * @param category
	 */
	void insertCategory(Category category);
	/**
	 * 根据ID查询分类
	 * @param id
	 * @return
	 */
	Category selectCategory(Integer id);
	/**
	 * 修改分类
	 * @param category
	 */
	void updateCategory(Category category);
	/**
	 * 删除分类
	 * @param ids_str
	 */
	void deleteBatch(@Param("list") String[] list);

}
