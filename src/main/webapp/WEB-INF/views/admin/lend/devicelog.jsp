<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<link rel="stylesheet" href="/css/lend.css">
<link rel="stylesheet" href="/css/main.css">
<script src="/js/main.js"></script>
<script src="/js/lend.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js"
	integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT"
	crossorigin="anonymous"></script>
	<title>성공회대학교 A/S실</title>
<link rel="icon" href="/media/mark_SKHU.png">
</head>
<body>
<div id="header">
	</div>
		<div>
		<table class="log">
			<thead>
				<tr align="center">
					<th>장비명</th>
					<th>장비번호</th>
					<th>학번</th>
					<th>상태</th>
					<th>날짜</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="device_log" items="${ device_logs }">
				<tr align="center">
						<td>${ device_log.device_name }</td>
							<td>${ device_log.detail_no }</td>
								<td>${ device_log.snum }</td>
								<c:if test="${ device_log.state == 0 }">
						<td class="link-secondary">승인대기</td>
						</c:if>
						<c:if test="${  device_log.state == 1 }">
						<td class="link-danger">승인거절</td>
						</c:if>
						<c:if test="${  device_log.state == 2 }">
						<td class="link-info">예약승인</td>
						</c:if>
						<c:if test="${  device_log.state == 3 }">
						<td  class="link-success">대여중</td>
						</c:if>
						<c:if test="${  device_log.state == 4 }">
						<td class="link-primary">반납완료</td>
						</c:if>
						<%-- <c:if test="${  device_log.state == 5 }">
						<td>연체중</td>
						</c:if> --%>
						
			<td><fmt:formatDate pattern="yyyy-MM-dd"
								value="${ device_log.date }" /></td>
						</tr>	</c:forEach>
					<tr><td class="lineless" colspan="5" ><input style="margin-left:45%;"type="button"  class="btn btn-secondary" value="확인"
		onclick="window.close()"></input></td></tr>
			
			</tbody>
		</table>
</div>


</div>
</body>
</html>

