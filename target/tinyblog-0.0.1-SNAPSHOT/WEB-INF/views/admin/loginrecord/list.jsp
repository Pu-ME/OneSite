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
    <c:import url="../common/css.jsp"></c:import>
</head>
<body class="layui-layout-body">
	<div class="layui-layout layui-layout-admin">
	
	    <div class="layui-header">
	       <c:import url="../common/header.jsp"></c:import>
	    </div>
	    <div class="layui-side layui-bg-black admin-side">
	        <c:import url="../common/menu.jsp"></c:import>
	    </div>
	    <div  id="admin-body" class="layui-body">
	    	<div style="padding:15px;">
		        <div class="layui-card" >
				  <div class="layui-card-header">登录日志</div>
				  <div class="layui-card-body">

					<div style="margin-left: 30px;margin-right:30px;">
						<table class="layui-table">
							<colgroup>
								<col width="50">
								<col width="100">
								<col width="100">
								<col width="100">
							</colgroup>
							<thead class="layui-table-thead">
								<tr>
									<th>#</th>
									<th>用户名</th>
									<th>登录IP</th>
									<th>时间</th>
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
	    </div>
	    <div class="layui-footer admin-footer">
	        <!-- 底部固定区域 -->
	        <c:import url="../common/footer.jsp"></c:import>
	    </div>
	</div>
		
</body>
	<!-- js -->
	<c:import url="../common/js.jsp"></c:import>
	<script type="text/javascript">
		layui.use(['jquery','laypage','layer','form'],function(){
			  var $ = layui.$, //重点处
			  layer = layui.layer,
			  form=layui.form,
			  laypage=layui.laypage;

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
						url:'${pageContext.request.contextPath}/admin/loginrecord/list',
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
									tableContent+='<td>'+(i+1)+'</td>';
									tableContent+='<td>'+data.username+'</td>';
									tableContent+='<td>'+data.ip+'</td>';
									tableContent+='<td>'+data.createtime+'</td>';
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
				
		});
	</script>
</html>