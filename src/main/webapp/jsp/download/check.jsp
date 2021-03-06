<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set value="${pageContext.request.contextPath }" scope="page"
	var="ctx"></c:set>
<script type="text/javascript">
	reloadjs('${ctx}/assets/js/jquery.min.js');
	reloadjs('${ctx}/assets/js/amazeui.min.js');
	(function($) {
		$("#select").on("click", function() {// 根据 查询按钮的id属性创建onclick事件
			var patientName = $("#patientName").val();
			var applyTime = $("#applyTime").val();
			$.ajax({
				type : 'post',
				url : '${ctx}/report/selectCheck.do',
				data : {
					"name" : patientName,
					"applyTime" : applyTime
				},
				success : function(html) {
					$("#main-content").html(html);
				}
			});
		});

		$("#edit").on("click", function() {// 根据 To编辑jsp
			var tableID = document.getElementById('tableID');
			$("table :radio").each(function(key, value) {
				if ($(value).prop('checked')) {
					checkID = tableID.rows[key + 1].cells[1].innerHTML;
					openFrom('/report/toeditCheck.do?checkID=' + checkID);
				}
			});
		});
	})(jQuery);
	function cancel() {
		var msg = "您真的确定要删除吗？\n\n请确认！";
		if (confirm(msg) == true) {
			var tableID = document.getElementById('tableID');
			$("table :radio").each(function(key, value) {
				if ($(value).prop('checked')) {
					checkID = tableID.rows[key + 1].cells[1].innerHTML;
					$.ajax({
						type : 'post',
						url : '${ctx}/report/cancleCheck.do',
						data : {
							"checkID" : checkID
						},
						success : function(html) {
							$("#main-content").html(html);
						}
					});
				}
			});
		} else {
		}
	}
</script>
<div style="padding-left: 10px;">
	<div class="widget am-cf">
		<div class="widget-head am-cf">
			<div class="widget-title am-fl">检查单：</div>
		</div>
		<form class="am-form am-form-horizontal">
			<fieldset>
				<div style="margin-bottom: 10px;">
					<label style="float: left;">病人姓名：</label> 
					<input type="text" id="patientName" name="patientName"  value="${patientName}"
						style="width:20%;float:left;margin-right:10px;"	class="tpl-form-no-bg tpl-form-input"> 
					<label style="float: left;">申请日期：</label> 
					<input type="text" id="applyTime" name="applyTime" class="tpl-form-no-bg tpl-form-input"						
						style="width:20%;float:left;margin-right:10px;" data-am-datepicker readonly>
					<button type="button" id="select" class="am-btn am-btn-primary am-radius">查询</button>
					<button type="button" class="am-btn am-btn-primary am-radius" id="edit"
						data-am-modal="{target: '#ffrom', closeViaDimmer: 0,dimmer:0, width: 960, height: 400}">编辑</button>
					<button type="button" class="am-btn am-btn-primary am-radius" onclick="cancel()">作废</button>
				</div>
				<div class="am-scrollable-horizontal">
					<table class="am-table am-table-bordered am-table-centered"
						id="tableID">
						<tr>
							<th>选择</th>
							<th>病人姓名</th>						
							<th>检查单</th>
							<th>检查室</th>
							<th>检查项目</th>
							<th>申请时间</th>
							<th>加急否</th>
						</tr>
						<tr>
							<td><input type="Checkbox" id="Choose_one" name="Choose-name"/></td>
							<td><input type='text' class="PatientName" name="PatientName"/></td>
							<td><input type='text' class="CheckList" name="CheckList"/></td>
							<td><input type='text' class="CheckRoom" name="CheckRoom"/></td>
							<td><input type='text' class="CheckProgram" name="CheckProgram"/></td>
							<td><input type="text" id="applyTime" name="applyTime" class="tpl-form-no-bg tpl-form-input" 						
						style="width:100%;float:left;margin-right:10px;" data-am-datepicker readonly></td>									
							<td><input type="radio" name="urgent" value="1"> <label class="am-form-label">加急</label>
			        <input type="radio" name="urgent" value="2"> <label class="am-form-label">明晨</label>  </td>
						</tr>
								
						<c:forEach items="${check}" var="item">
							<tr>
								<td><input type="radio" name="radio" /></td>
								<td style="display:none">${item.checkID}</td>
								<td>${item.patientName}</td>
								<td>${item.checkList}</td>
								<td>${item.checkDepartmentName}</td>
								<td>${item.checkItemName}</td>
								<td><fmt:formatDate value="${item.applyTime}" type="date" pattern="yyyy-MM-dd" /></td>
								<td>${"1" == item.urgent ? "加急":"明晨"}</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</fieldset>
		</form>
	</div>
</div>