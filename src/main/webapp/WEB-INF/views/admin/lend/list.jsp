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
	<div class="list_top">
		<h1>대여관리</h1>
	</div>
	<div class="list_middle">
	<table class="middle">
	<tr>
		<ul class="nav nav-pills nav-tabs nav-fill">
  <li class="nav-item">
    <a class="nav-link" href="booklist">예약</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="rentlist" >대여</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="returnlist">반납</a>
  </li>
   <li class="nav-item">
    <a class="nav-link active " aria-current="page" href="list">목록</a>
  </li>
</ul>
</tr>
		<tr>
		<form name="inquiry" >
		<td>
		<%-- <select  class="dropdown-menu" name="order">
		<option value="0" ${ order == 0 ? "selected" : "" }>학번</option>
     	<option value="1" ${ order == 1 ? "selected" : "" }>장비명</option>
		</select> --%>
		</td>
		<%-- <td>
    	<input type="text" name="srchText" value="${ srchText }" placeholder="검색명" />
    	<button type="submit">조회</button>
    	</td> --%>
		 
		</tr>
		<tr>
		<td>
	<div class="input-group mb-3">
  <button class="btn btn-outline-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">${ order }</button>
  <ul class="dropdown-menu">
    <li><a class="dropdown-item" href="list?order=학번&srchText=${srchText }">학번</a></li>
    <li><a class="dropdown-item" href="list?order=장비명&srchText=${srchText }">장비명</a></li>
  </ul>
  <input type="hidden" name=order value="${ order }">
  <input type="text" name="srchText" value="${ srchText }" placeholder="검색어를 입력해주세요" class="form-control" placeholder="Recipient's username" aria-label="Recipient's username" aria-describedby="button-addon2">
  <button class="btn btn-outline-secondary" type="submit" id="button-addon2">조회</button>
</div> </form>
		</td>
		</tr>
		</table>
		</div>
	<div class="list_bottom">
		<table class="table list">
			<thead>
				<tr align="center">
					<th>학번</th>
					<th>이름</th>
					<th>장비학과</th>
					<th>장비명</th>
					<th>장비관리번호</th>
					<th>대여시작일</th>
					<th>반납일</th>
					<th>연체료</th>
					<th>상태</th>
					<!-- <th>장비상태변경</th> -->
				<!-- 	<th>상태변경</th> -->
				</tr>
			</thead>
			<tbody>
				<c:forEach var="lend" items="${ lends }">
					   <tr data-url onclick="window.open('devicelog?detail_no=${lend.detail_no}&device_code=${lend.device_code}','window_name',
					      'toolbar=no,directories=no,scrollbars=no,resizable=no,status=no,menubar=no,width=700, height=800, top=0,left=20');">  
					      </form>
						<td>${ lend.snum }</td>
						<td>${ lend.snum_name }</td>
						<td>${ lend.major_name }</td>
						<td>${ lend.device_name }</td>
						<td>No: ${ lend.detail_no }</td>
						<td><fmt:formatDate pattern="yyyy-MM-dd"
								value="${ lend.start_date }" /></td>
						<td><fmt:formatDate pattern="yyyy-MM-dd"
								value="${ lend.return_date }" /></td>
						<td >${ lend.arrears }</td>
						<c:if test="${ lend.state == 0 }">
						<td class="link-secondary">승인대기</td>
						</c:if>
						<c:if test="${ lend.state == 1 }">
						<td class="link-danger">승인거절</td>
						</c:if>
						<c:if test="${ lend.state == 2 }">
						<td class="link-info">예약승인</td>
						</c:if>
						<c:if test="${ lend.state == 3 }">
						<td class="link-success">대여중</td>
						</c:if>
						<c:if test="${ lend.state == 4 }">
						<td class="link-primary">반납완료</td>
						</c:if>
					</tr>
					
				</c:forEach>
			</tbody>
		</table>
</div>
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
</body>
</html>


