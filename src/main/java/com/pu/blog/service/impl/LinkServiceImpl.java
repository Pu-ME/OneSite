package com.pu.blog.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pu.blog.dao.LinkMapper;
import com.pu.blog.model.entity.Link;
import com.pu.blog.service.LinkService;

@Service
public class LinkServiceImpl implements LinkService {
	@Autowired
	private LinkMapper linkMapper;

	@Override
	public List<Link> getLinks() {
		return linkMapper.selectLinklist();
	}

	@Override
	public void addLink(Link link) {
		linkMapper.insertLink(link);
	}

	@Override
	public void editLink(Link link) {
		linkMapper.updateLink(link);
	}

	@Override
	public Link getLink(Integer id) {
		return linkMapper.selectLinkById(id);
	}

	@Override
	public void deleteBatch(String[] list) {
		linkMapper.deleteBatch(list);
	}

}
