package com.pu.blog.controller.api;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pu.blog.model.dto.ArticleDto;
import com.pu.blog.model.entity.Msg;
import com.pu.blog.service.ArticleService;
@Controller
@RequestMapping("/api")
public class ApiController {
	@Autowired
	private ArticleService articleService;
	
	@ResponseBody
	@RequestMapping(value="/articles",method=RequestMethod.GET)
	public Msg getArticles(){
		Map<String, Object> param = new HashMap<>();
		param.put("status", 1);
		List<ArticleDto> articleList = articleService.getArticleDtoList(param);
		return Msg.success().add("articles", articleList);
	}
}
