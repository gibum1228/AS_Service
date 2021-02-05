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
</head>
<body>
	<div>
		<form:form method="post" action="/login_processing">
			<div class="imgContainer">
				<img src="/media/마크_성공회대학교.png" alt="mark" width="50%" height="50%">
			</div>

			<div class="container">
				<label for="userId"><b>아이디</b></label> <input type="text"
					name="userId" placeholder="아이디" autocomplete="off" required>
			</div>

			<div class="container">
				<label for="password"><b>비밀번호</b></label> <input type="password"
					name="password" placeholder="비밀번호" required>
			</div>

			<div class="container">
				<button type="submit">로그인</button>
				<a class="signUp" href="/signup">회원가입</a>
			</div>
			<c:if test="${ param.error != null }">
				<div class="error">로그인 실패</div>
			</c:if>
		</form:form>
	</div>
</body>
</html>