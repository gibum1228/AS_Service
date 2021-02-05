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
<title>테스트</title>
</head>
<body>
	테스트 전용
	<sec:authorize access="authenticated">
		<a class="btn" href="/logout_processing">로그아웃</a>
	</sec:authorize>
</body>
</html>