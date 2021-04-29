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
<body>
	<div class="navBar">
		<a href="/index" id="homeImg"><img src="/media/마크_성공회대학교.png" alt="MAIN" width="50px" height="50px"></a> 
		<a href="">공지사항</a>
		<a href="">장비 예약</a> <a href="">장비 목록</a> <a href="">문의하기</a>
		<sec:authorize access="authenticated">
			<a class="btn" style="float: right;" href="/logout_processing">로그아웃</a>
		</sec:authorize>
		<a href="/front/mypages" style="float: right;">마이페이지</a> 
		<a href="" style="float: right;">${ student.name }님</a>
	</div>
	<!-- <div class="countDday">
		<p id="countDown"></p>
	</div> -->
	<!-- <div class="quickBox">
		<div class="quickBtn">
			<span>대여 기록보기</span><br> 
			<a href=""><img src="/media/past.png" alt="장비 대여 기록"></a>
		</div>
		<div class="quickBtn">
			<span>문의하기</span><br>
			<a href=""><img src="/media/reported.png" alt="장애 신고"></a>
		</div>
	</div>
	<div class="quickBox">
		<div class="quickBtn">
			<span>장비 예약하기</span><br>
			<a href=""><img src="/media/cat.jpg" alt="고양이"></a>
		</div>
		<div class="quickBtn">
			<span>연체료 계산기</span><br>
			<a href=""><img src="/media/calcul.png" alt="계산기"></a>
		</div>
	</div> -->
	
	<div class="center_container">
		<div style="margin: 0; padding: 0; background: blue; height: 250px;">
			
		</div>
		<div style="margin: 0; padding: 0; background: black; height: 200px;">
			<div style="height: 100px; background: red;">
				<div style="height: 100px; background: white; width: 120px; float: left; padding: 0 40px;">
					<img alt="1" src="/media/calcul.png" width="100%" height="100%">
				</div>
				<div style="height: 100px; background: red; width: 120px; float: left; padding: 0 40px;">
					<img alt="1" src="/media/calcul.png" width="100%" height="100%">
				</div>
				<div style="height: 100px; background: skyblue; width: 120px; float: left; padding: 0 40px;">
					<img alt="1" src="/media/calcul.png" width="100%" height="100%">
				</div>
				<div style="height: 100px; background: green; width: 120px; float: left; padding: 0 40px;">
					<img alt="1" src="/media/calcul.png" width="100%" height="100%">
				</div>
			</div>
			<div style="height: 100px;">
				<div style="height: 100px; background: green; width: 120px; float: left; padding: 0 40px;">
					<img alt="1" src="/media/calcul.png" width="100%" height="100%">
				</div>
				<div style="height: 100px; background: skyblue; width: 120px; float: left; padding: 0 40px;">
					<img alt="1" src="/media/calcul.png" width="100%" height="100%">
				</div>
				<div style="height: 100px; background: red; width: 120px; float: left; padding: 0 40px;">
					<img alt="1" src="/media/calcul.png" width="100%" height="100%">
				</div>
				<div style="height: 100px; background: white; width: 120px; float: left; padding: 0 40px;">
					<img alt="1" src="/media/calcul.png" width="100%" height="100%">
				</div>
			</div>
		</div>
	</div>
	
	<!-- <div class="footer">
		<p>
			<br>전화번호: 02-2610-4201
			<br>주소: 서울특별시 구로구 오류2동 연동로 320 (성공회대학교), 월당관 1층
			<br>근무시간: 9:00 AM ~ 5:00 PM
			<br>점심시간: 12:00 PM ~ 1:00 PM
		</p>
	</div> -->
</body>
</html>