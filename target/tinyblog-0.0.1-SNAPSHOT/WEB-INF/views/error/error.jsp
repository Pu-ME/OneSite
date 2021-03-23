<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
    <head>
        <meta charset="utf-8">
        <title>错误页面</title>
        <style>
            html,body {
                width: 100%;
                height: 100%;
                margin: 0;
                padding: 0;
            }
            
            .divProduct{
                font-size: 50px;
                position: relative; /*脱离文档流*/
                top: 40%; /*偏移*/
                text-align: center;
                color:red;
            }
        </style>
    </head>
    
    <body>
        
        <div class="divProduct">error page<br>
        		${message }<br>
        	<a href="${pageContext.request.contextPath }" style="font-size:20px">返回首页</a>
        </div>

    </body>
</html>