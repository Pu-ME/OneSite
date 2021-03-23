package com.pu.blog.service;

import java.util.List;

import com.pu.blog.model.entity.LoginRecord;

public interface LoginRecordService {
	/**
	 * 添加记录
	 * 
	 * @param loginRecord
	 */
	void addLoginRecord(LoginRecord loginRecord);

	/**
	 * 查询所有记录
	 * 
	 * @return
	 */
	List<LoginRecord> getLoginRecordList();
	/**
	 * 查询最新记录
	 * @return
	 */
	List<LoginRecord> getLatestLoginRecord();
}
