<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>博客后台</title>
    <!-- css -->
    <c:import url="./common/css.jsp"></c:import>
</head>
<body class="layui-layout-body">
	<div class="layui-layout layui-layout-admin">
	
	    <div class="layui-header">
	       <c:import url="./common/header.jsp"></c:import>
	    </div>
	    <div class="layui-side layui-bg-black admin-side">
	        <c:import url="./common/menu.jsp"></c:import>
	    </div>
	    <div id="admin-body" class="layui-body">
	        <div class="layui-row layui-col-space20" style="padding:20px">
		       	 <div class="layui-col-md3">
			        <div class="layui-card" >
					  <div class="layui-card-header">文章数量</div>
					  <div class="layui-card-body layui-col-md">
						<cite style="font-style: normal;font-size: 30px;font-weight: 300;color:#009688">${allCount }</cite>
					  </div>
					</div>
				 </div>
				 <div class="layui-col-md3">
			        <div class="layui-card" >
					  <div class="layui-card-header">已发布</div>
					  <div class="layui-card-body layui-col-md">
							<cite style="font-style: normal;font-size: 30px;font-weight: 300;color:#009688">${publishCount }</cite>
					  </div>
					</div>
				 </div>			 
				 <div class="layui-col-md3" >
			        <div class="layui-card " >
					  <div class="layui-card-header">草稿</div>
					  <div class="layui-card-body layui-col-md">
					  		<cite style="font-style: normal;font-size: 30px;font-weight: 300;color:#009688">${draftCount }</cite>
					  </div>
					</div>
				 </div>
				 <div class="layui-col-md3">
			        <div class="layui-card" >
					  <div class="layui-card-header">总阅读数</div>
					  <div class="layui-card-body layui-col-md">
					  		<cite style="font-style: normal;font-size: 30px;font-weight: 300;color:#009688">${allViews }</cite>
					  </div>
					</div>
				 </div>
			 </div>
			 <div class="layui-row layui-col-space20" style="padding:0 20px">
				 
				 <div class="layui-col-md6">
			        <div class="layui-collapse">
				          <div class="layui-colla-item">
				          <h2 class="layui-colla-title">最新文章</h2>
				           <div class="layui-colla-content layui-show">
							  <table class="layui-table" lay-skin="line">
							    <colgroup>
							    <col width="250">
							    <col>
							  	</colgroup>
							    <thead>
								    <tr>
								      <th>标题</th>
								      <th>状态</th>
								      <th>发布时间</th>
								    </tr> 
							  </thead>	
							  <tbody>
								    <c:forEach items="${latestArticle }" var="data" varStatus="status">
							  		 <tr>
								  		<td>
								  			<a href="${pageContext.request.contextPath}/admin/article/${data.id }">${data.title }</a>
								  		</td>
								  		<td>${data.status==1?'已发布':'草稿' }</td>
								  		<td>${data.createTime }</td>
								  		</tr>
								  	</c:forEach>
							  </tbody>
							</table>
					  	</div>
					  </div>
					</div>
				 </div>
				 
				 <div class="layui-col-md6">
					 <div class="layui-collapse">
				          <div class="layui-colla-item">
						    <h2 class="layui-colla-title">登录日志</h2>
						    <div class="layui-colla-content layui-show">
						    	<table class="layui-table" lay-skin="line">
								    <colgroup>
								    <col width="100">
								    <col>
								  	</colgroup>
								    <thead>
									    <tr>
									      <th>用户名</th>
									      <th>登录ip</th>
									      <th>登录时间</th>
									    </tr> 
								  </thead>	
								  <tbody>
									    <c:forEach items="${latestRecord }" var="data" varStatus="status">
								  		 <tr>
									  		<td>${data.username }</td>
									  		<td>${data.ip}</td>
									  		<td>${data.createtime }</td>
									  		</tr>
									  	</c:forEach>
								  </tbody>
								</table>
						    </div>
						  </div>
					   </div>
				 </div>
				 
			 </div>
	    </div>
	    <div class="layui-footer admin-footer">
	        <c:import url="./common/footer.jsp"></c:import>
	    </div>
	</div>
		
</body>
	<!-- js -->
	<c:import url="./common/js.jsp"></c:import>
	<script type="text/javascript">
	layui.use('element', function(){
		  var element = layui.element;
		  
		  //…
		});
	</script>
</html>