package com.pu.blog.exception;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

public class MeExceptionResolver implements HandlerExceptionResolver {

	@Override
	public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler,
			Exception e) {
		//向控制台输出异常信息
		e.printStackTrace();
		//定义错误信息
		String message = "系统异常，请稍后重试!";
		//判断是不是自己抛出的异常
		if(e instanceof MeException) {
			message = ((MeException)e).getMessage();
		}
		//判断请求类型
		HandlerMethod handMethod = (HandlerMethod)handler;
		ResponseBody responseBody = handMethod.getMethod().getAnnotation(ResponseBody.class);
		
		if(responseBody!=null) {
			// json请求（返回json数据）
			Map<String, Object> responseMap = new HashMap<String, Object>();
			responseMap.put("code", "999999");
			responseMap.put("message", message);
			String json = new Gson().toJson(responseMap);
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/json; charset=utf-8");
			try {
				response.getWriter().write(json);
				response.getWriter().flush();
			} catch (IOException e1) {
				e1.printStackTrace();
			}
			
			// 返回一个空的ModelAndView表示已经手动生成响应
			return new ModelAndView();
		}
		// 页面转发（跳转至错误页面）
		ModelAndView modelAndView = new ModelAndView("error/error");
		//将错误信息传到页面
		modelAndView.addObject("message", message);
		
		return modelAndView;
	}

}
