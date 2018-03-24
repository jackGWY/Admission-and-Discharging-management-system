<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set value="${pageContext.request.contextPath }" scope="page" var="ctx"></c:set>

<script type="text/javascript">
	reloadjs('${ctx}/assets/js/app.js');//重新加载js的方法

	function Method(url) {//跳转到对应的jsp页面
		openContent(url);
	}
	$(function() {// 二级菜单的刻印
		$(".left-link").on("click", function() {
			$(".left-link").removeClass("active");
			$(this).addClass("active");
		});
	});
</script>
<li class="sidebar-nav-link">
	<a href="javascript:;"class="sidebar-nav-sub-title"> 
		<i class="sidebar-nav-link-logo"></i>基本信息 
		<span class="am-icon-chevron-down am-fr am-margin-right-sm sidebar-nav-sub-ico"></span>
	</a>
	<ul class="sidebar-nav sidebar-nav-sub">
		<li class="sidebar-nav-link"onClick="Method('/doctor/**')"><a	href="javascript:;"class="left-link"> 
			<span class="am-icon-angle-right sidebar-nav-link-logo"></span> 医生基本信息 </a>
		</li>
		<li class="sidebar-nav-link"onClick="Method('/doctor/**')"><a href="javascript:;"class="left-link"> 
			<span class="am-icon-angle-right sidebar-nav-link-logo"></span> 医生作息时间 </a>
		</li>
		
	</ul>
</li>
<li class="sidebar-nav-link">
	<a href="javascript:;"class="sidebar-nav-sub-title"> 
		<i class="sidebar-nav-link-logo"></i>医生团队 
		<span class="am-icon-chevron-down am-fr am-margin-right-sm sidebar-nav-sub-ico"></span>
	</a>
	<ul class="sidebar-nav sidebar-nav-sub">
		<li class="sidebar-nav-link"onClick="Method('/doctor/doctor_team.do')"><a	href="javascript:;"class="left-link">
			<span class="am-icon-angle-right sidebar-nav-link-logo"></span> 医生诊疗组 </a>
		</li>
		<li class="sidebar-nav-link"onClick="Method('/doctor/department_management.do')"><a href="javascript:;"class="left-link">
			<span class="am-icon-angle-right sidebar-nav-link-logo"></span> 科室管理</a>
		</li>
		<li class="sidebar-nav-link"onClick="Method('/doctor/**')"><a href="javascript:;"class="left-link"> 
			<span class="am-icon-angle-right sidebar-nav-link-logo"></span> 医生建议</a>
		</li>
	</ul>
</li>
