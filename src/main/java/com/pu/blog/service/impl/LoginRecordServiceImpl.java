package com.pu.blog.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pu.blog.dao.LoginRecordMapper;
import com.pu.blog.model.entity.LoginRecord;
import com.pu.blog.service.LoginRecordService;

@Service
public class LoginRecordServiceImpl implements LoginRecordService {
	@Autowired
	private LoginRecordMapper loginRecordMapper;

	@Override
	public void addLoginRecord(LoginRecord loginRecord) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		loginRecord.setCreatetime(sdf.format(new Date()));
		loginRecordMapper.insertLoginRecord(loginRecord);
	}

	@Override
	public List<LoginRecord> getLoginRecordList() {
		return loginRecordMapper.selectLoginRecordlist();
	}

	@Override
	public List<LoginRecord> getLatestLoginRecord() {
		return loginRecordMapper.selectLatestRecord();
	}

}
