package com.pu.blog.interceptor;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.context.request.WebRequestInterceptor;

import com.pu.blog.model.entity.Article;
import com.pu.blog.model.entity.SiteInfo;
import com.pu.blog.service.ArticleService;
import com.pu.blog.service.SiteService;



public class HomeInterceptor implements WebRequestInterceptor {
	@Autowired
	private ArticleService articleService;
	@Autowired
	private SiteService siteService;
	@Override
	public void preHandle(WebRequest request) throws Exception {
		Map<String, Object> param = new HashMap<>();
		param.put("status", 1);
		List<Article> latestArticle = articleService.getLatestArticle(param);
		SiteInfo siteInfo = siteService.getSiteInfo();
		request.setAttribute("latestArticle", latestArticle, WebRequest.SCOPE_REQUEST);
		request.setAttribute("siteInfo", siteInfo, WebRequest.SCOPE_REQUEST);
	}
	@Override
	public void postHandle(WebRequest request, ModelMap model) throws Exception {
		// TODO Auto-generated method stub
		
	}
	@Override
	public void afterCompletion(WebRequest request, Exception ex) throws Exception {
		// TODO Auto-generated method stub
		
	}
	
	

	

}
