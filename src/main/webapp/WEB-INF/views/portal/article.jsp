<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
	
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
    <title>${article.title }</title>
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
<article class="main-content page-page" itemscope itemtype="http://schema.org/Article">
    <div class="post-header">
        <h1 class="post-title" itemprop="name headline">
            <a href="#">${article.title }</a>
        </h1>
        <div class="post-data">
            <time itemprop="datePublished">发布于&nbsp; <fmt:parseDate value="${article.createTime }" var="createdate" pattern="yyyy-MM-dd HH:mm:ss"></fmt:parseDate> 
           			<fmt:formatDate value="${createdate }" pattern="yyyy-MM-dd HH:mm:ss"/> 
            </time>
        </div>
    </div>
    <div id="post-content" class="post-content" itemprop="articleBody">
        <p class="post-tags"></p>
 			${article.content }
        <p class="post-info">
            本文由 <a href="#">${article.user.nickname }</a> 创作，采用 <a href="https://creativecommons.org/licenses/by/4.0/" target="_blank"
            rel="external nofollow">知识共享署名4.0</a> 国际许可协议进行许可
            <br>本站文章除注明转载/出处外，均为本站原创或翻译，转载前请务必署名
            <br>最后编辑时间为:<fmt:parseDate value="${article.updateTime }" var="updatedate" pattern="yyyy-MM-dd HH:mm:ss"></fmt:parseDate> 
           				<fmt:formatDate value="${updatedate }" pattern="yyyy-MM-dd HH:mm:ss"/>
        </p>
        <a href="#"</a>
        </div>
</article>


<c:import url="./common/footer.jsp"></c:import>
