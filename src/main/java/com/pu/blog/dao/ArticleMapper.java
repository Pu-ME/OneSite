package com.pu.blog.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.pu.blog.model.dto.ArchiveDto;
import com.pu.blog.model.dto.ArticleDto;
import com.pu.blog.model.entity.Article;

public interface ArticleMapper {
	/**
	 * 根据年份查询文章
	 * @param year
	 * @return
	 */
	List<ArticleDto> selectArticleDtoByYear(@Param("year") String year);
	/**
	 * 根据年份和月份查询文章
	 * @return
	 */
	List<ArticleDto> selectArticleDtoByYearAndMonth(@Param("year") String year, @Param("month") String month);
	
	/**
	 * 查询文章归档信息 根据年份
	 * @return
	 */
	List<ArchiveDto> selectGroupByYear();
	
	/**
	 * 查询文章归档信息 根据年份和月份
	 * @return
	 */
	List<ArchiveDto> selectGroupByYearAndMonth();
	/**
	 * 添加文章
	 * 
	 * @param article
	 */
	void insertArticle(Article article);
	
	/**
	 * 获得最新文章
	 * @return
	 */
	List<Article> selectLatestArticle(Map<String, Object> param);

	/**
	 * 获得随即文章
	 * 
	 * @return
	 */
	List<Article> selectRandArticle();

	/**
	 * 获得访问量较高的文章
	 * 
	 * @return
	 */
	List<Article> selectArticleByViews();

	/**
	 * 查询所有文章
	 * 
	 * @return
	 */
	List<Article> selectArticleList(Map<String, Object> param);

	/**
	 * 查询所有文章
	 * 
	 * @return
	 */
	List<ArticleDto> selectArticleDtoList(Map<String, Object> param);
	
	/**
	 * 通过Id查询文章
	 * 
	 * @param id
	 * @return
	 */
	Article selectArticleById(Map<String, Object> param);

	/**
	 * 通过id删除文章
	 * 
	 * @param id
	 */
	void deleteById(Integer id);
	

	/**
	 * 修改文章
	 * 
	 * @param article
	 */
	void updateArticle(Article article);

	/**
	 * 统计删除下的文章数目
	 * 
	 * @param list
	 * @return
	 */
	int countByCategoryIds(@Param("list") String[] list);

	/**
	 * 通过状态统计文章数量
	 * 
	 * @param status
	 * @return
	 */
	int countArticleByStatus(@Param("status")Integer status);

	/**
	 * 统计所有文章阅读量
	 * 
	 * @return
	 */
	int countViewAllArticle();

}
