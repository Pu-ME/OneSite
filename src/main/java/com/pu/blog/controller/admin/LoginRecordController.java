package com.pu.blog.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.pu.blog.model.entity.LoginRecord;
import com.pu.blog.model.entity.Msg;
import com.pu.blog.service.LoginRecordService;

@RequestMapping("/admin/loginrecord")
@Controller
public class LoginRecordController {
	@Autowired
	private LoginRecordService loginRecordService;
	
	@RequestMapping(value="/",method=RequestMethod.GET)
	public String goLoginRecordPage(){
		return "admin/loginrecord/list";
	}
	/**
	 * 查询所有记录
	 * @param pn
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public Msg getLoginRecordList(@RequestParam(value="pn",defaultValue="1")Integer pn){
		int pageSize = 8;
		PageHelper.startPage(pn, pageSize);
		List<LoginRecord> loginRecordList = loginRecordService.getLoginRecordList();
		PageInfo<LoginRecord> page = new PageInfo<>(loginRecordList, 5);
		return Msg.success().add("page", page);
	}
}
