<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    	<form method="post">
    	<input type="text" name="title" value="${title}" class="search" placeholder="제목으로 검색">
    	<button type="submit">조회</button>
    	</form>
    </div>
        <hr style="width: 90%;">

        <table class="notice">
            <tr><th>번호</th><th>제목</th><th>작성자</th><th>작성일</th><th>조회수</th><th>수정/삭제</th></tr>
            <c:forEach var="notice_list" items="${ notice_list }">
            <tr><td>${ notice_list.getNo() }</td><td>${ notice_list.getTitle() }</td><td>${ notice_list.getSnum() }</td><td>${ notice_list.getWrite_date() }</td><td>${ notice_list.getViews() }</td>
            <td><button class="edit" onclick="location.href='notice_edit?no=${notice_list.getNo()}'">수정</button>
            <button class="delete" onclick="location.href='notice_delete?no=${notice_list.getNo()}'">삭제</button></td></tr>
            </c:forEach>
        </table>
        <script>
        	function notice_delete() {
        		alert("삭제 기능 실행");
        	}
        </script>

        <button style="background-color:#2E64FE;" onclick = "location.href='notice_write'">글쓰기</button>

    </body>
</html>