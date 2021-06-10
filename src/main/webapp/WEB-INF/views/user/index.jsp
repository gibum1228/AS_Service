<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>성공회대학교 A/S실</title>
<link rel="stylesheet" href="/css/main.css">
<script src="/js/main.js"></script>
</head>
<body onload="showBanner()">
	<div id="navBar">
		<a href="/index" id="homeImg"><img src="/media/mark_SKHU.png" alt="MAIN" width="100%" height="100%"></a> 
		<a href="">공지사항</a>
		<a href="">장비 예약</a> <a href="">장비 목록</a> <a href="">문의하기</a>
		<sec:authorize access="authenticated">
			<a class="btn" style="float: right;" href="/logout_processing">로그아웃</a>
		</sec:authorize>
		<a href="/user/mypages" style="float: right;">마이페이지</a> 
		<a style="float: right;">${ student.name }님</a>
	</div>
	<div style="width: 100%; height: 100vh; margin: 0 0; padding: 0 0;">
		<div class="header">
			<div class="headerBtn" style="float: left; width: 350px;">
				<img src="/media/logo_mark_mr_sin.jpg" alt="logo_AS" width="100%" height="200px">
			</div>
			<div class="headerBtn">
				<a href="/logout_processing">로그아웃</a>
			</div>
			<div class="headerBtn">
				<a href="/user/mypages">마이페이지</a>
			</div>
			<div class="headerBtn">
				<a href="">문의하기</a>
			</div>
			<div class="headerBtn">
				<a href="">예약하기</a>
			</div>
			<div class="headerBtn">
				<a href="">공지사항</a>
			</div>
		</div>
		<img id='banner' src="/media/background_img/10.jpg" alt="background" width="100%" height="800px">
	</div>
	<div style="width: 100%; height: 100vh;">
		
	</div>
	<div class="footer">
		<p>
			<br>전화번호: 02-2610-4201
			<br>주소: 서울특별시 구로구 오류2동 연동로 320 (성공회대학교), 월당관 1층
			<br>근무시간: 9:00 AM ~ 5:00 PM
			<br>점심시간: 12:00 PM ~ 1:00 PM<br>
			<br>&copy; 2021 skhu4201.com
		</p>
	</div>
</body>
</html>