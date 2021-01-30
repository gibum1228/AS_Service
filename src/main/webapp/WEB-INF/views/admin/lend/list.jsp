<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="/common.js"></script>
<link rel="stylesheet" type="text/css" href="/common.css" />
<style>
a.btn {
	float: center;
	margin: 5px 0 5px 0;
}

td:nth-child(1), td:nth-child(5) {
	text-align: center;
}
</style>
<script language="javascript">
	function popup(frm) {
		var url = "testpop.asp";
		var title = "testpop";
		var status = "toolbar=no,directories=no,scrollbars=no,resizable=no,status=no,menubar=no,width=700, height=800, top=0,left=20";
		window.open("", title, status);
		frm.target = title;
		frm.action = "/admin/lend/rent";
		frm.method = "post";
		frm.submit();
	}
</script>
</head>
<body>
	<div class="container">

		<h1>장비대여예약목록</h1>
		<form method="post">
			방문날짜:
			<fmt:formatDate pattern="yyyy-MM-dd" value="${ visit_date }" var="b" />
			<input type="date" name="visit_date" value="${ b }" />
			<button type="submit">확인</button>
		</form>
		<br>
		<table class="list">
			<thead>
				<tr>
					<th>학번</th>
					<th>예약장비코드</th>
					<th>예약장비이름</th>
					<th>예약장비디테일넘버</th>
					<!-- <th>예약신청날짜</th> -->
					<th>대여일</th>
					<th>반납예정일</th>
					<th>대여</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="lend" items="${ lends }">
					<tr align="center">
						<td>${ lend.snum }</td>
						<td>${ lend.device_code }</td>
						<td>${ lend.device_name }</td>
						<td>${ lend.detail_no}</td>
						<%-- <td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss"
								value="${ lend.wait_date }" /></td> --%>
						<td><fmt:formatDate pattern="yyyy-MM-dd"
								value="${ lend.start_date }" /></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd"
								value="${ lend.end_date }" /></td>
						<td><form method="post">
							  <input type="hidden" name=lend_no value="${lend.no}">   
								<input type="button" name="rent" value="대여"
									onclick="javascript:popup(this.form);">
							</form></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>

