package com.pu.blog.service;

import java.util.List;
import java.util.Map;

import com.pu.blog.model.dto.ArchiveDto;
import com.pu.blog.model.dto.ArticleDto;
import com.pu.blog.model.entity.Article;

public interface ArticleService {
	/**
	 * 查询文章归档信息 根据年份
	 * @return
	 */
	List<ArchiveDto> getGroupByYear();
	/**
	 * 查询文章归档信息 根据年份和月份
	 * @return
	 */
	List<ArchiveDto> getGroupByYearAndMonth();
	/**
	 * 通过状态获取对应的文章数量
	 * @return
	 */
	int getCountByStatus(Integer status);
	/**
	 * 添加文章
	 * @param article
	 */
	void addArticle(Article article);
	/**
	 * 查询所有文章 后台
	 * @return
	 */
	List<Article> getArticleList(Map<String, Object> param);
	/**
	 * 查询文章 前台
	 * @return
	 */
	List<ArticleDto> getArticleDtoList(Map<String, Object> param);
	/**
	 * 通过id查询文章
	 * @param id
	 * @return
	 */
	Article getArticleById(Map<String, Object> param);
	/**
	 * 通过id删除文章
	 * @param id
	 */
	void deleteById(Integer id);
	/**
	 * 修改文章
	 * @param article
	 */
	void editArticle(Article article);
	/**
	 * 统计分类中的数目
	 * @param list
	 * @return
	 */
	int countByCategoryIds(String[] list);
	/**
	 * 获得最近的文章
	 * @return
	 */
	List<Article> getLatestArticle(Map<String, Object> param);
	/**
	 * 获得文章阅读总量
	 * @return
	 */
	int getAllViews();

}
