package com.pu.blog.dao;

import com.pu.blog.model.entity.SiteInfo;

public interface SiteMapper {
	/**
	 * 添加站点信息
	 * @param siteinfo
	 */
	void insertSiteInfo(SiteInfo siteinfo);
	/**
	 * 修改信息
	 * @param siteinfo
	 */
	void updateSiteInfo(SiteInfo siteinfo);
	/**
	 * 查询站点信息
	 * @return
	 */
	SiteInfo selectSiteInfo();
}
