package com.pu.blog.dao;

import java.util.List;

import com.pu.blog.model.entity.LoginRecord;

public interface LoginRecordMapper {
	/**
	 * 添加记录
	 * @param loginRecord
	 */
	void insertLoginRecord(LoginRecord loginRecord);
	/**
	 * 查询所有记录
	 * @return
	 */
	List<LoginRecord> selectLoginRecordlist();
	/**
	 * 查询最新记录
	 * @return
	 */
	List<LoginRecord> selectLatestRecord();

}
