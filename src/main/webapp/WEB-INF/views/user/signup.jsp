<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>성공회대학교 A/S실</title>
<link rel="stylesheet" href="/css/boxs.css">
<link rel="stylesheet" href="/css/login.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script type="text/javascript" src="/js/signup.js" async defer></script>
</head>
<body>
	<div id="app">
		<form method="POST">
			<div class="imgContainer">
				<img src="media/logo_mr_sin.jpg" alt="mark" width="350px" height="200px"
					onclick="window.open('/login', '_self')">
			</div>
			<!--정보 입력-->
			<div class="container">
				<label for="usnum"><b>학번*</b></label>
				<input type="text" v-model.trim="m.snum" placeholder="학번" autocomplete="off"/>
			</div>
			<div class="container">
				<label for="uname"><b>이름*</b></label>
				<input type="text" v-model.trim="m.name" placeholder="이름" utocomplete="off" />
			</div>
			<div class="container">
				<label for="upsw"><b>비밀번호*</b></label>
				<input type="password" v-model.trim="m.pwd" placeholder="비밀번호"	autocomplete="off" @change="pswSame" />
			</div>
			<div class="container">
				<label for="uemail"><b>이메일*</b></label>
				<input type="email" v-model.trim="m.email" placeholder="ID@office.skhu.ac.kr" @change="emailSame" />
			</div>
			<div class="container">
				<label for="uphone"><b>휴대 전화*</b></label>
				<input type="text" v-model.trim="m.phone" placeholder="01012345678" autocomplete="off" />
			</div>
			<div class="container">
				<table style="text-align: center;">
					<tr>
						<td>제1전공</td>
					</tr>
					<tr>
						<td>
							<select v-model="m.first_major" @change="checkDouble()">
								<option v-for="major in majorList" v-bind:value="m.id">
									{{ major.name }}
								</option>
							</select>	
						</td>
					</tr>
				</table>
			</div>
	
			<!--정보 전송-->
			<div class="container">
				<div style="margin-top: 50px;">
					<button type="submit" id="upBtn" disabled="disabled">회원 가입</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>