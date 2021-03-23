<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<div class="navbar-container">
        <a href="${pageContext.request.contextPath}/" class="navbar-logo">
            <img src="${pageContext.request.contextPath}/static/portal/img/logo.png" alt="Blog"/>
        </a>
        <div class="navbar-menu">
            <a href="${pageContext.request.contextPath}/archive">归档</a>
            <a href="${pageContext.request.contextPath}/links">友链</a>
            <a href="${pageContext.request.contextPath}/about">关于</a>
        </div>
        <div class="navbar-search" onclick="">
            <span class="icon-search"></span>
            <form role="search" onsubmit="return false;">
                <span class="search-box">
                    <input type="text" id="search-inp" class="input" placeholder="搜索..." maxlength="30"
                           autocomplete="off">
                </span>
            </form>
        </div>
        <div class="navbar-mobile-menu" onclick="">
            <span class="icon-menu cross"><span class="middle"></span></span>
            <ul>
                <li><a href="archives.html">归档</a></li>
                <li><a href="links.ht.html">友链</a></li>
                <li><a href="about.html">关于</a></li>
            </ul>
        </div>
    </div>

