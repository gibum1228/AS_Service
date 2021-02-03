<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
div.container {
	width: 600px;
	margin: auto;
}

form {
	box-shadow: 0 0 4px lightgray, 2px 2px 4px gray;
	overflow: auto;
	font-size: 10pt;
}

div.title {
	font-size: 20pt;
	padding: 10px;
	background-color: #eee;
}

table {
	margin: 20px;
}

td {
	min-width: 100;
	padding: 5px;
}

td:nth-child(1) {
	text-align: right;
}

input {
	padding: 4px;
}

button {
	padding: 0.4em 2em;
	margin: 5px 0 20px 20px;
}

div.message {
	border-radius: 10px;
	padding: 12px;
	margin: 10px;
	background-color: #ffa;
	border: 1px solid #cc0;
}
</style>
<script language="javascript">
	function popup(frm) {
		var url = "testpop.asp";
		var title = "testpop";
		var status = "toolbar=no,directories=no,scrollbars=no,resizable=no,status=no,menubar=no,width=700, height=800, top=0,left=20";
		window.open("", title, status);
		frm.target = title;
		frm.action = "/front/lend/majorselect";
		frm.method = "post";
		frm.submit();
	}
</script>


</head>
<body>

	<div class="container">
		<form name="form" method="post" action="save">
			<div class="title">장비대여하기</div>
			<table>
				<tr>
					<td>방문날짜:</td>
					<td><select name="visit_date">
							<option value=${calendar[0] }
								${ visit_date == calendar[0] ? "selected" : "" }>${selectDate[0]}</option>
							<option value=${calendar[1] }
								${ visit_date == calendar[1] ? "selected" : "" }>${selectDate[1]}</option>
							<option value=${calendar[2] }
								${ visit_date == calendar[2] ? "selected" : "" }>${selectDate[2]}</option>
							<option value=${calendar[3] }
								${ visit_date == calendar[3] ? "selected" : "" }>${selectDate[3]}</option>
							<option value=${calendar[4] }
								${ visit_date == calendar[4] ? "selected" : "" }>${selectDate[4]}</option>
					</select></td>
				</tr>
				<tr>
					<td><c:if test="${ visit_date == calendar[0] }">
							<input type="hidden" name="korDayOfWeek"
								value="${korDayOfWeeks[0]}" />
						</c:if></td>
					<td><c:if test="${ visit_date == calendar[1] }">
							<input type="hidden" name="korDayOfWeek"
								value="${korDayOfWeeks[1]}" />
						</c:if></td>
					<td><c:if test="${ visit_date == calendar[2] }">
							<input type="hidden" name="korDayOfWeek"
								value="${korDayOfWeeks[2]}" />
						</c:if></td>
					<td><c:if test="${ visit_date == calendar[3] }">
							<input type="hidden" name="korDayOfWeek"
								value="${korDayOfWeeks[3]}" />
						</c:if></td>
					<td><c:if test="${ visit_date == calendar[4] }">
							<input type="hidden" name="korDayOfWeek"
								value="${korDayOfWeeks[4]}" />
						</c:if></td>
				</tr>
				<tr>
					<td>대여장비:</td>
					<td><input type="text" name="device_name"
						value="${ device_name }" /></td>
					<td><input type="hidden" name="device_code"
						value="${ device_code }" /></td>
					<td><input type="button" name="select" value="선택"
						onclick="javascript:popup(this.form);"></td>

				</tr>



			</table>

			<button type="submit" class="btn">예약</button>
		</form>
	</div>
</body>
</html>

