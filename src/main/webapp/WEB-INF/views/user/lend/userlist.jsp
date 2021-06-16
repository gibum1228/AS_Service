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
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js" integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT" crossorigin="anonymous"></script>
<title>성공회대학교 A/S실</title>
<link rel="icon" href="/media/mark_SKHU.png">
</head>
<div id="navBar">
		<a href="/index" id="homeImg"><img src="/media/mark_SKHU.png" alt="MAIN" width="100%" height="100%"></a> 
		<a href="">공지사항</a>
		<a href="">장비 예약</a> <a href="">장비 목록</a> <a href="">문의하기</a>
		<sec:authorize access="authenticated">
			<a class="btn" style="float: right;" href="/logout_processing">로그아웃</a>
		</sec:authorize>
		<a href="/user/mypages" style="float: right;">마이페이지</a> 
		<a style="float: right; pointer-events: none;">${ student.name }님</a>
	</div>
	<div style="width: 100%; height: 50vh;">
		<div class="header" style="overflow: inherit;">
			<div class="headerBtn" style="float: left; width: 350px;">
				<img src="/media/logo_mark_mr_sin.jpg" alt="logo_AS" width="100%" height="100%">
			</div>
			<a class="headerBtn" href="/logout_processing">로그아웃</a>
			<a class="headerBtn" href="/user/mypages">마이페이지</a>
			<a class="headerBtn" href="">문의하기</a>
			<a class="headerBtn" href="">예약하기</a>
			<a class="headerBtn" href="">공지사항</a>
		</div>
	</div>
<body>
	<div class="user_top">
		<h1>장비대여</h1>
	</div>
	<div class="user_middle">
		<table class="table list">
			<thead>
				<tr align="center">
					<th>장비학과</th>
					<th>장비명</th>
					<th>예약날짜</th>
					<th>방문날짜</th>
					<th>상태</th>
				<!-- 	<th>상태변경</th> -->
				</tr>
			</thead>
			<tbody>
				<c:forEach var="lend" items="${ lends }">
					  <tr>
						<td>${ lend.major_name }</td>
						<td>${ lend.device_name }</td>
						<td><fmt:formatDate pattern="yyyy-MM-dd"
								value="${ lend.wait_date }" /></td>
						<td><fmt:formatDate pattern="yyyy-MM-dd"
						value="${ lend.visit_date }" /></td>
						<c:if test="${ lend.state == 0 }">
						<td class="link-secondary">승인대기</td>
						</c:if>
						<c:if test="${ lend.state == 1 }">
						<td class="link-danger">승인거절</td>
						</c:if>
						<c:if test="${ lend.state == 2 }">
						<td  class="link-info">예약승인</td>
						</c:if>
						<c:if test="${ lend.state == 3 }">
						<td class="link-success">대여중</td>
						</c:if>
						<c:if test="${ lend.state == 4 }">
						<td  class="link-primary">반납완료</td>
						</c:if>
					<%-- 	<c:if test="${ lend.state == 5 }">
						<td>연체중</td>
						</c:if> --%>
						<%-- <td><form method="post">
						<input type="button" name="state" value="상태변경"
							onclick="javascript:popup1(this.form);">
						<input type="hidden" name=lend_no value="${lend.no}">
						</form></td>
						 --%>
						
					</tr>
					
				</c:forEach>
			</tbody>
		</table>
</div>
	<div class="user_bottom">
	
	</div>
</body>
</html>




