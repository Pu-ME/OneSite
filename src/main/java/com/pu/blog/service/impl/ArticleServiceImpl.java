package com.pu.blog.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pu.blog.dao.ArticleMapper;
import com.pu.blog.model.dto.ArchiveDto;
import com.pu.blog.model.dto.ArticleDto;
import com.pu.blog.model.entity.Article;
import com.pu.blog.service.ArticleService;

@Service
public class ArticleServiceImpl implements ArticleService {
	@Autowired
	private ArticleMapper articleMapper;

	@Override
	public void addArticle(Article article) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		article.setCreateTime(sdf.format(new Date()));
		article.setUpdateTime(sdf.format(new Date()));
		article.setViews(0);
		articleMapper.insertArticle(article);
	}

	@Override
	public List<Article> getArticleList(Map<String, Object> param) {
		return articleMapper.selectArticleList(param);
	}

	@Override
	public Article getArticleById(Map<String, Object> param) {
		return articleMapper.selectArticleById(param);
	}

	@Override
	public void deleteById(Integer id) {
		articleMapper.deleteById(id);
	}

	@Override
	public void editArticle(Article article) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		article.setUpdateTime(sdf.format(new Date()));
		articleMapper.updateArticle(article);
	}

	@Override
	public int countByCategoryIds(String[] list) {
		return articleMapper.countByCategoryIds(list);
	}

	@Override
	public int getCountByStatus(Integer status) {
		return articleMapper.countArticleByStatus(status);
	}

	@Override
	public List<Article> getLatestArticle(Map<String, Object> param) {
		return articleMapper.selectLatestArticle(param);
	}

	@Override
	public int getAllViews() {
		return articleMapper.countViewAllArticle();
	}

	@Override
	public List<ArticleDto> getArticleDtoList(Map<String, Object> param) {
		return articleMapper.selectArticleDtoList(param);
	}

	@Override
	public List<ArchiveDto> getGroupByYear() {
		List<ArchiveDto> selectGroupByYear = articleMapper.selectGroupByYear();
		for (ArchiveDto archiveDto : selectGroupByYear) {
			archiveDto.setArticleDto(articleMapper.selectArticleDtoByYear(archiveDto.getYear()));
		}
		return selectGroupByYear;
	}

	@Override
	public List<ArchiveDto> getGroupByYearAndMonth() {
		List<ArchiveDto> selectGroupByYearAndMonth = articleMapper.selectGroupByYearAndMonth();
		for (ArchiveDto archiveDto : selectGroupByYearAndMonth) {
			archiveDto.setArticleDto(
					articleMapper.selectArticleDtoByYearAndMonth(archiveDto.getYear(), archiveDto.getMonth()));
		}
		return selectGroupByYearAndMonth;
	}

}
