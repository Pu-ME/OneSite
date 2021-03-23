package com.pu.blog.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pu.blog.dao.UserMapper;
import com.pu.blog.model.entity.User;
import com.pu.blog.service.UserService;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserMapper userMapper;
	
	@Override
	public User getUser(User user) {
		return userMapper.selectUserByUsernameAndPassword(user);
	}

	@Override
	public void editUser(User user) {
		userMapper.updateUser(user);
	}

	@Override
	public User getUserById(Integer id) {
		return userMapper.selectUserById(id);
	}

	@Override
	public void editPassword(User editUser) {
		userMapper.updateUser(editUser);
	}

	@Override
	public int countUser() {
		return userMapper.countUser();
	}

	@Override
	public void addUser(User user) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String date = sdf.format(new Date());
		user.setCreateDate(date);
		userMapper.insertUser(user);
		
	}

}
