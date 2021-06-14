<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>성공회대학교 A/S실</title>
<link rel="stylesheet" href="/css/main.css">
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<style type="text/css">
	.container_btn {
		width: 800px;
		height: 100px;
		margin: 0 auto; 
		text-align: center;
	}
	p {
		text-align: center;
		line-height: 250px;
		font-size: 40px;
	}
	.btn {
		width: 300px;
		height: 80px;
		vertical-align: middle;
		display: inline-block;
		border-radius: 35px;
	}
	.btn a {
		line-height: 80px;
		text-align: center;
		text-decoration: none;
		font-size: 25px;
	}
</style>
</head>
<body>
	<div id="app" class="container_center" style="border: 1px solid black; border-radius: 50px; width: 100%;">
		<div style="height: 300px;">
			<p>
				인증 확인 메일을 보냈습니다!<br>
				{{ count }}초 후에 메인 화면으로 이동합니다
			</p>
		</div>
	</div>
	<script>
		let app = new Vue({
			el: '#app',
			data: {
				count: 5
			},
			mounted() {
				setInterval(() => {
					this.count--;
					if(this.count == 0){
						location.href = "/logout_processing";
						clearInterval(this);
					}
				},1000)
			}
		})
	</script>
</body>
</html>