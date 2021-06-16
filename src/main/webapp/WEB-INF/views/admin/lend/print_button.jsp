<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<link rel="stylesheet" href="/css/lend.css">
<link rel="stylesheet" href="/css/main.css">
<script src="/js/main.js"></script>
<script src="/js/lend.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js"
	integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT"
	crossorigin="anonymous"></script>
	<title>성공회대학교 A/S실</title>
<link rel="icon" href="/media/mark_SKHU.png">

</head>
<body>
  
	<button class="btn btn-success print" onclick="onClick()">출력하기</button>

	<script type="text/javascript">
	
	function onClick(){
		const html = window.open('http://localhost:8088/admin/lend/print?lend_no=${lend_no}','_blank',
				"toolbar=no,directories=no,scrollbars=no,resizable=no,status=no,menubar=no,width=1000, height=1000, top=130,left=500");
		html.print();
	}
	
	
	</script>
</body>
</html>