<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <title>성공회대학교 A/S 센터</title>
        <link rel="stylesheet" href="/css/inquiry_list.css">
        <link rel="stylesheet" href="/css/main.css">
        <script src="js/main.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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


	<div id="app">
            <h1 style="margin-top: 5%; margin-left: 5%;">문의사항</h1>
            <form method="post">
            <select class="select_sort" name="select_value">
                <option value="2" <c:if test="${select_value == 2}">selected</c:if>></option>
            	<option value="1" <c:if test="${select_value == 1}">selected</c:if>>답변 완료</option>
            	<option value="0" <c:if test="${select_value == 0}">selected</c:if>>답변 대기중</option>
            </select>
            <button class="sort_button" type="submit">정렬</button>
            </form>
    </div>
   
        <hr style="width: 90%;">

         <table class="inquiry">
            <tr><th>번호</th><th>제목</th><th>작성자</th><th>작성일</th><th>조회수</th><th>타입</th><th>상태</th></tr>
            <c:forEach var="inquiry_list" items="${ inquiry_list }">
            <tr data-url="inquiry_details_front?no=${ inquiry_list.getNo() }"><td>${ inquiry_list.getNo() }</td><td>${ inquiry_list.getTitle() }</td><td>${ inquiry_list.getSnum() }</td>
            <td>${ inquiry_list.getWrite_date() }</td><td>${ inquiry_list.getViews() }</td><td><c:if test = "${ inquiry_list.getType() ==1 }">장비 장애</c:if><c:if test = "${ inquiry_list.getType() == 2}">버그 신고</c:if><c:if test = "${ inquiry_list.getType() == 3}">기타</c:if></td><td><c:if test ="${ inquiry_list.getState() == 0}">답변 대기중</c:if><c:if test ="${ inquiry_list.getState() == 1}">답변 완료</c:if></td></tr>
            </c:forEach>
        </table>
        
        <script> 
        $("[data-url]").click(function() {
        	var url = $(this).attr("data-url");
        	location.href = url; 
        	}) 
        </script>
		
		 <button onclick = "location.href='inquiry'">글쓰기</button>


    </body>
</html>