package com.pu.blog.model.entity;

import java.util.HashMap;
import java.util.Map;

public class Msg {
	private int code;  //状态码，返回100成功，返回200失败
	private String msg;
	private Map<String,Object> data = new HashMap<String,Object>();
	
	public Msg add(String key,Object value) {
		this.getData().put(key, value);
		return this;
	}
	
	public static Msg success() {
		Msg result = new Msg();
		result.setCode(100);
		result.setMsg("处理成功！");
		return result;
	}
	
	public static Msg fail() {
		Msg result = new Msg();
		result.setCode(200);
		result.setMsg("处理失败！");
		return result;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public Map<String, Object> getData() {
		return data;
	}
	public void setData(Map<String, Object> data) {
		this.data = data;
	}
}
