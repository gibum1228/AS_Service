<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:url var="R" value="resources/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>성공회대학교 A/S실</title>
<link rel="stylesheet" type="text/css" href="/css/boxs.css">
<link rel="stylesheet" type="text/css" href="/css/login.css">
<link rel="stylesheet" type="text/css" href="/css/main.css">
<script src="https://kit.fontawesome.com/68abb170e0.js" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container_center">
		<form:form method="post" action="/login_processing">
			<div class="imgContainer">
				<img src="/media/mark_SKHU.png" alt="mark" width="300px" height="275px">
			</div>

			<div class="container">
				<span for="userId"><b><i class="fas fa-id-card"></i>  아이디</b></span>
				<input type="text" name="userId" placeholder="아이디" autocomplete="off" required>
			</div>

			<div class="container">
				<label for="password"><b><i class="fas fa-lock"></i> 비밀번호</b></label> 
				<input type="password" name="password" placeholder="비밀번호" required>
			</div>

			<div style="margin: 20px auto; width:300px; height: 50px;">
				<div style="float: left;">
					<button type="button" onclick="location.href='/signup'"><i class="fas fa-user-plus"></i>  회원가입</button>
				</div>
				<div style="float: right;">
					<button type="submit"><i class="fas fa-sign-in-alt"></i> 확인</button>
				</div>
			</div>
		</form:form>
	</div>
</body>
</html>