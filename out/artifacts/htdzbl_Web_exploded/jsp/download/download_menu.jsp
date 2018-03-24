<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set value="${pageContext.request.contextPath }" scope="page"	var="ctx"></c:set>

<script type="text/javascript">
	reloadjs('${ctx}/assets/js/app.js');//重新加载js的方法
	
	function Method(url) {//跳转到对应的jsp页面
		openContent(url);
	}
	$(function() { // 二级菜单的刻印
		$(".left-link").on("click", function() {
			$(".left-link").removeClass("active");
			$(this).addClass("active");
		});
	});
</script>
<li class="sidebar-nav-link" onClick="Method('/report/download_check.do')"><a href="javascript:;" class="left-link">  
	<span class="am-icon-angle-right sidebar-nav-link-logo"></span>检查单 </a></li>
<li class="sidebar-nav-link" onClick="Method('/report/download_check_report.do')"><a href="javascript:;" class="left-link"> 
	<span class="am-icon-angle-right sidebar-nav-link-logo"></span>检查报告 </a></li>


