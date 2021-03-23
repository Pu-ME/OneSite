package com.pu.blog.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.pu.blog.model.entity.Link;

public interface LinkMapper {
	/**
	 * 添加链接
	 * @param link
	 */
	void insertLink(Link link);
	/**
	 * 修改链接
	 * @param link
	 */
	void updateLink(Link link);
	/**
	 * 删除链接
	 * @param list
	 */
	void deleteBatch(@Param("list") String[] list);
	/**
	 * 通过id查询链接
	 * @param id
	 * @return
	 */
	Link selectLinkById(Integer id);
	/**
	 * 查询所有友链
	 * @return
	 */
	List<Link> selectLinklist();

}
