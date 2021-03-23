<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
     <div class="layui-logo">
     	<i class="fa fa-tachometer" aria-hidden="true"></i> &nbsp;TinyBlog
     </div>

     <ul class="layui-nav layui-layout-left admin-nav-item">
		<li class="layui-nav-item">
			<a href="${pageContext.request.contextPath}/" target="_blank"><i class="fa fa-bookmark-o" aria-hidden="true"></i> 首页</a>
		</li>
     </ul>
     <ul class="layui-nav layui-layout-right admin-nav-item" >
         <li class="layui-nav-item admin-nav-item" >
             <a href="javascript:;">
                 <img src="${loginUser.img_url }" class="layui-nav-img">${loginUser.nickname }
             </a>
             <dl class="layui-nav-child admin-nav-child">
                 <dd><a href="${pageContext.request.contextPath}/admin/user/${loginUser.id}">个人中心</a></dd>
                 <dd><a href="${pageContext.request.contextPath}/admin/logout">退出系统</a></dd>
             </dl>
         </li>
     </ul>
  

