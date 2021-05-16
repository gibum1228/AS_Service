<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>성공회대학교 A/S 센터</title>
<link rel="stylesheet" href="/css/notice_details.css">
<link rel="stylesheet" href="/css/main.css">
<script src="js/main.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
</head>
<body>
	<div class="navBar">
		<a href="/index" id="homeImg"><img src="/media/마크_성공회대학교.png"
			alt="MAIN" width="50px" height="50px"></a> <a href="">공지사항</a> <a
			href="">장비 예약</a> <a href="">장비 목록</a> <a href="">문의하기</a>
		<sec:authorize access="authenticated">
			<a class="btn" style="float: right;" href="/logout_processing">로그아웃</a>
		</sec:authorize>
		<a href="/front/mypages" style="float: right;">마이페이지</a>
	</div>


	<div>
		<h1>공지사항</h1>

		<hr class="hr_level2">
		<div>
			<div class="title">
				<p>${notice_list.getTitle()}</p>
			</div>
			<div class="write_option">
				<div class="writeing_day">작성일: ${notice_list.getWrite_date() }</div>
				<div class="name">작성자: ${ notice_list.getSnum() }</div>
			</div>
			<hr class="hr_level2">
			<div class="notice_body">
				<p>${notice_list.getBody()}</p>
			</div>
			<hr class="hr_level2">
			<div id = "app">
			<div class="next" v-on:click="next_list"><span>다음글</span><span class="next_text">${nextTitle}</span></div>
			<hr class="hr_level1">
			<div class="next" v-on:click="pre_list"><span>이전글</span><span class="next_text">${preTitle}</span></div>
			</div>
			<script type="text/javascript">
				var LX = "${LX}";
				var no = "${notice_list.getNo()}";
				var next_no = parseInt(no)+1;
				var pre_no = parseInt(no)-1;
				
				var app = new Vue({
					el: '#app',
					data: { 
						
						},
					methods: {
						next_list() {
							if(LX == no) {
								confirm("게시글이 없습니다");
							}
							else{
								location.href='notice_details?no='+next_no;
							}
						},
						pre_list() {
							if(no == 1) {
								confirm("게시글이 없습니다");
							}
							else{
								location.href='notice_details?no='+pre_no;
							}
						}
					}
	
				}) 
			</script>
			
</body>
<footer>

</footer>
</html>