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
	<div class="header" style="box-shadow: 0px 1px 20px gray;">
		<div class="headerBtn" style="float: left; width: 350px;" onclick="location.href='/index'">
			<img src="/media/logo_mark_mr_sin.jpg" alt="logo_AS" width="100%" height="100%">
		</div>
		<a class="headerBtn" href="/logout_processing">로그아웃</a>
		<a class="headerBtn" href="/user/mypages">마이페이지</a>
		<a class="headerBtn" href="/user/inquiry/inquiry_list_front">문의하기</a>
		<a class="headerBtn" href="/user/lend/select_com_laptop">예약하기</a>
		<a class="headerBtn" href="/user/notice/notice_list_front">공지사항</a>
	</div>


	<div>
		<div class="title_banner">
		<h1>공지사항</h1>
		</div>
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
			<div class="next" v-on:click="next_list"><img src="/media/arrow_drop_up_black_24dp.svg" width="5%" style="position: absolute; bottom:-15%; left:0%;"><span style="margin-left:5%;">다음글</span><span class="next_text">${nextTitle}</span></div>
			<hr class="hr_level1">
			<div class="next" v-on:click="pre_list"><img src="/media/arrow_drop_down_black_24dp.svg" width="5%" style="position: absolute; bottom:-20%; left:0%;"><span style="margin-left:5%;">이전글</span><span class="next_text">${preTitle}</span></div>
			</div>
			<script type="text/javascript">
				var LX = "${LX}";
				var no = "${notice_list.getNo()}";
				var next_no = "${notice_next}";
				var pre_no = "${notice_pre}";
				
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
			<button class="button_back" onclick = "location.href='notice_list_front'">돌아가기</button>
			</div>
			</div>
</body>
<footer>

</footer>
</html>