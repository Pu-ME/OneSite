package com.pu.blog.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pu.blog.dao.SiteMapper;
import com.pu.blog.model.entity.SiteInfo;
import com.pu.blog.service.SiteService;
@Service
public class SiteServiceImpl implements SiteService {
	@Autowired
	private SiteMapper siteMapper;
	
	@Override
	public void addSiteInfo(SiteInfo siteInfo) {
		siteMapper.insertSiteInfo(siteInfo);
	}

	@Override
	public void editSiteInfo(SiteInfo siteInfo) {
		siteMapper.updateSiteInfo(siteInfo);
	}

	@Override
	public SiteInfo getSiteInfo() {
		return siteMapper.selectSiteInfo();
	}

}
