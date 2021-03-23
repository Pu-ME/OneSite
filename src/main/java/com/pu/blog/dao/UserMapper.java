package com.pu.blog.dao;

import com.pu.blog.model.entity.User;

public interface UserMapper {
	/**
	 * 通过用户名和密码查询用户
	 * @param user
	 * @return
	 */
	User selectUserByUsernameAndPassword(User user);
	/**
	 * 修改用户资料
	 * @param user
	 */
	void updateUser(User user);
	/**
	 * 通过id查询用户
	 * @param id
	 * @return
	 */
	User selectUserById(Integer id);
	/**
	 * 统计用户数
	 * @return
	 */
	int countUser();
	/**
	 * 添加用户
	 * @param user
	 */
	void insertUser(User user);
}
