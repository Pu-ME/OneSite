package com.pu.blog.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.pu.blog.model.entity.User;

//import me.pu.blog.bean.User;

public class MeInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		//获取请求URI
		String url = request.getRequestURI();
		String path = request.getSession().getServletContext().getContextPath();
		//登录，放行  || url.indexOf("portal")>=0
		if(url.indexOf("login")>=0) {
			return true;
		}
		//获取session
		HttpSession session = request.getSession();
		//取出登录用户
		User loginUser = (User) session.getAttribute("loginUser");
		//存在，放行
		if(loginUser!=null) {
			return true;
		}
		//不存在,跳转登录页面
		response.sendRedirect(path+"/admin/login");
		return false;
		
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {

	}

}
