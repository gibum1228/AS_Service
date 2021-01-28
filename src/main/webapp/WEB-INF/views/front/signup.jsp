<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>성공회대학교 A/S실</title>
</head>
<body>
	<form:form method="POST" modelAttribute="member">
		<table>
			<tr>
				<td>아아디: </td>
				<td><form:input type="text" path="snum" value="${ member.snum }" placeholder="아이디"/></td>
			</tr>
			<tr>
				<td>비밀번호: </td>
				<td><form:input type="password" path="password" value="${ member.password }" placeholder="비밀번호"/></td>
			</tr>
			<tr>
				<td>이름: </td>
				<td><form:input type="text" path="name" value="${ member.name }" placeholder="이름"/></td>
			</tr>
			<tr>
				<td>전화번호: </td>
				<td><form:input type="text" path="phone" value="${ member.phone }" placeholder="01012345678"/></td>
			</tr>
			<tr>
				<td>이메일: </td>
				<td><form:input type="text" path="email" value="${ member.email }" placeholder="ID@email.com"/></td>
				<td>
					@
					<select name="emailAddress">
						<option value="naver.com" ${ emailAddress == "naver.com" ? "selected" : "" }> naver.com </option>
						<option value="gmail.com" ${ emailAddress == "gmail.com" ? "selected" : "" }> gmail.com </option>
						<option value="daum.net" ${ emailAddress == "daum.net" ? "selected" : "" }> daum.net </option>
					</select>
				</td>
			</tr>
			<tr>
				<td>제1전공: </td>
				<td>
					<form:select path="first_major_id" itemValue="id" itemLabel="name" items="${ majors }"/>
				</td>
				<td>제2전공: </td>
				<td>
					<form:select path="sec_major_id" itemValue="id" itemLabel="name" items="${ majors }"/>
				</td>
			</tr>
		</table>
		<button type="submit">회원 가입</button>
	</form:form>
</body>
</html>