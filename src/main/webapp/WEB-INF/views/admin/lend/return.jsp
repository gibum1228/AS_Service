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
	text-align: left;
}

input {
	padding: 4px;
}

button {
	padding: 0.5em 2em;
	margin: 0px 0 0px 0px;
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
		<form method="post" action="returnsave">
			<div class="title">장비반납하기</div>
			<table>
					<tr>
					<td>반납일: <fmt:formatDate pattern="yyyy-MM-dd"
							value="${ return_date }" var="b" /> 
							<input type="date" name="return_date" value="${ b }" /></td>
				<td><input type="hidden" name=lend_no value="${lend_no}"/></td>
					<td>
						<button type="submit" class="button">저장</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>

