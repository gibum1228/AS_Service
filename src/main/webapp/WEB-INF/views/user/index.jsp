<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>성공회대학교 A/S실</title>
	<link rel="icon" href="/media/mark_SKHU.png">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js" ></script>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<link rel="stylesheet" href="/css/main.css">
	<script src="/js/main.js"></script>
</head>

<body onload="showBanner()">
	<div id="navBar">
		<a href="/index" id="homeImg"><img src="/media/mark_SKHU.png" alt="MAIN" width="100%" height="100%"></a>
		<c:if test="${ student.getRole_id() == 1  }" > <a href="" >공지사항</a></c:if>
		<c:if test="${ student.getRole_id() == 2  }" > <a href="http://localhost:8088/user/notice/notice_list_front" >공지사항</a></c:if>
		<c:if test="${ student.getRole_id() == 99 || student.getRole_id() == 98 || student.getRole_id() == 97 }" > <a href="http://localhost:8088/admin/notice/notice_list" >공지사항</a></c:if>
		<c:if test="${ student.getRole_id() == 2  }" > <a href="http://localhost:8088/user/lend/select_com_laptop" >장비 예약</a></c:if>
		<c:if test="${ student.getRole_id() == 99 || student.getRole_id() == 98 || student.getRole_id() == 97 }" > <a href="http://localhost:8088/admin/lend/booklist" >장비 관리</a></c:if>
		<c:if test="${ student.getRole_id() == 2  }" > <a href="http://localhost:8088/user/lend/userpage" >예약 목록</a></c:if>
		<c:if test="${ student.getRole_id() == 99 || student.getRole_id() == 98 || student.getRole_id() == 97 }" > <a href="http://localhost:8088/admin/lend/list" >장비 목록</a></c:if>
		<c:if test="${ student.getRole_id() == 1  }" > <a href="" >문의하기</a></c:if>
		<c:if test="${ student.getRole_id() == 2  }" > <a href="http://localhost:8088/user/inquiry/inquiry_list_front" >문의하기</a></c:if>
		<c:if test="${ student.getRole_id() == 99 || student.getRole_id() == 98 || student.getRole_id() == 97 }" > <a href="http://localhost:8088/admin/inquiry/inquiry_list" >문의하기</a></c:if>
		<sec:authorize access="authenticated">
			<a class="btn" style="float: right;" href="/logout_processing">로그아웃</a>
		</sec:authorize>
		<a href="/user/mypages" style="float: right;">마이페이지</a>
		<a style="float: right; pointer-events: none;">${ student.name }님</a>
	</div>
	<div style="width: 100%; height: 100vh;">
		<div class="header" style="overflow: inherit;">
			<div class="headerBtn" style="float: left; width: 350px;">
				<img src="/media/logo_mark_mr_sin.jpg" alt="logo_AS" width="100%" height="100%">
			</div>
			<a class="headerBtn" href="/logout_processing">로그아웃</a>
			<a class="headerBtn" href="/user/mypages">마이페이지</a>
			<c:if test="${ student.getRole_id() == 1  }" ><a class="headerBtn" href="">문의하기</a></c:if>
			<c:if test="${ student.getRole_id() == 2  }" ><a href="http://localhost:8088/user/inquiry/inquiry_list_front" class="headerBtn">문의하기</a></c:if>
			<c:if test="${ student.getRole_id() == 99 || student.getRole_id() == 98 || student.getRole_id() == 97 }" ><a href="http://localhost:8088/admin/inquiry/inquiry_list" class="headerBtn">문의하기</a></c:if>
			<c:if test="${  student.getRole_id() == 2  || student.getRole_id() == 99 || student.getRole_id() == 98 || student.getRole_id() == 97 }" ><a href="http://localhost:8088/user/lend/select_com_laptop" class="headerBtn">예약하기</a></c:if>
			<c:if test="${ student.getRole_id() == 1  }" ><a class="headerBtn" href="">공지사항</a></c:if>
			<c:if test="${ student.getRole_id() == 2  }" ><a href="http://localhost:8088/user/notice/notice_list_front" class="headerBtn">공지사항</a></c:if>
			<c:if test="${ student.getRole_id() == 99 || student.getRole_id() == 98 || student.getRole_id() == 97 }" ><a href="http://localhost:8088/admin/notice/notice_list" class="headerBtn">공지사항</a></c:if>
			
		</div>
		<img id='banner' src="/media/background_img/0.jpg" alt="background" width="100%" height="777px">
	</div>
	<div style="width: 100%; height: 100vh;" id="app">
		<div style="position: absolute; top: 150%; left: 50%; transform: translate(-50%, -50%);">
			<img id='banner' src="/media/logo_ascenter_1_lower.png" alt="logo" width="700px" height="250px">
			<div style="width: 700px; height: 50px; text-align: center; margin-top: 50px; font-size: 50px; line-height: 50px;">
				<p>
					반납일까지 {{ dday }}일 남았습니다.
				</p>
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
	<script>
		var app = new Vue({
			el: "#app",
			data: {
				return_date: moment("2021-08-31"),
				dday: null
			},
			mounted() {
				this.dday = Math.ceil(moment.duration(this.return_date.diff(moment())).asDays()) + 1 // 오늘(+1)부터 반납일까지 남은 일 수
			}
		})
	</script>
</body>

</html>