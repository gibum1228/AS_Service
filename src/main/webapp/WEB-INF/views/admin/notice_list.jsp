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
    <body style="width:100%">
	<div class="navBar">
		<a href="/index" id="homeImg"><img src="/media/마크_성공회대학교.png"
			alt="MAIN" width="50px" height="50px"></a> <a href="">공지사항</a> <a
			href="">장비 예약</a> <a href="">장비 목록</a> <a href="">문의하기</a>
		<sec:authorize access="authenticated">
			<a class="btn" style="float: right;" href="/logout_processing">로그아웃</a>
		</sec:authorize>
		<a href="/front/mypages" style="float: right;">마이페이지</a>
	</div>


	<div style="display: inline-block; width:100%; margin-top: 5%;">
    	<p style="font-size: 50px; margin-top: 10%; margin-left: 5%; display: inline;">공지사항</p>
    	<form>
    	<button class="search_button">조회</button>
    	<input type="text" class="search">
    	</form>
    </div>
        <hr style="width: 90%;">

        <table class="notice">
            <tr><td>번호</td><td>제목</td><td>작성자</td><td>작성일</td><td>조회수</td><td>수정/고정</td></tr>
            <tr><td>1</td><td>옛날에 했던거 가져왔어</td><td>양재용</td><td>2021.04.06</td><td>10</td><td><button class="edit">수정</button><input type="checkbox" class="pixed" name="pixed"></td></tr>
            <tr><td>2</td><td>디자인 좀 어때??</td><td>양재용</td><td>2021.04.06</td><td>10</td><td><button class="edit">수정</button><input type="checkbox" class="pixed" name="pixed"></td></tr>
            <tr><td>번호</td><td>제목</td><td>작성자</td><td>작성일</td><td>10</td><td><button class="edit">수정</button><input type="checkbox" class="pixed" name="pixed"></td></tr>
            <tr><td>번호</td><td>제목</td><td>작성자</td><td>작성일</td><td>10</td><td><button class="edit">수정</button><input type="checkbox" class="pixed" name="pixed"></td></tr>
            <tr><td>번호</td><td>제목</td><td>작성자</td><td>작성일</td><td>10</td><td><button class="edit">수정</button><input type="checkbox" class="pixed" name="pixed"></td></tr>
            
        </table>

        <button onclick = "location.href='notice_write'">글쓰기</button>

    </body>
</html>