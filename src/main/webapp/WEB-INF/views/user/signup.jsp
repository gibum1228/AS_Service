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
<link rel="stylesheet" href="/css/main.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://kit.fontawesome.com/68abb170e0.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="/js/signup.js" async defer></script>
<style>
	body {
		font-size: 20px;
	}
	.error {
		padding-left: 15px;
		font-size: 12.5px;
		color: red;
	}
	.success {
		padding-left: 15px;
		font-size: 10px;
		color: green;
	}
	.backBtn {
		position: absolute;
		left: 20px;
		top: 20px;
		cursor: pointer;
	}
	.help {
		position: absolute;
		left: 80px;
		top: 20px;
		cursor: pointer;
	}
	.helpBox {
		position: absolute;
		top: 60px;
		left: 80px;
		width: 300px;
		height: 300px;
		border: 1px solid black;
		background-color: lightyellow;
	}
</style>
</head>
<body>
	<div id="app" style="padding-top: 30px;">
		<div class="backBtn" onclick="location.href='/login'">
			<i class="fas fa-arrow-circle-left" style="font-size: 40px;"></i>
		</div>
		<!-- <div class="help" @click="showHelp">
			<i class="fas fa-question-circle" style="font-size: 40px;"></i>
		</div>
		<div class="helpBox" v-show="help">
			@office.skhu.ac.kr 계정 만드는 방법<br><br>
			1. 학교 홈페이지에 로그인한다.<br><br>
			2. 상단에 office365 로고를 클릭한다.<br><br>
			3. office365 계정을 만든다.<br>
			(*A/S실 웹 서비스 가입과 MS 학생판을 사용한다.)
		</div> -->
		<form method="POST">
			<!--정보 입력-->
			<div class="container" style="padding-top: 20px;">
				<b>학번*</b>
				<input type="text" name="snum" v-model.trim="m.snum" placeholder="학번" autocomplete="off"/>
				<p class="error" v-show="!m.snum">
					<i class="fas fa-check"></i>  정확하게 기재해주세요.
				</p>
			</div>
			<div class="container">
				<b>이름*</b>
				<input type="text" name="name" v-model.trim="m.name" placeholder="이름" autocomplete="off" />
			</div>
			<div class="container">
				<b>비밀번호*</b>
				<input type="password" name="pwd" v-model.trim="m.pwd" placeholder="비밀번호"	autocomplete="off" @change="pswSame" />
				<p class="error" v-show="!pwdOk">
					<i class="fas fa-check"></i>  비밀번호는 6~15 자리만 입력 가능합니다<br>
					<i class="fas fa-check"></i>  비밀번호에 특수문자가 들어갈 수 없습니다.
				</p>
				<p class="success" v-show="pwdOk">
					<i class="fas fa-check"></i> 제대로 입력하셨습니다.
				</p>
			</div>
			<div class="container">
				<b>이메일*</b>
				<input type="email" name="email" v-model.trim="m.email" placeholder="ID@domain.com" @change="emailSame" />
				<p class="error" v-show="!emailOk">
					<i class="fas fa-check"></i>  구글, 네이버, 다음 계정으로만 가입 가능합니다.
				</p>
				<p class="success" v-show="emailOk">
					<i class="fas fa-check"></i> 제대로 입력하셨습니다.
				</p>
			</div>
			<div class="container">
				<b>휴대 전화*</b>
				<input type="text" name="phone" v-model.trim="m.phone" placeholder="01012345678" autocomplete="off" />
			</div>
			<div class="container">
				<table>
					<tr>
						<td><b>제1전공*</b></td>
						<td><b>제2전공*</b></td>
					</tr>
					<tr>
						<td>
							<select class="selectBox" name="first_major" v-model="m.first_major" @change="checkDouble">
								<option v-for="major in majorList" v-bind:value="major.id">
									{{ major.name }}
								</option>
							</select>
						</td>
						<td>
							<select class="selectBox" name="sec_major" v-model="m.sec_major" @change="checkDouble">
								<option v-for="major in majorList" v-bind:value="major.id">
									{{ major.name }}
								</option>
							</select>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<p class="error">
								<i class="fas fa-check"></i> 학부생은 제1전공과 제2전공을 같게 선택해주세요.
							</p>
						</td>
					</tr>
				</table>
			</div>
	
			<!--정보 전송-->
			<div class="container">
				<div style="margin-top: 20px;">
					<button type="submit" id="upBtn" v-bind:disabled="disable">회원 가입</button>
					<p class="error">
						${ error }
					</p>
				</div>
			</div>
		</form>
	</div>
</body>
</html>