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
		        <div class="layui-card-header">我的资料</div>
		        <div class="layui-card-body">
						<div class="layui-tab layui-tab-brief" lay-filter="userinfo">
						  <ul class="layui-tab-title">
						    <li class="layui-this">基本资料</li>
						    <li>账号密码</li>
						  </ul>
						  <div class="layui-tab-content">
						  	<div class="layui-tab-item layui-show">
								<form class="layui-form layui-form-pane">
									  <input type="hidden" name="id" value="${user.id }" />
									  <div class="layui-form-item">
									    <label class="layui-form-label">用户名</label>
									    <div class="layui-input-block">
									      <input type="text" name="username" lay-verify="required" value="${user.username }"  autocomplete="off" disabled class="layui-input">
									    </div>
									  </div>
									  <div class="layui-form-item">
									    <label class="layui-form-label">昵称</label>
									    <div class="layui-input-block">
									      <input type="text" name="nickname" value="${user.nickname }"  lay-verify="required"  autocomplete="off" class="layui-input">
									    </div>
									  </div>
									  <div class="layui-form-item">
									    <label class="layui-form-label">email</label>
									    <div class="layui-input-block">
									      <input type="text" name="email" value="${user.email }" lay-verify="email" autocomplete="off" class="layui-input">
									    </div>
									  </div>
									  <div class="layui-form-item">
									    <label class="layui-form-label">github</label>
									    <div class="layui-input-block">
									      <input type="text" name="github" value="${user.github }" autocomplete="off" lay-verify="url" class="layui-input">
									    </div>
									  </div>
									  <div class="layui-form-item">
									    <label class="layui-form-label">img_url</label>
									    <div class="layui-input-block">
									      <input type="text" name="img_url" value="${user.img_url }" autocomplete="off" lay-verify="url" class="layui-input">
									    </div>
									  </div>
									  <div class="layui-form-item">
									    <label class="layui-form-label">创建日期</label>
									    <div class="layui-input-block">
									      <input type="text"  name="createDate" value="${user.createDate}" id="date" autocomplete="off" disabled class="layui-input">
									    </div>
									  </div>
									  <div class="layui-form-item">
									    <div class="layui-input-block">
									      <button class="layui-btn" lay-submit lay-filter="userform">提交</button>
									      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
									    </div>
									  </div>
								</form>
							  </div>
							   <div class="layui-tab-item">
							   		<form class="layui-form layui-form-pane">
									  <input type="hidden" name="id" value="${user.id }" />
									  <div class="layui-form-item">
									    <label class="layui-form-label">旧密码</label>
									    <div class="layui-input-inline">
									      <input type="password" name="oldPass"  lay-verify="required"  autocomplete="off" class="layui-input">
									    </div>
									  </div>
									  <div class="layui-form-item">
									    <label class="layui-form-label">新密码</label>
									    <div class="layui-input-inline">
									      <input type="password" id="newPass" name="newPass"  lay-verify="newPass" autocomplete="off" class="layui-input">
									    </div>
									  </div>
									  <div class="layui-form-item">
									    <label class="layui-form-label">确认密码</label>
									    <div class="layui-input-inline">
									      <input type="password" id="confirmPass" name="confirmPass" autocomplete="off" lay-verify="confirmPass" class="layui-input">
									      <span id="notice" style="font-weight:12;color:red"></span>
									    </div>
									  </div>
									  <div class="layui-form-item">
									    <div class="layui-input-block">
									      <button class="layui-btn" lay-submit lay-filter="editPassForm">更改</button>
									      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
									    </div>
									  </div>
									</form>
							   </div>
							</div>
					</div>				
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
		layui.use(['form','element','jquery'], function(){
		  var form = layui.form,
		  $=layui.$
		  ,layer = layui.layer,
		  element = layui.element;
		  $("#confirmPass").blur(function(){
			  var newPass=$("#newPass").val();
			  var confirmPass=$("#confirmPass").val();
			  if(newPass!=confirmPass){
				  $("#notice").html("两次密码输入不一致");
			  }
			  if(newPass==confirmPass){
				  $("#notice").html("");
			  }
			});
		  form.verify({
				newPass : [ /^[\S]{6,12}$/, '密码必须6到12位，且不能出现空格' ],
				confirmPass : [ /^[\S]{6,12}$/, '密码必须6到12位，且不能出现空格' ]
			});
		  form.on('submit(editPassForm)', function(data) {			  
				var index = null;
				$.ajax({
					url:"${pageContext.request.contextPath}/admin/user/editpass",
					type:'PUT',
					data:data.field,
					dataType:'JSON',
					beforeSend:function(){
						index = layer.load(1, {shade: false});
					},
					success:function(result){
						layer.close(index);
						if(result.code == "100"){
							layer.msg(result.data.msg, {icon: 1,time:1000});
						}else{			
							layer.msg(result.data.msg, {icon: 2,time:1000});
						}
					}
				});
				return false;
			});
		  form.on('submit(userform)', function(data) {			  
				var index = null;
				$.ajax({
					url:"${pageContext.request.contextPath}/admin/user/edit",
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
				form.render();
				return false;
			});
		});

	
	</script>
</body>
</html>