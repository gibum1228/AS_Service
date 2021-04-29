<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>성공회대학교 A/S실</title>
<link rel="stylesheet" href="/css/main.css">
<link rel="stylesheet" href="/css/mypages.css">
<link rel="stylesheet" href="/css/boxs.css">
﻿
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() { // 화면 보여주기, 가리기

		$('ul.tabs li').click(function() {
			var tab_id = $(this).attr('data-tab');

			$('ul.tabs li').removeClass('current');
			$('.tab-content').removeClass('current');

			$(this).addClass('current');
			$("#" + tab_id).addClass('current');
		})
	})

	function logout() {
		location.href = "/logout_processing"; // 페이지 이동
	}
</script>
</head>
<body>
	<div class="navBar">
		<a href="/index" id="homeImg"><img src="/media/마크_성공회대학교.png" alt="MAIN" width="50px" height="50px"></a>
		<a href="">공지사항</a> 
		<a href="">장비 예약</a> <a href="">장비 목록</a> 
		<a href="">문의하기</a>
		<sec:authorize access="authenticated"><a class="btn" style="float: right;" href="/logout_processing">로그아웃</a>
		</sec:authorize><a href="/front/mypages" style="float: right;">마이페이지</a>
	</div>
	<div class="section">
		<div class="tabMenu">
			<ul class="tabs">
				<li class="tab-link current" data-tab="tab-1">프로필</li>
				<li class="tab-link" data-tab="tab-2">비밀번호 변경</li>
				<li class="tab-link" data-tab="tab-3">대여 기록 보기</li>
				<li class="tab-link" data-tab="tab-4">이메일 인증</li>
				<li class="tab-link" onClick="logout()">로그아웃</li>
			</ul>
		</div>
		<div class="tabSection">
			<div id="tab-1" class="tab-content current">
				<h1>프로필</h1>
				<hr>
				<div style="width: 500px">
					<p><b>학번</p>
					<input type="text" value="${ student.snum }" readonly>
					<p><b>이름</p>
					<input type="text" value="${ student.name }" readonly>
					<p><b>학교 이메일</p>
					<input type="text" value="${ student.email }" readonly>
					<p><b>제1전공</p>
					<input type="text" value="${ first }" readonly>
					<p><b>제2전공</p>
					<input type="text" value="${ sec }" readonly>
					<p><b>가입 날짜</p>
					<input type="text" value="${ student.signup_date }" readonly>
				</div>
			</div>
			<div id="tab-2" class="tab-content">
				<h1>비밀번호 변경</h1>
				<hr>
				<div style="margin: 300px auto; width: 500px;">
					<button type="button">비밀번호 변경하기</button>
				</div>
			</div>
			<div id="tab-3" class="tab-content">
				<h1>대여 기록 보기</h1>
				<hr>
				<div style="margin: 300px auto; width: 500px;">
					<button type="button">대여 기록 보러가기</button>
				</div>
			</div>
			<div id="tab-4" class="tab-content">
				<h1>이메일 인증</h1>
				<hr>
				<div style="margin: 300px auto; width: 500px; text-align: center">
					<p><b>이메일 주소 확인</b></p>
					<input type="text" value="${ student.email }" readonly>
					<button type="button">이메일 인증하기</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>