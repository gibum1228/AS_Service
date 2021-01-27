<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:url var="R" value="/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>성공회대학교 A/S실</title>
</head>
<body>
	<div>
		<form:form method="post" action="${R}login_processing">
			<table>
				<tr>
					<td>아이디:</td>
					<td><input type="text" name="userId" placeholder="아이디"/></td>
				</tr>
				<tr>
					<td>비밀번호:</td>
					<td><input type="password" name="password" placeholder="비밀번호"/></td>
				</tr>
			</table>
			<button type="submit">로그인</button>
			<button><a href="${R}signup">회원가입</a></button>
			<c:if test="${ param.error != null }">
				<div class="error">로그인 실패</div>
			</c:if>
		</form:form>
	</div>
</body>
</html>