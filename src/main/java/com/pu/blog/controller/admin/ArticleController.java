package com.pu.blog.controller.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.pu.blog.model.entity.Article;
import com.pu.blog.model.entity.Category;
import com.pu.blog.model.entity.Msg;
import com.pu.blog.model.entity.User;
import com.pu.blog.service.ArticleService;
import com.pu.blog.service.CategoryService;

@Controller
@RequestMapping("/admin/article")
public class ArticleController {

	@Autowired
	private CategoryService categoryService;
	@Autowired
	private ArticleService articleService;

	/**
	 * 编辑文章
	 * 
	 * @param articleParams
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/doedit", method = RequestMethod.PUT)
	public Msg doEdit(Article article) {
		articleService.editArticle(article);
		return Msg.success();
	}

	/**
	 * 通过Id删除文章
	 * 
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
	public Msg deleteArticle(@PathVariable("id") Integer id) {
		articleService.deleteById(id);
		return Msg.success();
	}

	/**
	 * 通过id查询文章
	 * 
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public String goEditPage(@PathVariable("id") Integer id, Model model) {
		Map<String, Object> params = new HashMap<>();
		params.put("id", id);
		Article article = articleService.getArticleById(params);
		model.addAttribute("article", article);
		List<Category> categories = categoryService.getCategories();
		model.addAttribute("categories", categories);
		return "admin/article/edit";
	}

	/**
	 * 分页条件查询
	 * 
	 * @param pn
	 * @param status
	 * @param categoryId
	 * @param keywords
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/listarticles", method = RequestMethod.GET)
	public Msg listArticle(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Integer status,
			@RequestParam(value = "categoryId", required = false) String categoryId,
			@RequestParam(value = "keywords", required = false) String keywords) {
		Map<String, Object> param = new HashMap<>();
		param.put("status", status);
		if (categoryId != null) {
			param.put("categoryId", categoryId);
		}
		if (keywords != null) {
			param.put("keywords", keywords);
		}
		int pageSize = 8;
		PageHelper.startPage(pn, pageSize);
		List<Article> list = articleService.getArticleList(param);
		PageInfo<Article> page = new PageInfo<>(list, 5);
		return Msg.success().add("page", page);
	}

	/**
	 * 文章列表显示页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String goListPage(Model model) {
		List<Category> categories = categoryService.getCategories();
		model.addAttribute("categories", categories);
		return "admin/article/list";
	}

	/**
	 * 文章编辑页面
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String goAddArticlePage(Model model) {
		List<Category> categories = categoryService.getCategories();
		model.addAttribute("categories", categories);
		return "admin/article/edit";
	}

	/**
	 * 添加文章
	 * 
	 * @param articleParams
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/doedit", method = RequestMethod.POST)
	public Msg doAdd(Article article, HttpSession session) {
		User user = (User) session.getAttribute("loginUser");
		if (user != null) {
			article.setUserId(user.getId());
		}
		articleService.addArticle(article);
		return Msg.success();
	}

}
