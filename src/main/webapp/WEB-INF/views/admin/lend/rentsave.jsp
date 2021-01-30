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
	padding: 0.5em 2em;
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
	function closewin() {
		window.opener.name = "rent"; // 부모창의 이름 설정
		document.myForm.target = "rent"; // 타켓을 부모창으로 설정
		document.myForm.action = "/admin/lend/list";
		document.myForm.submit();
		self.close();
	}
</script>
</head>
<body>
	<div class="container">
		<form name="myForm" method="post">
			<div class="title">예약완료</div>
			<table>
			<tr>
				<td>예약장비코드: </td>
				<td>${selectedLend.device_code} </td></tr>
				<td>예약장비이름: </td>
				<td>${selectedLend.device_name} </td></tr>
				<tr><td>예약장비디테일넘버: </td>
				<td>${selectedLend.detail_no} </td>	</tr>
			<tr>	<td>대여일: </td>
				<td><fmt:formatDate pattern="yyyy-MM-dd"
								value="${ selectedLend.start_date }" /></td>
				</tr>
				<tr>
				<td>반납예정일: </td>
				<td><fmt:formatDate pattern="yyyy-MM-dd"
								value="${ selectedLend.end_date }" /></td>		
							
					</tr>		
				<tr>			
				<td><fmt:formatDate pattern="yyyy-MM-dd" value="${ visit_date }" var="b" />
				<input type="hidden" type="date" name="visit_date" value="${ b }" /></td> 
				
				<td><input type="button" value="확인"
					onclick="javascript:closewin()"></td>
			</tr>
			</table>
		</form>
	</div>
</body>
</html>

