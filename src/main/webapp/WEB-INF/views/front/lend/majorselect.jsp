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
</head>
<body>

	<div class="container">

		<div class="title">장비선택하기</div>
		<table>

			<tr>
				<td><a
					href="deviceselect?major_id=${firstmajor.id}&&visit_date=${visit_date}"
					class="btn">${firstmajor.name} </a></td>
				<c:if test="${ secondmajor.id > 0 }">
					<td><a
						href="deviceselect?major_id=${secondmajor.id}&&visit_date=${visit_date}"
						class="btn">${secondmajor.name} </a></td>
				</c:if>
		</table>
	</div>

</body>
</html>

