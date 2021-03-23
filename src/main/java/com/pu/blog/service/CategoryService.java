package com.pu.blog.service;

import java.util.List;

import com.pu.blog.model.entity.Category;

public interface CategoryService {
	/**
	 * 查询所有分类
	 * @return
	 */
	List<Category> getCategories();
	/**
	 * 添加分类
	 * @param category
	 */
	void addCategory(Category category);
	/**
	 * 根据ID查询分类
	 * @param id
	 * @return
	 */
	Category getCategory(Integer id);
	/**
	 * 修改分类
	 * @param category
	 */
	void editCategory(Category category);
	/**
	 * 删除分类
	 * @param ids_str
	 */
	void deleteBatch(String[] list);
	
}
