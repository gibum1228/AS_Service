<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/main.css">
<link rel="stylesheet" href="/css/notice.css">
<script src="/js/main.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

</head>
<body>
	<div class="navBar">
		<a href="">공지사항</a> <a href="">장비 예약</a> <a href="">장비 목록</a> <a
			href="">문의하기</a>
		<sec:authorize access="authenticated">
			<a class="btn" style="float: right;" href="/logout_processing">로그아웃</a>
		</sec:authorize>
		<a href="" style="float: right;">마이페이지</a>
	</div>
	<div class="container">
	
		<form method="post">
			<h1 class="notice_word">공지사항</h1>

			<div>
				<input type="text" class="title" name="title" value="" placeholder="제목" />
			</div>
			<hr>

			<div class="">
  				<textarea class="body" rows="3"></textarea>
			</div>

			<button type="submit" style="margin-left: 37%;">확인</button>
			<button type="reset">취소</button>
		</form>
	</div>
</body>
</html>
