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
		frm.action = "/front/lend/deviceselect";
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
					<td>대여장비:</td>
					<td><input type="text" name="device_name"
						value="${ device_name }" /></td>
					<td><input type="hidden" name="device_code"
						value="${ device_code }" /></td>
					<td><input type="button" name="select" value="선택"
						onclick="javascript:popup(this.form);"></td>
				</tr>
				<tr>
					<td>방문날짜:</td>
					<fmt:formatDate pattern="yyyy-MM-dd"
						value="${ device_lend.visit_date }" var="b" />
					<td><input type="date" name="visit_date" value="${ b }" /></td>
				</tr>

			</table>

			<button type="submit" class="btn">예약</button>
		</form>
	</div>
</body>
</html>

