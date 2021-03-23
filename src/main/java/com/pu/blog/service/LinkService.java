package com.pu.blog.service;

import java.util.List;

import com.pu.blog.model.entity.Link;

public interface LinkService {
	/**
	 * 获取所有友链
	 * @return
	 */
	List<Link> getLinks();
	/**
	 * 添加链接
	 * @param link
	 */
	void addLink(Link link);
	/**
	 * 修改友链
	 * @param link
	 */
	void editLink(Link link);
	/**
	 * 通过Id查询链接
	 * @param id
	 * @return
	 */
	Link getLink(Integer id);
	/**
	 * 删除链接
	 * @param list
	 */
	void deleteBatch(String[] list);

}
