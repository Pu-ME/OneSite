<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport"content="width=device-width, initial-scale=1, maximum-scale=1">
		<c:import url="../common/css.jsp"></c:import>
	<title>博客后台</title>
</head>
<body class="layui-layout-body">
	<div class="layui-layout layui-layout-admin" >
		<div class="layui-header">
			<c:import url="../common/header.jsp"></c:import>
		</div>

		<div id="left-menu" class="layui-side layui-bg-black animated">
			<c:import url="../common/menu.jsp"></c:import>
		</div>

		<div id="admin-body" class="layui-body"  >
			<!-- 内容主体区域 -->
			<div class="layui-col-md12" style="padding:15px;">
			      <div class="layui-card">
			        <div class="layui-card-header">编辑文章</div>
			        <div class="layui-card-body">
			          	<form class="layui-form">
							<c:if test="${article.id!=null }">
								<input type="hidden" name="id" value="${article.id }" />
								<input type="hidden" name="_method" value="PUT" />
							</c:if>
							<div class="layui-form-item">
								<label class="layui-form-label">标题</label>
								<div class="layui-input-block">
									<input type="text" name="title" required lay-verify="required"
										value="${article.title }" autocomplete="off" placeholder="请输入标题" class="layui-input">
								</div>
							</div>
							<div class="layui-form-item" >
								<label class="layui-form-label">内容</label>
								<div class="layui-input-block">						
									<div id="editor"></div>
								</div>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label">分类</label>
								<div class="layui-input-inline">
									<select name="categoryId" lay-verify="required">
										<c:forEach items="${categories }" var="category">
											<option value="${category.id }" 
												<c:if test="${category.id == article.category.id }">selected</c:if>
											>${category.categoryName }</option>
										</c:forEach>
									</select>
								</div>
							 </div>
							<div class="layui-form-item">
							      <label class="layui-form-label">状态</label>
							      <div class="layui-input-inline">
				                        <input type="radio" name="status" value="1" title="发布" <c:if test="${article.status==1 }">checked</c:if>>
        								<input type="radio" name="status" value="2" title="草稿" <c:if test="${article.status==2 }">checked</c:if>>
							      </div>
							</div>
							<div class="layui-form-item">
								<div class="layui-input-block">
									<button class="layui-btn" lay-submit lay-filter="Articleform">保存</button>
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
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/plugins/wangEditor/wangEditor.min.js"></script>
	<script type="text/javascript">
		    
			layui.use(['laydate','form'], function() {
				var E = window.wangEditor;
				var editor = new E('#editor');
				editor.customConfig.menus = ['head','bold','fontSize','fontName','italic','underline','strikeThrough','foreColor','backColor','link','list','justify','quote','image','table','video','code','undo']
				editor.customConfig.zIndex = 100;
				editor.create();
				editor.txt.html('${article.content}');//文章回显
				var form = layui.form;
				var formdata = "";
				//监听提交
				form.on('submit(Articleform)', function(data) {
		            formdata=data.field;
		            formdata.content=editor.txt.html();
		            var summary_text=editor.txt.text();
		            if(summary_text.length>150){
		            	formdata.summary=summary_text.substring(0, 150);
		            }else{
		            	formdata.summary=summary_text;
		            }
					$.ajax({
						url:"${pageContext.request.contextPath}/admin/article/doedit",
						type:"POST",
						data:formdata,
						success:function(result){
							if(result.code == "100"){
								layer.msg('保存成功', {icon: 1,time:1000});
								window.location.href='${pageContext.request.contextPath}/admin/article/';
							}
							if(result.code == "200"){
								layer.msg('保存失败', {icon: 2,time:1000});
							}
						}
					});
					return false;
				});
			});
	
	</script>
</body>
</html>