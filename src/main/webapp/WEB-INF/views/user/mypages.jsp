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
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="/js/main.js"></script>
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
</script>
</head>
<body>
	<div id="navBar">
		<a href="/index" id="homeImg"><img src="/media/mark_SKHU.png" alt="MAIN" width="100%" height="100%"></a>
		<a href="">공지사항</a> 
		<a href="">장비 예약</a> <a href="">장비 목록</a> 
		<a href="">문의하기</a>
		<sec:authorize access="authenticated">
			<a class="btn" style="float: right;" href="/logout_processing">로그아웃</a>
		</sec:authorize>
		<a href="/user/mypages" style="float: right;">마이페이지</a>
		<a style="float: right; pointer-events: none;">${ student.name }님</a>
	</div>
	<div class="header" style="box-shadow: 0px 1px 20px gray;">
		<div class="headerBtn" style="float: left; width: 350px;" onclick="location.href='/index'">
			<img src="/media/logo_mark_mr_sin.jpg" alt="logo_AS" width="100%" height="100%">
		</div>
		<a class="headerBtn" href="/logout_processing">로그아웃</a>
		<a class="headerBtn" href="/user/mypages">마이페이지</a>
		<a class="headerBtn" href="">문의하기</a>
		<a class="headerBtn" href="">예약하기</a>
		<a class="headerBtn" href="">공지사항</a>
	</div>
	<div class="section">
		<div class="tabMenu">
			<ul class="tabs">
				<li class="current" data-tab="tab-1">프로필</li>
				<li data-tab="tab-2">이메일 변경</li>
				<li data-tab="tab-3">대여 기록 보기</li>
				<li data-tab="tab-4">이메일 인증</li>
				<li onClick="location.href='/logout_processing'">로그아웃</li>
				<sec:authorize access="hasAnyRole('ROLE_ADMIN, ROLE_SUPERADMIN, ROLE_SERVER')">
					<hr>
					<h1>ADMIN</h1>
					<li data-tab="tab-5">장비 처리하기</li>
					<li data-tab="tab-6">장비 처리 기록보기</li>
					<li data-tab="tab-7">문의 처리하기</li>
				</sec:authorize>
				<sec:authorize access="hasAnyRole('ROLE_SUPERADMIN, ROLE_SERVER')">
					<hr>
					<h1>SUPERADMIN</h1>
				</sec:authorize>
				<sec:authorize access="hasRole('ROLE_SERVER')">
					<hr>
					<h1>SERVER</h1>
					<li></a></li>
				</sec:authorize>
			</ul>
		</div>
		<div class="tabSection">
			<div id="tab-1" class="tab-content current">
				<h1>프로필</h1>
				<hr>
				<div style="width: 500px;">
					<p><b>학번</p>
					<input type="text" value="${ student.snum }" readonly>
					<p><b>이름</p>
					<input type="text" value="${ student.name }" readonly>
					<p><b>학교 이메일</p>
					<input type="text" value="${ student.email }" readonly>
					<p><b>제1전공</b></p>
					<input type="text" value="${ first }" readonly>
					<p><b>제2전공</b></p>
					<input type="text" value="${ sec }" readonly>
					<p><b>가입 날짜</p>
					<input type="text" value="${ student.signup_date }" readonly>
				</div>
			</div>
			<div id="tab-2" class="tab-content">
				<h1>이메일 변경</h1>
				<hr>
				<div style="margin: 300px auto; width: 500px;">
					<button type="button">이메일 변경하기</button>
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
					<input type="button" value="이메일 인증하기" onClick="location.href='/user/mail/send'">
				</div>
			</div>
		</div>
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