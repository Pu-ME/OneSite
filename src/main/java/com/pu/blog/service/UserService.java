package com.pu.blog.service;

import com.pu.blog.model.entity.User;

public interface UserService {
	/**
	 * 添加用户
	 * @param user
	 */
	void addUser(User user);
	/**
	 * 查找用户(通过用户名和密码)
	 * @param user
	 * @return
	 */
	User getUser(User user);
	/**
	 * 修改用户资料
	 * @param user
	 */
	void editUser(User user);
	/**
	 * 查找用户(通过id)
	 * @param id
	 * @return
	 */
	User getUserById(Integer id);
	/**
	 * 修改密码
	 * @param editUser
	 */
	void editPassword(User editUser);
	/**
	 * 统计用户数
	 * @return
	 */
	int countUser();
}
