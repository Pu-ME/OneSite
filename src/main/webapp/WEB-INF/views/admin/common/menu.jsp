<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="layui-side-scroll" style="width: 100%">
        <div class="admin-side-fold"><i class="fa fa-navicon" aria-hidden="true"></i></div>

        <ul class="layui-nav layui-nav-tree"  lay-filter="nav-side">
			<li class="layui-nav-item layui-nav-itemed">
                <a href="${pageContext.request.contextPath }/admin/" data-icon="fa-home"class="pointer">
                    <i class="fa fa-home back_space1"></i><span>  &nbsp;&nbsp;仪表盘</span>
                </a>
            </li>
			<li class="layui-nav-item layui-nav-itemed">
				<a href="${pageContext.request.contextPath }/admin/article/edit" data-icon="&#xe715;" data-title="写文章"  class="pointer">
					<i class="fa fa-pencil-square-o" aria-hidden="true"></i>  &nbsp;&nbsp;<span>写文章</span>
				</a>
			</li>
			<li class="layui-nav-item layui-nav-itemed">
				<a href="${pageContext.request.contextPath }/admin/article/" data-icon="&#xe715;" data-title="文章管理"  class="pointer">
					<i class="fa fa-list-ul" aria-hidden="true"></i>  &nbsp;&nbsp;<span>文章管理</span>
				</a>
            </li>
            <li class="layui-nav-item layui-nav-itemed">
				<a href="${pageContext.request.contextPath }/admin/category/" data-icon="&#xe715;" data-title="分类管理"  class="pointer">
					<i class="fa fa-star-o"></i>  &nbsp;&nbsp;<span>分类管理</span>
				</a>
            </li>
            <li class="layui-nav-item layui-nav-itemed">
                <a href="${pageContext.request.contextPath }/admin/user/${loginUser.id}" data-icon="&#xe715;" data-title="资料修改"  class="pointer">
                     <i class="fa fa-edit"></i>  &nbsp;&nbsp;<span>我的资料</span>
                 </a>
            </li>
		    <li class="layui-nav-item layui-nav-itemed">
				<a href="${pageContext.request.contextPath }/admin/link/" data-icon="&#xe715;" data-title="友链管理"  class="pointer">
						<i class="fa fa-link" aria-hidden="true"></i>  &nbsp;&nbsp;<span>友链管理</span>
				 </a>
            </li>
            <li class="layui-nav-item layui-nav-itemed">
				<a href="${pageContext.request.contextPath }/admin/loginrecord/" data-icon="&#xe715;" data-title="登录日志"  class="pointer">
						<i class="fa fa-hourglass-half" aria-hidden="true"></i>  &nbsp;&nbsp;<span>登录日志</span>
				 </a>
            </li>
			<li class="layui-nav-item layui-nav-itemed">
                  <a href="${pageContext.request.contextPath }/admin/siteinfo/" data-icon="&#xe715;" data-title="设置"  class="pointer">
                    <i class="fa fa-cogs"></i> &nbsp;&nbsp;<span>设置</span>
                  </a>
            </li>
        </ul>
    </div>