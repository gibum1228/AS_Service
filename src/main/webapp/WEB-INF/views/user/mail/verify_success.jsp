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
</head>
<body>
	<div id='app' class="container_center" style="width: 100%;">
		<div style="height: 400px;">
			<p style="line-height: 350px; font-size: 50px; text-align: center;">
				이메일 인증에 성공해서 {{ count }}초 후에 로그인 화면으로 이동합니다.
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