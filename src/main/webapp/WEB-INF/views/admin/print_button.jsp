<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>테스트</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<body>

	<button onclick="onClick()">다음</button>
	
	<script type="text/javascript">
	
	function onClick(){
		const html = window.open('http://localhost:8088/admin/print?snum=201734017');
		html.print();
	}
	
	
	</script>
</body>
</html>