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
    <title>友情链接 - ${siteInfo.title }</title>
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
                <h1 class="post-title" itemprop="name headline">友情链接</h1>
                <div class="post-data">
                    <!-- <time datetime="2017-09-17" itemprop="datePublished">发布于 2018-11-29</time> -->
                </div>
        </div>
        <div id="post-content" class="post-content"><h2>友情链接</h2>
            <ul>
            	<c:forEach items="${links }" var="data">
	                <li>
	                    <p>🔒 <a href="${data.url}" target="_blank">${data.name}</a></p>
	                </li>
                </c:forEach>
            </ul>
            <h2>链接须知</h2>
            <blockquote>
            <p>请确定贵站可以稳定运营
            原创博客优先，技术类博客优先，设计、视觉类博客优先
            经常过来访问和评论，眼熟的</p>
            </blockquote>
            <p>备注：默认申请友情链接均为内页（当前页面）</p>
            <h2>基本信息</h2>
            <pre>
                <code class="hljs cpp">网站名称：GGH的博客空间
                    <br>网站地址：https:<span class="hljs-comment">//gghtech.club</span>
                </code>
            </pre>
            <p>友链直接发邮箱，备注名字或者一句话</p>
            <p>还有，我会不定时对无法访问的网址进行清理，请保证自己的链接长期有效。</p>
        </div>
</article>
<%-- 评论未实现 --%>
<%-- <div id="1" class="comment-container">
        <div id="comments" class="clearfix">
            <span class="response"></span>
            <form method="post" id="comment-form" class="comment-form" onsubmit="return TaleComment.subComment();">
                <input type="hidden" name="coid" id="coid">
                <input type="hidden" name="cid" id="cid" value="1">
                <input type="hidden" name="csrf_token" value="CyffsUNeFzyNfWMMBM6Lk0">
                <input name="author" maxlength="12" id="author" class="form-control input-control clearfix" placeholder="姓名 (*)" value="" required="">
                <input type="email" name="mail" id="mail" class="form-control input-control clearfix" placeholder="邮箱 (*)" value="" required="">
                <input type="url" name="url" id="url" class="form-control input-control clearfix" placeholder="网址 (http://)" value="">
                <textarea name="content" id="textarea" class="form-control" placeholder="基佬，留下你的评论." required="" minlength="5" maxlength="2000"></textarea>
                <button class="submit" id="misubmit">提交</button>
            </form>
    </div>
</div> --%>

<c:import url="./common/footer.jsp"></c:import>
