package com.pu.blog.controller.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pu.blog.model.entity.Article;
import com.pu.blog.model.entity.LoginRecord;
import com.pu.blog.model.entity.Msg;
import com.pu.blog.model.entity.SiteInfo;
import com.pu.blog.model.entity.User;
import com.pu.blog.service.ArticleService;
import com.pu.blog.service.LoginRecordService;
import com.pu.blog.service.SiteService;
import com.pu.blog.service.UserService;
import com.pu.blog.utils.IPUtil;
import com.pu.blog.utils.MD5Utils;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private UserService userService;
	@Autowired
	private SiteService siteService;
	@Autowired
	private ArticleService articleService;
	@Autowired
	private LoginRecordService loginRecordService;

	/**
	 * 退出
	 * 
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String loginOut(HttpSession session) {
		// 销毁session
		session.invalidate();
		return "redirect:/admin/login";
	}

	/**
	 * 登录操作
	 * 
	 * @param user
	 * @param session
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/dologin", method = RequestMethod.POST)
	public Msg doLogin(User user, HttpSession session, HttpServletRequest request) {
		if (StringUtils.isEmpty(user.getUsername())) {
			return Msg.fail().add("failMsg", "用户名不能为空");
		}
		if (StringUtils.isEmpty(user.getPassword())) {
			return Msg.fail().add("failMsg", "密码不能为空");
		}
		String pass = user.getPassword();
		user.setPassword(MD5Utils.getMD5Value(pass));
		LoginRecord loginRecord = new LoginRecord(); // 登录记录
		loginRecord.setIp(IPUtil.getIpAddr(request));
		loginRecord.setUsername(user.getUsername());
		loginRecordService.addLoginRecord(loginRecord);
		User loginUser = userService.getUser(user);
		if (loginUser == null) {
			return Msg.fail().add("failMsg", "用户名或密码错误");
		}

		session.setAttribute("loginUser", loginUser);
		return Msg.success();
	}

	/**
	 * 进入登录页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String goLoginPage(HttpSession session, HttpServletRequest request) {
		SiteInfo siteInfo = siteService.getSiteInfo();
		session.setAttribute("site", siteInfo);
		return "admin/login";
	}

	/**
	 * 进入后台主页
	 * 
	 * @return
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String goIndexPage(Model model) {
		int allCount = articleService.getCountByStatus(null);
		int publishCount = articleService.getCountByStatus(1);
		int draftCount = articleService.getCountByStatus(2);
		int allViews = articleService.getAllViews();
		Map<String,Object> param = new HashMap<>();
		param.put("status", null);
		List<Article> list = articleService.getLatestArticle(param);
		List<LoginRecord> latestRecord = loginRecordService.getLatestLoginRecord();
		model.addAttribute("allCount", allCount);
		model.addAttribute("publishCount", publishCount);
		model.addAttribute("draftCount", draftCount);
		model.addAttribute("allViews", allViews);
		model.addAttribute("latestArticle", list);
		model.addAttribute("latestRecord", latestRecord);
		return "admin/main";
	}
}
