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
<style type="text/css">
body {
	margin-top: 100px;	
}

.section {
	width: 100%;
	height: 800px;
}

.tabMenu {
	width: 20%;
	display: inline-block;
}

.tabSection {
	width: 70%;
	display: inline-block;
}

ul.tabs {
	vertical-align: top;
	list-style: none;
	margin-left: auto;
	margin-right: auto;
	border-right: 3px solid gray;
}

ul.tabs li {
	background: none;
	color: #222;
	padding: 10px 15px;
	cursor: pointer;
	text-align: right;
}

ul.tabs li.current {
	background-color: gray;
	border-left: 5px solid red;
	color: white;
}

.tab-content {
	display: none;
	background: #ededed;
	padding: 15px;
}

.tab-content.current {
	display: inherit;
	margin-left: 50px;
}
</style>
﻿
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
﻿
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
	
	function logout(){
		location.href = "/logout_processing"; // 페이지 이동
	}
</script>
</head>
<body>
	<div class="navBar">
		<a href="/index" id="homeImg"><img src="/media/마크_성공회대학교.png" alt="MAIN" width="50px" height="50px"></a>
		<a href="">공지사항</a>
		<a href="">장비 예약</a>
		<a href="">장비 목록</a>
		<a href="">문의하기</a>
		<sec:authorize access="authenticated">
			<a class="btn" style="float: right;" href="/logout_processing">로그아웃</a>
		</sec:authorize>
		<a href="/front/mypages" style="float: right;">마이페이지</a>
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
				<div>
					<label>이름</label>
					<input type="text" value="${ student.name }" readonly>
				</div>
				<div>
					<label>이메일</label>
					<input type="text" value="${ student.email }" readonly>				
				</div>
				<div>
					<label>제1전공</label>
					<input type="text" value="${ first_major }" readonly>
					<label>제2전공</label>
					<input type="text" value="${ sec_major }" readonly>
				</div>
				<div>
					<label>가입일</label>
					<input type="text" value="${ student.signup_date }" readonly>
				</div>
			</div>
			<div id="tab-2" class="tab-content">
				
			</div>
			<div id="tab-3" class="tab-content">
				<p>대여 기록 보기</p>
			</div>
			<div id="tab-4" class="tab-content">
				<p>이메일 인증</p>
			</div>
		</div>
	</div>
</body>
</html>