package com.pu.blog.service;

import com.pu.blog.model.entity.SiteInfo;

public interface SiteService {
	/**
	 * 添加站点信息
	 * @param siteInfo
	 */
	void addSiteInfo(SiteInfo siteInfo);
	/**
	 * 更改站点信息
	 * @param siteInfo
	 */
	void editSiteInfo(SiteInfo siteInfo);
	/**
	 * 查询站点信息
	 * @return
	 */
	SiteInfo getSiteInfo();
}
