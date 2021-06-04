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
<link rel="stylesheet" href="/css/main.css">
</head>
<body>
	<div class="navBar">
		<a href="/index" id="homeImg"><img src="/media/mark_SKHU.png" alt="MAIN" width="50px" height="50px"></a> 
		<a href="">공지사항</a>
		<a href="">장비 예약</a> <a href="">장비 목록</a> <a href="">문의하기</a>
		<sec:authorize access="authenticated">
			<a class="btn" style="float: right;" href="/logout_processing">로그아웃</a>
		</sec:authorize>
		<a href="/front/mypages" style="float: right;">마이페이지</a> 
		<a href="" style="float: right;">${ student.name }님</a>
	</div>
	<div class="container_center">
		<div style="margin: 0; padding: 0; background: blue; height: 250px;"></div>
		<div style="margin: 0; padding: 0; height: 200px;">
			<div style="height: 100px;">
				<div style="height: 100px; width: 120px; float: left; padding: 0 40px;">
					<img alt="1" src="/media/calculate.png" width="100%" height="100%">
				</div>
				<div style="height: 100px; width: 120px; float: left; padding: 0 40px;">
					<img alt="1" src="/media/past.png" width="100%" height="100%">
				</div>
				<div style="height: 100px; width: 120px; float: left; padding: 0 40px;">
					<img alt="1" src="/media/report_qna.png" width="100%" height="100%">
				</div>
				<div style="height: 100px; width: 120px; float: left; padding: 0 40px;">
					<img alt="1" src="/media/lend_device.png" width="100%" height="100%">
				</div>
			</div>
			<div style="height: 100px;">
				<div style="height: 100px; width: 120px; float: left; padding: 0 40px;">
					<img alt="1" src="/media/write_notice.png" width="100%" height="100%">
				</div>
				<div style="height: 100px; width: 120px; float: left; padding: 0 40px;">

				</div>
				<div style="height: 100px; width: 120px; float: left; padding: 0 40px;">

				</div>
				<div style="height: 100px; width: 120px; float: left; padding: 0 40px;">
					<img alt="1" src="/media/menu_plus.png" width="100%" height="100%">
				</div>
			</div>
		</div>
	</div>
</body>
</html>