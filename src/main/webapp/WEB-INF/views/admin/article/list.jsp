<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
			<!-- 内容主体区域 -->
			<div class="layui-col-md12" style="padding:15px;">
			      <div class="layui-card">
			        <div class="layui-card-body">
						<!-- 搜索 -->
						<div class="layui-tab layui-tab-brief" lay-filter="articleStatus">
						  <ul class="layui-tab-title">
						    <li class="layui-this">全部</li>
						    <li>已发布</li>
						    <li>草稿</li>
						  </ul>
						  <div class="layui-tab-content">
						  	
						  	  	<div class="layui-form-item" style="margin-top:10px">
								    <div class="layui-inline" style="margin-left: 20px">
								      <div class="layui-input-inline">
								        <a href="${pageContext.request.contextPath }/admin/article/edit">
											<button class="layui-btn">新增</button>
										</a>
								      </div>
								    </div>
								    <div style="float:right;margin-right:10px">
								    	<form class="layui-form">
									    <div class="layui-inline">
									        <label class="layui-form-label">所属分类</label>
									      	<div class="layui-input-inline">
									      	 <!-- style="width:190px;height:38px;border-color:#D2D2D2" -->
												<select name="categoryId" id="categoryId">
													<option  value="">--- 请选择分类 ---</option>
													<c:forEach items="${categories }" var="category">
														<option  value="${category.id }">${category.categoryName }</option>
													</c:forEach>
												</select>
											</div>
									    </div>
									    <div class="layui-inline">
									      	<label class="layui-form-label">标题</label>
									      	<div class="layui-input-inline">
												<input type="text" name="keywords" id="keywords" class="layui-input">
											</div>
									    </div>
		    							<div class="layui-inline">
											<button class="layui-btn layui-btn-normal" id="search" lay-submit="" lay-filter="search-form"><i class="layui-icon">&#xe615;</i> </button>
										</div>
										</form>
									</div>
							  </div>
						      <div style="margin-left: 20px;margin-right:20px;">
									<table class="layui-table" >
										<colgroup>
										    <col width="350">
										    <col width="100">
										    <col width="100">
										    <col width="100">
										    <col width="100">
										    <col width="200">
										    <col width="150">
										</colgroup>
										<thead >
											<tr>
												<th>标题</th>
												<th>作者</th>
												<th>分类</th>
												<th>状态</th>
												<th>浏览量</th>
												<th>发布时间</th>
												<th>操作</th>
											</tr>
										</thead>
										<tbody id="adata">
										</tbody>
									</table>
								 </div>
								<div id="pageNav" class="layui-row" style="text-align:right"></div>
								 
							  </div>
					   </div>
					</div>  
				</div>
			</div>
		</div>
		<div class="layui-footer">
			<c:import url="../common/footer.jsp"></c:import>
		</div>
	</div>
	<c:import url="../common/js.jsp"></c:import>
	<script type="text/javascript">
		layui.use(['form','element','laypage'], function(){
			var form = layui.form;
			var element = layui.element;
			var laypage=layui.laypage;
			var status = 0;
			var categoryId,keywords;
			//选项卡
			element.on('tab(articleStatus)', function(data){
				if(data.index==0){
					status=data.index;
					queryData(1,status);
				}  
				else if(data.index==1){
					status=data.index;
					queryData(1,status);
				}
				else if(data.index==2){
					status=data.index;
					queryData(1,status);
				}
				else{
					return false;
				}
			});
			//页面加载时执行
			$(function(){
				queryData(1,status,categoryId,keywords);
			});	
			//条件搜索
			form.on('submit(search-form)', function(data){
				categoryId = $("#categoryId").val();
			    keywords = $("#keywords").val();
			    queryData(1,status,categoryId,keywords);//当前容器的全部表单字段，名值对形式：{name: value}
				return false;
			});
			//查询数据
			function queryData(pn,status,categoryId,keywords){
				var index =null;
			 	var jsondata = {"pn":pn,"status":status,"categoryId":categoryId,"keywords":keywords};
				$.ajax({
					type:'GET',
					url:'${pageContext.request.contextPath}/admin/article/listarticles',
					data:jsondata,
					dataType:'JSON',
					beforeSend:function(){
						index = layer.load(1, {shade: false});
					},
					success:function(result){
						layer.close(index);
						if(result.code == "100"){
							var tableContent="";
							var datas = result.data.page.list;
							<fmt:formatDate value='${user.createDate}' pattern='yyyy-MM-dd'/>
							$.each(datas,function(i,data){
								var status = data.status==1?'已发布':'草稿';
								tableContent+='<tr>';
								tableContent+='<td>'+data.title+'</td>';
								tableContent+='<td>'+data.user.nickname+'</td>';
								tableContent+='<td>'+data.category.categoryName+'</td>';
								tableContent+='<td>'+status+'</td>';
								//tableContent+='<td>'+data.views+'</td>';
								tableContent+='<td>';
								tableContent+='<a target="_blank" href="${pageContext.request.contextPath}/article/'+data.id+'"><button class="layui-btn  layui-btn-sm edit-btn" style="margin:0 10px">预览</button></a>';
								tableContent+='</td>';
								tableContent+='<td>'+data.createTime+'</td>';
								tableContent+='<td>';
								tableContent+='<a href="${pageContext.request.contextPath}/admin/article/'+data.id+'"><button class="layui-btn layui-btn-normal layui-btn-sm edit-btn" style="margin:0 10px">编辑</button></a>';
								tableContent+='<button  delete-id="'+data.id+'" class="layui-btn layui-btn-danger layui-btn-sm delete-btn">删除</button>';
								tableContent+='</td>';
								tableContent+='</tr>';
							});
							$("#adata").html(tableContent);
							pagebuild(result.data.page);
						}else{			
							layer.msg(result.msg, {icon: 2,time:1000});
						}
						return false;
					}
					
				});
			}
			//构建分页条
		   function pagebuild(datas){
	            laypage.render({
	              elem: 'pageNav',
	              count: datas.total,
	              limit:datas.pageSize,
	              curr: datas.pageNum,
	              last:datas.pages,
	              groups:datas.navigatePages,
	              layout: ['count', 'prev', 'page', 'next',  'skip'],
	              jump:function(obj,first){
	           	   var curr=obj.curr;
	           	    if(!first){
	           	    	queryData(curr,status,categoryId,keywords); 
	           	    }
	              }
	            });            
			 } 
			//删除文章
			$(document).on("click",".delete-btn",function(){
				var id = $(this).attr("delete-id");
				var index=null;
				layer.confirm('确认删除这篇文章？', {
					  btn: ['是','否'] ,//按钮
					  title:'提示'
					}, function(){
						$.ajax({
							url:"${pageContext.request.contextPath}/admin/article/"+id,
							type:"DELETE",
							beforeSend:function(){
								index = layer.load(1, {shade: false});
							},
							success:function(result){
								layer.close(index);
								if(result.code=="100"){
									layer.msg(result.msg, {icon: 1,time:1000});
									queryData(1,status,categoryId,keywords);
								}else{
									layer.msg(result.msg, {icon: 2,time:1000});
								}
							}
						});
						}, function(){
							  layer.msg('已取消删除', {
							    time: 1000
							  });
						});
						
			});
		
			
		});
	</script>
</body>
</html>