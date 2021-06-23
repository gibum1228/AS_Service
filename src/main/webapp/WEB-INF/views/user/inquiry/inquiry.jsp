<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>성공회대학교 A/S실</title>
<link rel="icon" href="/media/mark_SKHU.png">
<link rel="stylesheet" href="/css/inquiry.css">
<link rel="stylesheet" href="/css/main.css">
<script src="/js/main.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

</head>
<body style="margin-bottom: 4%;">
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
	<div class="container" id="app">

		<form method="post">
			<div>
				<div><h1>문의사항 글쓰기</h1></div>
				<div class ="type_checkbox" style="display:inline-block;">
					<span style="color:red; margin-left:11%;" v-show="!type"># 문의 타입을 선택해주세요</span><br>
					<label><input type="radio" class="pixed" v-model="type" name="type" value=1> 장비 장애</label>
					<label><input type="radio" class="pixed" v-model="type" name="type" value=2> 버그 신고</label>
					<label><input type="radio" class="pixed" v-model="type" name="type" value=3> 기타</label>	
				</div>   
				
			</div>
			
			<table>
				<thead>
					<tr>
						<th>제목</th>
						<th><input type="text" class="title" name="title" value="" placeholder="제목" /></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><h4>내용</h4></td>
						<td><textarea class="body" id="body" name="body" rows="3"
								placeholder=" 내용을 적어주세요"></textarea>
							<div id="string_limit">(0 / 1000)</div></td>
					</tr>
					<script>
						$(document)
								.ready(
										function() {
											$('#body')
													.on(
															'keyup',
															function() {
																$(
																		'#string_limit')
																		.html(
																				"("
																						+ $(
																								this)
																								.val().length
																						+ " / 1000)");

																if ($(this)
																		.val().length > 1000) {
																	$(this)
																			.val(
																					$(
																							this)
																							.val()
																							.substring(
																									0,
																									1000));
																	$(
																			'#string_limit')
																			.html(
																					"(1000 / 1000)");
																}
															});
										});
					</script>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="2"><button type="submit" v-bind:disabled="!type" @click:>저장</button><button type="button" onclick = "location.href='inquiry_list_front'">돌아가기</button></td>
					</tr>
				</tfoot>
			</table>


		</form>
	</div>
	<script type="text/javascript">
	var app = new Vue({
		el: '#app',
		data: { type : null}
		})
	</script>
</body>
</html>
