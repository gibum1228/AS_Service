<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>성공회대학교 A/S실</title>
<link rel="stylesheet" href="/css/boxs.css">
<link rel="stylesheet" href="/css/login.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="/js/signup.js"></script>
</head>
<body>
	<form:form method="POST" modelAttribute="member">
		<div class="imgContainer">
			<img src="media/로고_신영복체.jpg" alt="mark" width="40%" height="40%"
				onclick="window.open('/login', '_self')">
		</div>
		<!--정보 입력-->
		<div class="container">
			<label for="usnum"><b>학번*</b></label>
			<form:input type="text" path="snum" value="${ member.snum }"
				placeholder="학번" name="userSNum" autocomplete="off" onchange="idSame(this)" />
		</div>
		<div class="container">
			<label for="uname"><b>이름*</b></label>
			<form:input type="text" path="name" value="${ member.name }"
				placeholder="이름" name="userName" autocomplete="off" />
		</div>
		<div class="container">
			<label for="upsw"><b>비밀번호*</b></label>
			<form:input type="password" path="password"
				value="${ member.password }" placeholder="비밀번호" name="userPsw"
				autocomplete="off" />
		</div>
		<div class="container">
			<label for="cpsw"><b>비밀번호 확인*</b></label>
			<form:input type="password" placeholder="비밀번호 재입력" name="checkPsw"
				path="password" autocomplete="off" />
		</div>
		<div class="container">
			<label for="uemail"><b>이메일*</b></label>
			<form:input type="email" path="email" value="${ member.email }"
				placeholder="ID@as.com" name="userEmail" autocomplete="off" />
		</div>
		<div class="container">
			<label for="uphone"><b>휴대 전화*</b></label>
			<form:input type="text" path="phone" value="${ member.phone }"
				placeholder="01012345678" name="userPhone" autocomplete="off" />
		</div>
		<div class="container">
			<table style="text-align: center;">
				<tr>
					<td>제1전공</td>
					<td>제2전공</td>
				</tr>
				<tr>
					<td><form:select path="first_major_id" itemValue="id"
							itemLabel="name" items="${ majors }" name="userFirstMajor"
							id="selectBox" /></td>
					<td><form:select path="sec_major_id" itemValue="id"
							itemLabel="name" items="${ majors }" name="userSecondMajor"
							id="selectBox" /></td>
				</tr>
			</table>
		</div>

		<!--정보 전송-->
		<div class="container">
			<div style="margin-top: 50px;">
				<button type="submit" id="upBtn">회원 가입</button>
			</div>
		</div>
	</form:form>
</body>
</html>