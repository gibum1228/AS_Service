<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="/common.js"></script>
<link rel="stylesheet" type="text/css" href="/common.css" />
<style>
div.container {
	width: 600px;
	margin: auto;
}

form {
	box-shadow: 0 0 4px lightgray, 2px 2px 4px gray;
	overflow: auto;
	font-size: 10pt;
}

div.title {
	font-size: 20pt;
	padding: 10px;
	background-color: #eee;
}

table {
	margin: 20px;
}

td {
	min-width: 100;
	padding: 10px;
}

td:nth-child(1) {
	text-align: left;
}

input {
	padding: 4px;
}

button {
	padding: 0.5em 0.5em;
	margin: 0 0 0 0;
}

div.message {
	border-radius: 10px;
	padding: 12px;
	margin: 10px;
	background-color: #ffa;
	border: 1px solid #cc0;
}
</style>
<script language="javascript">
	function closewin() {
		window.opener.name = "select"; // 부모창의 이름 설정
		document.myForm.target = "select"; // 타켓을 부모창으로 설정
		document.myForm.action = "/front/lend/select";
		document.myForm.submit();
		self.close();
	}
</script>
<script type="text/javascript">

 $(function(){

	$('#commentbtn').on('click', function(){
    	//값들의 갯수 -> 배열 길이를 지정
		var grpl = $("input[name=selectDate]").length;
		//배열 생성
		var grparr = new Array(grpl);
		//배열에 값 주입
		for(var i=0; i<grpl; i++){                          
			grparr[i] = $("input[name=selectDate]").eq(i).val();
	        alert(grparr[i]);
	    }
	});
}); 
</script>
</head>
<body>
	<div class="container">
		<div class="title">장비선택하기</div>
		<form method="post">
			<table>
				<tr>
					<td><select name="device_type">

							<option value="1" ${ device_type == 1 ? "selected" : "" }>노트북</option>
							<option value="2" ${ device_type == 2 ? "selected" : "" }>태블릿</option>
							<option value="3" ${ device_type == 3 ? "selected" : "" }>카메라</option>
							<option value="4" ${ device_type == 4 ? "selected" : "" }>삼각대</option>
							<option value="5" ${ device_type == 5 ? "selected" : "" }>빔
								프로젝터</option>

					</select>
					<button type="submit">확인</button></td></tr>
			
		</form>
			
			<form name="myForm" method="post">
			<c:if test="${ device_type > 0 }"><!--type을 선택하지않았을때  -->
			<c:if test="${ devices_size != 0 }"><!--type에 해당되는 장비가 0일때  -->
				<tr>
					<td><select name="device_code">
							<c:forEach var="device" items="${ devices }">
								<option value=${ device.code }>${ device.name }</option>
							</c:forEach>
					</select>
					<input type="button" value="선택"
						onclick="javascript:closewin()"></td>
					<td><input type="hidden" name="device_type"
						value="${device_type}"></td>
					<td><input type="hidden" name="visit_date"
						value="${visit_date}"></td>
				
					</c:if>
					<c:if test="${ devices_size == 0 }"><!--type에 해당되는 장비가 0일때  -->
					<td>	선택한 유형의 장비가 없거나 더이상 예약 가능한 장비가 없습니다. </td></tr>
					</c:if>
					</c:if>
					
			</form>
			</table>
		
	


	</div>
</body>
</html>

