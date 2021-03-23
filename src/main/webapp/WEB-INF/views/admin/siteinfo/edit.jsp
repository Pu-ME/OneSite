<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
	<c:import url="../common/css.jsp"></c:import>
<title>博客后台</title>
</head>
<body class="layui-layout-body">
	<div class="layui-layout layui-layout-admin">
		<div class="layui-header">
			<c:import url="../common/header.jsp"></c:import>
		</div>

		<div id="left-menu" class="layui-side layui-bg-black animated">
			<c:import url="../common/menu.jsp"></c:import>
		</div>

		<div id="admin-body" class="layui-body">
		      <div class="layui-col-md12" style="padding:15px;">
		      <div class="layui-card">
		        <div class="layui-card-header">站点配置</div>
		        <div class="layui-card-body">
					<form class="layui-form layui-form-pane">
						  <input type="hidden" name="id" value="${site.id }" />
						  <div class="layui-form-item">
						    <label class="layui-form-label">标题</label>
						    <div class="layui-input-block">
						      <input type="text" name="title" lay-verify="required" value="${site.title }"  autocomplete="off" class="layui-input">
						    </div>
						  </div>
						  <div class="layui-form-item">
						    <label class="layui-form-label">关键词</label>
						    <div class="layui-input-block">
						      <input type="text" name="keywords" value="${site.keywords }"  autocomplete="off" class="layui-input">
						    </div>
						  </div>
						  <div class="layui-form-item">
						    <label class="layui-form-label">描述</label>
						    <div class="layui-input-block">
						      <input type="text" name="description" value="${site.description }"  autocomplete="off" class="layui-input">
						    </div>
						  </div>
						  <div class="layui-form-item">
						    <div class="layui-input-block">
						      <button class="layui-btn" lay-submit lay-filter="siteform">提交</button>
						      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
						    </div>
						  </div>
					</form>
				</div>
			  </div>
			</div>	
		</div>
		<div class="layui-footer">
			<!-- 底部固定区域 -->
			<c:import url="../common/footer.jsp"></c:import>
		</div>
	</div>
	<c:import url="../common/js.jsp"></c:import>
	<script type="text/javascript">
		layui.use(['form'], function(){
		  var form = layui.form
		  ,layer = layui.layer;		  
		  form.on('submit(siteform)', function(data) {			  
				var index = null;
				$.ajax({
					url:"${pageContext.request.contextPath}/admin/siteinfo/editsite",
					type:'PUT',
					data:data.field,
					dataType:'JSON',
					beforeSend:function(){
						index = layer.load(1, {shade: false});
					},
					success:function(result){
						layer.close(index);
						if(result.code == "100"){
							layer.msg(result.msg, {icon: 1,time:1000});
						}else{			
							layer.msg(result.msg, {icon: 2,time:1000});
						}
					}
				});
				return false;
			});
		  
		  
		});

	
	</script>
</body>
</html>