package com.pu.blog.model.entity;

public class Category {
	private Integer id;
	private String categoryName;
	private String sort;
	public Integer getId() {
		return id;
	}
	public Category(Integer id) {
		super();
		this.id = id;
	}
	
	public Category() {
		super();
	}
	public Category(Integer id, String categoryName, String sort) {
		super();
		this.id = id;
		this.categoryName = categoryName;
		this.sort = sort;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}

}
