package com.pu.blog.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pu.blog.model.entity.Msg;
import com.pu.blog.model.entity.SiteInfo;
import com.pu.blog.service.SiteService;

@Controller
@RequestMapping("/admin/siteinfo")
public class SiteController {
	@Autowired
	private SiteService siteService;

	/**
	 * 编辑页面
	 * 
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String getSiteInfoPage() {
		return "admin/siteinfo/edit";
	}

	/**
	 * 更新站点信息
	 * 
	 * @param siteInfo
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/editsite", method = RequestMethod.PUT)
	public Msg editSiteInfo(SiteInfo siteInfo) {
		siteService.editSiteInfo(siteInfo);
		return Msg.success();
	}

	/**
	 * 添加站点信息
	 * 
	 * @param siteInfo
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/editsite", method = RequestMethod.POST)
	public Msg addSiteInfo(SiteInfo siteInfo) {
		siteService.addSiteInfo(siteInfo);
		return Msg.success();
	}
}
