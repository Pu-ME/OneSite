package com.pu.blog.model.dto;

import java.util.List;

public class ArchiveDto {
	private String year;
	private String month;
	private String count;
	private List<ArticleDto> articleDto;
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getCount() {
		return count;
	}
	public void setCount(String count) {
		this.count = count;
	}
	public List<ArticleDto> getArticleDto() {
		return articleDto;
	}
	public void setArticleDto(List<ArticleDto> articleDto) {
		this.articleDto = articleDto;
	}
	
	
}
