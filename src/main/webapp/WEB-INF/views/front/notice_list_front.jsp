<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>성공회대학교 A/S 센터</title>
        <link rel="stylesheet" href="/css/notice_list.css">
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
            <h1 style="margin-top: 5%; margin-left: 5%;">공지사항</h1>
        </div>
        <hr style="width: 90%;">

        <table class="notice" border= "1px solid black" style="margin:auto; width:90%; text-align: center; margin-top">
            <tr><td>번호</td><td>제목</td><td>작성자</td><td>작성일</td></tr>
            <tr><td>1</td><td>옛날에 했던거 가져왔어</td><td>양재용</td><td>2021.04.06</td></tr>
            <tr><td>2</td><td>디자인 좀 어때??</td><td>양재용</td><td>2021.04.06</td></tr>
            <tr><td>번호</td><td>제목</td><td>작성자</td><td>작성일</td></tr>
            <tr><td>번호</td><td>제목</td><td>작성자</td><td>작성일</td></tr>
            <tr><td>번호</td><td>제목</td><td>작성자</td><td>작성일</td></tr>
            
        </table>



    </body>
</html>