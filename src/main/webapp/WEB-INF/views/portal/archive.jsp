<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
    <meta name="renderer" content="webkit">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta http-equiv="Cache-Control" content="no-transform"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
     <meta name="keywords" content="${siteInfo.keywords}"/>
    <meta name="description" content="${siteInfo.description}"/>
  <%--  <meta content="${_csrf_token}" name="csrf_token"/> --%>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/static/portal/img/logo.png"/>
    <link rel="apple-touch-icon" href="${pageContext.request.contextPath}/static/portal/img/apple-touch-icon.png"/>
    <title>归档 - ${siteInfo.title }</title>
    <link href="${pageContext.request.contextPath}/static/portal/css/xcode.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/portal/css/style.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/static/plugins/jquery/jquery-2.1.4.min.js"></script>

    <!--[if lt IE 9]>
    <script src="//cdn.bootcss.com/html5shiv/r29/html5.min.js"></script>
    <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body class="bg-grey" gtools_scp_screen_capture_injected="true">
<!--[if lt IE 8]>
<div class="browsehappy" role="dialog">
    当前网页 <strong>不支持</strong> 你正在使用的浏览器. 为了正常的访问, 请 <a href="http://browsehappy.com/" target="_blank">升级你的浏览器</a>。
</div>
<![endif]-->
<header id="header" class="header bg-white">
<c:import url="./common/header.jsp"></c:import>
</header>
<div class="main-content archive-page clearfix">
    <div class="categorys-item">
    	<c:forEach items="${datas }" var="data" varStatus="status">
	        <div class="categorys-title">${data.year }年${data.month }月</div>
	        <div class="post-lists">
	            <div class="post-lists-body">
	            	<c:forEach items="${data.articleDto }" var="article">
		                <div class="post-list-item">
		                    <div class="post-list-item-container">
		                        <div class="item-label">
		                            <div class="item-title">
		                                <a href="${pageContext.request.contextPath}/article/${article.id}" target="_blank">${article.title }</a>
		                            </div>
		                            <div class="item-meta clearfix">
		                                <div class="item-meta-date">发布于
		                                	<fmt:parseDate value="${article.createtime }" pattern="yyyy-MM-dd HH:mm:ss" var="date"></fmt:parseDate>
		                                	<fmt:formatDate value="${date }" pattern="yyyy-MM-dd"/>
		                                </div>
		                            </div>
		                        </div>
		                    </div>
		                </div>
	               </c:forEach>
	            </div>
	        </div>
        </c:forEach>
    </div>
</div>
<c:import url="./common/footer.jsp"></c:import>
