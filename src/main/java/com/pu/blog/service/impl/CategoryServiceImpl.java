package com.pu.blog.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pu.blog.dao.CategoryMapper;
import com.pu.blog.model.entity.Category;
import com.pu.blog.service.CategoryService;

@Service
public class CategoryServiceImpl implements CategoryService {
	@Autowired
	private CategoryMapper categoryMapper;

	@Override
	public List<Category> getCategories() {
		return categoryMapper.selectCategories();
	}

	@Override
	public void addCategory(Category category) {
		categoryMapper.insertCategory(category);
	}

	@Override
	public Category getCategory(Integer id) {
		return categoryMapper.selectCategory(id);
	}

	@Override
	public void editCategory(Category category) {
		categoryMapper.updateCategory(category);
	}

	@Override
	public void deleteBatch(String[] list) {
		categoryMapper.deleteBatch(list);
	}

}
