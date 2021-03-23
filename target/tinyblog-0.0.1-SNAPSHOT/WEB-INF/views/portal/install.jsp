<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.bootcss.com/twitter-bootstrap/4.2.1/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.css">
	<style type="text/css">
     body{
    background-color: #eeeeee;
    }
    .be-content{
        max-width: 410px;
        margin: 100px auto;
        background-color: #ffffff;
        box-shadow: -2px 2px 4px 0px rgba(0, 0, 0, 0.04);
        border-width: 0;
        border-top-width: 0px;
        border-radius: 3px;
    }
    .br-content{
        width: 301px;
        margin: 0px auto;
    }
    .bootint{
        width: 300px
    }
    .ioc_text{
        text-align: center;
        padding-top: 30px;
        margin-bottom: 60px;
    }
    .ioc_text span{
        display: block;
        font-size: 13px;
        margin-top: 11px;
    }
    .ioc_text img{
        width: 106px;
        height: 28px;
    }
    .br-text{
        font-size: 12px;
        padding-top: 10px;
    }
    .btn{
        width: 300px;
        height: 38px;
        color: white;
        background-color: #1266f1;
    }
    .be-con{
        width: 190px;
        height: 14px;
        font-size: 11px;
        margin: 50px auto;
        padding-bottom: 20px;
    }   
    </style>
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>TinyBlog安装</title>
</head>
<body>

    <div>
        <div class="be-content pren">

            <div class="ioc_text">
                <h2>TinyBlog安装</h2>
            </div>

            <div>
                <form id="addform">
                    <div class="br-content">
                         <div class="input-group mb-4 bootint">
                             <div class="input-group-prepend">
                                 <span class="input-group-text"><i class="fa fa-user"></i></span>
                             </div>
                             <input type="text" name="username"  class="form-control" placeholder="用户名">
                         </div>

                         <div class="input-group mb-4 bootint">
                             <div class="input-group-prepend">
                                 <span class="input-group-text"><i class="fa fa-unlock-alt"></i></span>
                             </div>
                             <input type="password" name="password" class="form-control" placeholder="密码">
                         </div>
                        <div style="padding-top: 10px">
                            <input type="button" id="submit" class="btn" value="创建管理员">
                        </div>
                        <div class="be-con"></div>
                    </div>
                </form>
            </div>
        </div>
    </div>	
</body>
<script src="${pageContext.request.contextPath}/static/plugins/jquery/jquery-2.1.4.min.js"></script>
<script src="${pageContext.request.contextPath}/static/plugins/layer/layer.js"></script>
<script type="text/javascript">
	$("#submit").click(function(){
		$.ajax({
			url:"${pageContext.request.contextPath}/portal/adduser",
			type:'POST',
			data:$("#addform").serialize(),
			success:function(result){
				if(result.code==100){
				layer.msg("创建成功，跳转后台登录页面...",{icon:1,time:1000});
				window.location.href = "${pageContext.request.contextPath}/admin/login";
				}
				else{
					layer.msg(result.data.failmsg,{icon:2,time:1000});
				}
			}
		});
	});
</script>
</html>