<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
		        <div class="layui-card-header">分类管理</div>
		        <div class="layui-card-body">
			        <div class="layui-form-item">
						<div style="margin-left: 30px;margin-top:10px">
							<button id="add-model" class="layui-btn">新增</button>
							<button id="categories_delete_all_btn" class="layui-btn layui-btn-danger">删除</button>
						</div>
					</div>	
					<div style="margin-left: 30px;margin-right:30px;">
						<table class="layui-table">
							<colgroup>
								<col width="50">
								<col width="100">
								<col width="100">
								<col width="100">
								<col width="100">
							</colgroup>
							<thead class="layui-table-thead">
								<tr>
									<th><input type="checkbox" id="check_all" /></th>
									<th>#</th>
									<th>分类名称</th>
									<th>顺序</th>
									<th>操作</th>
									
								</tr>
							</thead>
							<tbody id="cdata">
														
							</tbody>
						</table>
						<div id="pageNav" style="text-align:right"></div>
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
	layui.use(['jquery', 'laypage','layer'], function(){ 
	  var $ = layui.$, //重点处
	  layer = layui.layer,
	  laypage=layui.laypage;
	  
	  //新增编辑框
	  var add_model_index;
	  $("#add-model").click(function openform(){
			add_model_index=layer.open({
			  type: 1,
			  title:'添加分类',
			  shadeClose : true,
			  skin: 'layui-layer-rim', //加上边框
			  area: ['380px', '280px'], //宽高
			  content: '<div id="add-main" ><form id="add-form" class="layui-form"  style="padding-top:30px;" >	<div class="layui-form-item"><label class="layui-form-label">名称</label><div class="layui-input-inline"><input type="text" class="layui-input" id="add_input_name" name="categoryName" placeholder="请输入名称" autocomplete="off" ></div></div ><div class="layui-form-item"><label class="layui-form-label">顺序</label><div class="layui-input-inline"><input type="text" id="add_input_sort" name="sort" placeholder="请输入顺序,默认为0..." class="layui-input"></div></div><div class="layui-form-item"><div class="layui-input-block"><button class="layui-btn" type="button" id="add-btn">添加</button><button type="reset" class="layui-btn layui-btn-primary">重置</button></div></div></form></div>'
			})
		})
		//修改编辑框
		var edit_model_index;
		function editform(){
			edit_model_index=layer.open({
			  type: 1,
			  title:'编辑分类',
			  shadeClose : true,
			  skin: 'layui-layer-rim', //加上边框
			  area: ['380px', '280px'], //宽高
			  content: '<div id="update-main" ><form id="update-form" class="layui-form"  style="padding-top:30px;" > <input type="hidden" id="update_input_id" name="id"/>	<div class="layui-form-item"><label class="layui-form-label">名称</label><div class="layui-input-inline"><input type="text" class="layui-input" id="update_input_name" name="categoryName" placeholder="请输入名称" autocomplete="off" ></div></div ><div class="layui-form-item"><label class="layui-form-label">顺序</label><div class="layui-input-inline"><input type="text" id="update_input_sort" name="sort"  class="layui-input"></div></div><div class="layui-form-item"><div class="layui-input-block"><button class="layui-btn" type="button" id="update-btn">修改</button><button type="reset" class="layui-btn layui-btn-primary">重置</button></div></div></form></div>'
			})
		}  
	   //添加分类
	   $(document).on("click","#add-btn",function(){
		  	var name=$('#add_input_name').val();
			var sort=$('#add_input_sort').val();
			if(name==""){
				layer.msg("请填写信息", {icon: 2,time:1000});
				return false;
			}
		   	$.ajax({
		   		type:'POST',
		   		url:'${pageContext.request.contextPath}/admin/category/editcategory',
				data:$('#add-form').serialize(),
				success:function(result){					
					if(result.code == "100"){
						layer.close(add_model_index);
						layer.msg(result.msg, {icon: 1,time:1000});
						queryPage(1);
					}else{			
						layer.msg(result.msg, {icon: 2,time:1000});
					}
					
					return false;
				}
		   	});
	   });
	  //页面加载执行
	  $(function(){
		  queryPage(1);
	  });
	  //构建分页条
	  function pagebuild(datas){
            laypage.render({
              elem: 'pageNav', //注意，这里的 test1 是 ID，不用加 # 号
              count: datas.total, //数据总数，从服务端得到
              limit:datas.pageSize,
              curr: datas.pageNum,
              last:datas.pages,
              layout: ['count', 'prev', 'page', 'next',  'skip'],
              jump:function(obj,first){
           	    //obj包含了当前分页的所有参数，比如：
           	   var curr=obj.curr;
           	    //首次不执行
           	    if(!first){
           	    	queryPage(curr); 
           	    }
              }
            });            
		} 
	  //ajax查询数据
	  function queryPage(pn){
		  	var index =null;
		 	var jsondata = {"pn":pn};
			$.ajax({
				type:'GET',
				url:'${pageContext.request.contextPath}/admin/category/list',
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
						$.each(datas,function(i,data){
							tableContent+='<tr>';
							tableContent+='<td><input type="checkbox" class="check_item" name="id" value="'+data.id+'"/></td>';
							tableContent+='<td>'+(i+1)+'</td>';
							tableContent+='<td>'+data.categoryName+'</td>';
							tableContent+='<td>'+data.sort+'</td>';
							tableContent+='<td>';
							tableContent+='<button  edit-id="'+data.id+'" class="layui-btn layui-btn-normal layui-btn-sm edit-btn">编辑</button>';
							tableContent+='</td>';
							tableContent+='</tr>';
						});
						$("#cdata").html(tableContent);
						pagebuild(result.data.page);
					}else{			
						layer.msg(result.msg, {icon: 2,time:1000});
					}
					return false;
				}
				
			});
		};
		  //更新分类
		  $(document).on("click","#update-btn",function(){
			    var index=null;
			   	$.ajax({
			   		type:'PUT',
			   		url:'${pageContext.request.contextPath}/admin/category/editcategory',
					data:$('#update-form').serialize(),
					beforeSend:function(){
						index = layer.load(1, {shade: false});
					},
					success:function(result){
						layer.close(index);
						if(result.code == "100"){
							layer.msg(result.msg, {icon: 1,time:1000});
							layer.close(edit_model_index);
							queryPage(1);
						}else{			
							layer.msg(result.msg, {icon: 2,time:1000});
						}						
						return false;
					}
			   	});
		   });
			//全选
			$("#check_all").click(function() {
				$(".check_item").prop("checked", $(this).prop("checked"))
			});
			$(document).on("click",".check_item",function() {
				var flag = $(".check_item:checked").length == $(".check_item").length;
				$("#check_all").prop("checked", flag);
			});
			//删除
			$("#categories_delete_all_btn").click(function(){
				var del_idstr = "";
				$.each($(".check_item:checked"),function(){
					<%-- 组装id字符串  --%>
					del_idstr += $(this).val()+"-";
				});
				<%-- 去除删除的id多余的- --%>
				del_idstr = del_idstr.substring(0, del_idstr.length-1);
				if(del_idstr==""){
					layer.msg("请选择需要删除的分类", {icon: 2,time:1000});
					return false;
				}
				layer.confirm('确认删除这些分类？', {
					  btn: ['是','否'] ,//按钮
					  title:'提示'
					}, function(){
						var index = null;
						$.ajax({
							url:"${pageContext.request.contextPath }/admin/category/"+del_idstr,
							type:"DELETE",
							beforeSend:function(){
								index = layer.load(1, {shade: false});									
							},
							success:function(result){
								layer.close(index);
								if(result.code=="100"){
									layer.msg(result.data.msg, {icon: 1,time:1000});
									queryPage(1);
								}
								else{
									layer.msg(result.data.msg, {icon: 2,time:1000});
								}
								return false;
							}
						});
					  
					}, function(){
					  layer.msg('已取消删除', {
					    time: 1000
					  });
					});
				
			});	
			//修改分类
			$(document).on("click",".edit-btn",function(){
				var id = $(this).attr("edit-id");
				getCategory(id);				
				editform();
			});
			//获取分类
			function getCategory(id){
				$.ajax({
					url:"${pageContext.request.contextPath}/admin/category/"+id,
					type:"GET",
					success:function(result){
						var data=result.data.category;
						$("#update_input_name").val(data.categoryName);
						$("#update_input_sort").val(data.sort);
						$("#update_input_id").val(data.id);
					}
				});
			}
		  
		});
	
	</script>
</body>
</html>