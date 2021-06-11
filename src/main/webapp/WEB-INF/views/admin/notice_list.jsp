<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <title>성공회대학교 A/S 센터</title>
        <link rel="stylesheet" href="/css/notice_list.css">
        <link rel="stylesheet" href="/css/main.css">
        <script src="js/main.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    </head>
    <body style="margin-bottom: 5%;">
	<div id="navBar">
		<a href="/index" id="homeImg"><img src="/media/mark_SKHU.png" alt="MAIN" width="100%" height="100%"></a> 
		<a href="">공지사항</a>
		<a href="">장비 예약</a> <a href="">장비 목록</a> <a href="">문의하기</a>
		<sec:authorize access="authenticated">
			<a class="btn" style="float: right;" href="/logout_processing">로그아웃</a>
		</sec:authorize>
		<a href="/user/mypages" style="float: right;">마이페이지</a> 
		<a style="float: right; pointer-events: none;">${ student.name }님</a>
	</div>


	<div style="display: inline-block; width:100%; margin-top: 5%;">
    	<p style="font-size: 36px; margin-top: 10%; margin-left: 45%; display: inline; color:#585858;">공지사항</p>
    	<p style="font-size: 20px; color: #A0A0A0; margin-left: 44%; margin-top: 5px;">skhu/AS_Center</p>
    	<form method="post">
    	<div style="position: relative">
    	<input type="text" name="title" value="${title}" class="search" placeholder="제목으로 검색">
    	<button type="submit" class="search_button"><img src="/media/search_black_24dp.svg"></button>
    	</div>
    	</form>
    </div>

        <table class="notice">
            <tr><th>번호</th><th>제목</th><th>작성자</th><th>작성일</th><th>조회수</th><th>수정/삭제</th></tr>
            <c:forEach var="notice_list" items="${ notice_list }">
            <tr><td>${ notice_list.getNo() }</td><td>${ notice_list.getTitle() }</td><td>${ notice_list.getSnum() }</td><td>${ notice_list.getWrite_date() }</td><td>${ notice_list.getViews() }</td>
            <td><button class="edit" onclick="location.href='notice_edit?no=${notice_list.getNo()}'"><img src="/media/edit.svg"></button>
            <button class="delete" onclick="location.href='notice_delete?no=${notice_list.getNo()}'"><img src="/media/trash.svg"></button></td></tr>
            </c:forEach>
        </table>
		
		 <script>
        	function notice_delete() {
        		alert("삭제 기능 실행");
        	}
        </script>

        <button class="button write" style="background-color:#2E64FE;" onclick = "location.href='notice_write'">글쓰기</button>
		


    </body>
</html>