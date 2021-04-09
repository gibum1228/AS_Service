<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>성공회대학교 A/S 센터</title>
        <link rel="stylesheet" href="/css/notice_details.css">
        <link rel="stylesheet" href="/css/main.css">
        <script src="js/main.js"></script>
    </head>
    <body>
	<div class="navBar">
		<a href="/index" id="homeImg"><img src="/media/마크_성공회대학교.png"
			alt="MAIN" width="50px" height="50px"></a> <a href="">공지사항</a> <a
			href="">장비 예약</a> <a href="">장비 목록</a> <a href="">문의하기</a>
		<sec:authorize access="authenticated">
			<a class="btn" style="float: right;" href="/logout_processing">로그아웃</a>
		</sec:authorize>
		<a href="/front/mypages" style="float: right;">마이페이지</a>
	</div>


	<div>
    	<h1>공지사항</h1>
    
    <hr>
    <div>
    <div class="title">
    <p>노트북 대여 연장 신청기간 변경에 대해</p>
    </div>
    <div>
    <div class="writeing_day">작성일: 2021-04-08</div>
    <div class="name">작성자: 양재용</div>
    </div>
    <hr>




    </body>
</html>