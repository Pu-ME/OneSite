package com.pu.blog.controller.portal;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pu.blog.exception.MeException;
import com.pu.blog.model.dto.ArchiveDto;
import com.pu.blog.model.dto.ArticleDto;
import com.pu.blog.model.entity.Article;
import com.pu.blog.model.entity.Link;
import com.pu.blog.model.entity.Msg;
import com.pu.blog.model.entity.User;
import com.pu.blog.service.ArticleService;
import com.pu.blog.service.LinkService;
import com.pu.blog.service.UserService;
import com.pu.blog.utils.MD5Utils;

@Controller
public class PortalController {
	@Autowired
	private ArticleService articleService;
	@Autowired
	private LinkService linkService;
	@Autowired
	private UserService userService;
	/**
	 * 前台首页
	 * 
	 * @return
	 */
	@RequestMapping(value = "/portal/", method = RequestMethod.GET)
	public String goIndexPage(Model model) {
		Map<String, Object> param = new HashMap<>();
		param.put("status", 1);
		List<ArticleDto> articleList = articleService.getArticleDtoList(param);
		model.addAttribute("articles", articleList);
		return "portal/index";
	}
	/**
	 * 根据ID查询文章
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/article/{id}", method = RequestMethod.GET)
	public String goPostPage(@PathVariable("id") Integer id, Model model) {
		Map<String, Object> param = new HashMap<>();
		param.put("status", 1);
		param.put("id", id);
		Article articleById = articleService.getArticleById(param);
		model.addAttribute("article", articleById);
		return "portal/article";
	}
	/**
	 *友链页面
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/links",method=RequestMethod.GET)
	public String goLinksPage(Model model){
		List<Link> links = linkService.getLinks();
		model.addAttribute("links", links);
		return "portal/links";
	}
	/**
	 * 归档页面
	 * @param model
	 * @return
	 * @throws MeException 
	 */
	@RequestMapping(value="/archive",method=RequestMethod.GET)
	public String goArchivePage(Model model){
		List<ArchiveDto> list = articleService.getGroupByYearAndMonth();
		model.addAttribute("datas", list);
		return "portal/archive";
	}
	/**
	 * 关于我页面
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/about",method=RequestMethod.GET)
	public String goAboutPage(Model model){
		return "portal/about";
	}
	/**
	 * 安装页面
	 * @return
	 */
	@RequestMapping("/install")
	public String goInstallPage(){
		int count = userService.countUser();
		if(count>0){
			return "error/404";
		}
		return "portal/install";
	}
	@ResponseBody
	@RequestMapping(value="/portal/adduser",method=RequestMethod.POST)
	public Msg createAdmin(@RequestParam("username")String username,@RequestParam("password")String password){
		if(StringUtils.isEmpty(username)){
			return Msg.fail().add("failmsg", "用户名不能为空");
		}
		if(StringUtils.isEmpty(password)){
			return Msg.fail().add("failmsg", "密码不能为空");
		}
		User user = new User();
		user.setUsername(username);
		user.setPassword(MD5Utils.getMD5Value(password));
		userService.addUser(user);;
		return Msg.success();
	}

}
