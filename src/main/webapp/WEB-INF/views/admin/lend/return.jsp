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
<script language="javascript">
	function closewin1() {
		window.opener.name = "return"; // 부모창의 이름 설정
		document.myForm1.target = "return"; // 타켓을 부모창으로 설정
		document.myForm1.action = "/admin/lend/extendsave";
		document.myForm1.submit();
		self.close();
	}
</script>

<script language="javascript">
	function closewin2() {
		window.opener.name = "return"; // 부모창의 이름 설정
		document.myForm2.target = "return"; // 타켓을 부모창으로 설정
		document.myForm2.action = "/admin/lend/returnsave";
		document.myForm2.submit();
		self.close();
	}
</script>	
<title>성공회대학교 A/S실</title>
<link rel="icon" href="/media/mark_SKHU.png">
</head>
<body>

	<div >
		<form method="post" name=myForm1 >
	
			<table class="return">
				<tr>
					<td colspan="3">대여시작일 : <fmt:formatDate pattern="yyyy-MM-dd"
							value="${ selectedLend.start_date }" /></td>
				</tr>
				<tr>
					<td colspan="3">반납예정일 : <fmt:formatDate pattern="yyyy-MM-dd"
							value="${ selectedLend.end_date }" /></td>
				</tr>
				<tr>
					<td colspan="3">반납일 : <fmt:formatDate pattern="yyyy-MM-dd"
							value="${ today }" /></td>
				</tr>
				<tr style="text-align: left;">
					<td>반납일연장: </td><td><fmt:formatDate pattern="yyyy-MM-dd"
							value="${ end_date }" var="b" /> <input type="date" class="form-control"
						name="end_date" value="${ b }" /></td>
				
						<td><button type="button"class="btn btn-success" onclick="javascript:closewin1()">연장</button>
					</td>
					</tr>
					<c:if test="${ returnday < endday }">
					<tr><td colspan="3">반납예정일로부터 ${calDateDays}일 전입니다.</td></tr>
					</c:if>
					<c:if test="${ returnday == endday }">
					<tr><td colspan="3">반납예정일 당일입니다.</td></tr>
					</c:if>
					<c:if test="${returnday > endday }">
					<tr><td colspan="3">반납예정일로부터 ${calDateDays }일 지났습니다.</td></tr>
					<tr><td class="p">연체료: ${ arrears }원</td></tr>
					</c:if>
					<input type="hidden" name=lend_no value="${lend_no}" />
					<input type="hidden" name=arrears value="${arrears}" />
				</form>
					<tr>
					<form method="post" name=myForm2>
					<td colspan="3" style="margin-left:300px;"><button type="button"  class="btn btn-primary" onclick="javascript:closewin2()">반납</button></td>
					<td><input type="hidden" name=lend_no value="${lend_no}" /></td>
					<td><input type="hidden" name=arrears value="${arrears}" /></td></tr>
					</form>
					
			
			</table>


	</div>
</body>
</html>



