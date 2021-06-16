<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>성공회대학교 A/S실</title>
<link rel="icon" href="/media/mark_SKHU.png">
<link rel="stylesheet" href="/css/inquiry_details.css">
<link rel="stylesheet" href="/css/main.css">
<script src="js/main.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
</head>
<body style="margin-bottom: 3%;">
	<div class="header" style="box-shadow: 0px 1px 20px gray;">
		<div class="headerBtn" style="float: left; width: 350px;" onclick="location.href='/index'">
			<img src="/media/logo_mark_mr_sin.jpg" alt="logo_AS" width="100%" height="100%">
		</div>
		<a class="headerBtn" href="/logout_processing">로그아웃</a>
		<a class="headerBtn" href="/user/mypages">마이페이지</a>
		<a class="headerBtn" href="/user/inquiry/inquiry_list_front">문의하기</a>
		<a class="headerBtn" href="">예약하기</a>
		<a class="headerBtn" href="/user/notice/notice_list_front">공지사항</a>
	</div>


	<div>
		<div class="title_banner">
		<h1>문의사항</h1>
		</div>

		<hr class="hr_level2">
		<div>
			<div class="title">
				<p>${inquiry_list.getTitle()}</p>
			</div>
			<div class="write_option">
				<div class="writeing_day">작성일: ${inquiry_list.getWrite_date() }</div>
				<div class="name">작성자: ${ inquiry_list.getSnum() }</div>
				<div class="type">문의 타입: <c:if test ="${ inquiry_list.getType() == 1 }" >장비 장애</c:if><c:if test ="${ inquiry_list.getType() == 2 }" >버그 신고</c:if><c:if test ="${ inquiry_list.getType() == 3 }" >기타</c:if></div>
			</div>
			<hr class="hr_level2">
			<div class="notice_body">
				<p>${inquiry_list.getBody()}</p>
			</div>
			<hr class="hr_level2">
			<div id = "aee">
			<div class="next" v-on:click="next_list"><span>다음글</span><span class="next_text">${nextTitle}</span></div>
			<hr class="hr_level1">
			<div class="next" v-on:click="pre_list"><span>이전글</span><span class="next_text">${preTitle}</span></div>
			</div>
			<script type="text/javascript">
				var LX = "${LX}";
				var no = "${inquiry_list.getNo()}";
				var next_no = "${inquiry_next}";
				var pre_no = "${inquiry_pre}";
				
				var app = new Vue({
					el: '#aee',
					data: { 
						
						},
					methods: {
						next_list() {
							if(LX == no) {
								confirm("게시글이 없습니다");
							}
							else{
								location.href='inquiry_details_front?no='+next_no;
							}
						},
						pre_list() {
							if(no == 1) {
								confirm("게시글이 없습니다");
							}
							else{
								location.href='inquiry_details_front?no='+pre_no;
							}
						}
					}
	
				}) 
			</script>
			</div>
			</div>
			<hr class="hr_level2">

			<div id="app" v-show="${inquiry_list.getState() }">
	 			<div class="title_banner">
				<h1>답변</h1>
				</div>
				
				<div class="write_option">
				<hr class="hr_level2">
			<div class="notice_body">
				<p>${inquiry_list.getAnswer() }</p>
			</div>
			<hr class="hr_level2">
			</div>
			</div>
			<script type="text/javascript">
				var app = new Vue({
					el : '#app',
					data : {
						
					}
				})
			</script>
			<button class="button_back" onclick = "location.href='inquiry_list_front'">돌아가기</button>
			
</body>
<footer>

</footer>
</html>