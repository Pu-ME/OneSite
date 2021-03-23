<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	
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
    <title>关于 - ${siteInfo.title }</title>
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
<article class="main-content page-page">
        <div class="post-header">
            <h1 class="post-title" itemprop="name headline">关于</h1>
            <div class="post-data">
                <time datetime="2017-02-23" itemprop="datePublished">发布于 2018-11-29</time>
            </div>
        </div>
        <div id="post-content" class="post-content"><h3>HelloWord</h3>
    <p>这里写博客介绍,这是关于我的界面</p>
    <h3>关于作者</h3>
    <p>这里写自己的介绍</p>
    <p>我的github:<a href="https://github.com/Pu-ME"><img src="https://img.shields.io/github/followers/Pu-ME.svg?label=Follow%20Me&style=social"></a></p>
    </div>
</article>
<c:import url="./common/footer.jsp"></c:import>
