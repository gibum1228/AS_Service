<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x"
	crossorigin="anonymous">
<link rel="stylesheet" href="/css/lend.css">
<link rel="stylesheet" href="/css/main.css">
<script src="/js/main.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js"
	integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT"
	crossorigin="anonymous"></script>

	<script>
	/* 선택한 장비의 버튼 색깔 변경 */
function setColor(btn){
    var property = document.getElementById(btn);

        property.style.backgroundColor = "#d9d9d9";
        property.style.color="#5e5e5e";
        
}
</script>

<script>
	/* 선택한 학과의 버튼 색깔 변경 */
function majorsetColor(btn){
    var property = document.getElementById(btn);

        property.style.backgroundColor =  "#5d6c8c";
        property.style.color="white";
        
}
</script>
<title>성공회대학교 A/S실</title>
<link rel="icon" href="/media/mark_SKHU.png">
</head>
	<div id="navBar">
		<a href="/index" id="homeImg"><img src="/media/mark_SKHU.png" alt="MAIN" width="100%" height="100%"></a> 
		<a href="/user/notice/notice_list_front">공지사항</a>
		<a href="/user/lend/select_com_laptop">장비 예약</a> <a href="/user/lend/userpage">장비 목록</a> <a href="/user/inquiry/inquiry_list_front">문의하기</a>
		<sec:authorize access="authenticated">
			<a class="btn" style="float: right;" href="/logout_processing">로그아웃</a>
		</sec:authorize>
		<a href="/user/mypages" style="float: right;">마이페이지</a> 
		<a style="float: right; pointer-events: none;">${ student.name }님</a>
	</div>

		<div class="header" style="overflow: inherit;">
			<div class="headerBtn" style="float: left; width: 350px;">
				<img src="/media/logo_mark_mr_sin.jpg" alt="logo_AS" width="100%" height="100%">
			</div>
			<a class="headerBtn" href="/logout_processing">로그아웃</a>
		<a class="headerBtn" href="/user/mypages">마이페이지</a>
		<a class="headerBtn" href="/user/inquiry/inquiry_list_front">문의하기</a>
		<a class="headerBtn" href="/user/lend/select_com_laptop">예약하기</a>
		<a class="headerBtn" href="/user/notice/notice_list_front">공지사항</a>
		</div>

<body>
	<div class="select_top">
		<h1>장비대여</h1>
	</div>
<div class="select_top_down">
		<table class="major">
			<tr>
				<td><button class="majored_button">컴퓨터공학과</button></td>
				<td><button class="major_button">소프트웨어공학과</button></td>
			</tr>
			</table>
	</div><div class="n"></div>
	
	<div class="select_middle">
			
			<table class="select">
			<tr>
			<td><a class="selected_button" id="button1" value = "button1"  onclick="setColor('button1')" href="select_com_laptop">노트북</button></td>
				<td><a class="select_button"  href="select_com_tablet">태블릿</button></td>
				<td><a class="select_button"  href="select_com_laptop">카메라</button></td>
				<td><a class="select_button"  href="select_com_laptop">삼각대</button></td>
				<td><a class="select_button"  href="select_com_laptop">빔프로젝터</button></td>
			</tr>
		</table>
	</div>
	<div class="select_bottom">
		<table class="frame">
			<tr>
			<!-- LG 14Z980-GAP50ML -->
				<td>
					<div class="card" style="width: 18rem;" style="height: 18rem;">
						<img src="/media/device/lg.jpg" class="card-img-top" alt="lg그램"
							data-bs-toggle="modal" href="#exampleModalToggle">
						<div class="card-body">
							<h5 class="card-title">LG 14Z980-GAP50ML</h5>
						</div>
					</div>
				</td>
				<td>
<div class="modal fade" id="exampleModalToggle" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
  <div class="modal-dialog modal-xl">
    <div class="modal-content">
    <div class="modal-header">
									<h3 class="modal-title" id="exampleModalLabel">
										세부정보
										</h3>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
								</div>
								<table class="m">
								<tr>
								<td>
								<div class="modal-body">
									<table class="select_img">
										<tr>
											<td colspan="2">
											<div id="carouselExampleDark" class="carousel carousel-dark slide" data-bs-ride="carousel">
										  <div class="carousel-indicators">
										    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
										    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="1" aria-label="Slide 2"></button>
										    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="2" aria-label="Slide 3"></button>
										  </div>
										  <div class="carousel-inner">
										    <div class="carousel-item active" data-bs-interval="3000">
										      <img src="/media/device/lg.jpg" class="d-block w-100" alt="...">
										    </div>
										    <div class="carousel-item" data-bs-interval="3000">
										      <img src="/media/device/lg_up.jpg" class="d-block w-100" alt="...">
										    </div>
										    <div class="carousel-item" data-bs-interval="3000">
										      <img src="/media/device/lg_down.jpg" class="d-block w-100" alt="...">
										    </div>
										  </div>
										  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="prev">
										    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
										    <span class="visually-hidden">Previous</span>
										  </button>
										  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="next">
										    <span class="carousel-control-next-icon" aria-hidden="true"></span>
										    <span class="visually-hidden">Next</span>
										  </button>
										</div>
											</td>
										</tr>
										</table>
										
										</td>
										<td>
									<table class="t">
										<tr>
					
											<th>모델명</th>
											<td>LG 14Z980-GAP50ML</td>
										</tr>
										<tr>
										
											<th>화면크기</th>
											<td>35.56(14인치)</td>
										</tr>
										<tr>
										
											<th>CPU 종류</th>
											<td>코어i5-8세대</td>
										</tr>
										<tr>
										
											<th>CPU 넘버</th>
											<td>i5-8250U (1.6GHz)</td>
										</tr>
										<tr>
										
											<th>운영체제(OS)</th>
											<td>윈도우10</td>
										</tr>
										<tr>
										
											<th>메모리 용량</th>
											<td>8GB</td>
										</tr>
										<tr>
									
											<th class="lineless">SSD</th>
											<td class="lineless">512GB</td>
										</tr>
									</table>
									</td>
									</tr>
									</div>
									</table>
								
      <div class="modal-footer">
        <button class="btn btn-primary" data-bs-target="#exampleModalToggle2" data-bs-toggle="modal" data-bs-dismiss="modal">예약신청</button>
      </div>
    </div>
  </div>
</div>
<div class="modal fade" id="exampleModalToggle2" aria-hidden="true" aria-labelledby="exampleModalToggleLabel2" tabindex="-1">
  <div class="modal-dialog modal-lg modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalToggleLabel2">예약신청</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      
       <table class="table">
	
       <form name="device" method="post" action="userlist">
					 <thead>
					 <tr>
					
					<th>대여장비</th>
					<th>방문날짜</th>
					</tr>
					</thead>
					<tbody>
					<tr>
					
					<td>LG 14Z980-GAP50ML</td>
						<td>
					<select class="btn btn-secondary"  name="visit_date">
							<option class="btn btn-light" value=${calendar[0] }
								${ visit_date == calendar[0] ? "selected" : "" }>${selectDate[0]}</option>
							<option class="btn btn-light" value=${calendar[1] }
								${ visit_date == calendar[1] ? "selected" : "" }>${selectDate[1]}</option>
							<option class="btn btn-light"  value=${calendar[2] }
								${ visit_date == calendar[2] ? "selected" : "" }>${selectDate[2]}</option>
							<option class="btn btn-light" value=${calendar[3] }
								${ visit_date == calendar[3] ? "selected" : "" }>${selectDate[3]}</option>
							<option class="btn btn-light" value=${calendar[4] }
								${ visit_date == calendar[4] ? "selected" : "" }>${selectDate[4]}</option>
					</select>
					</td>
				</tr>
	</tbody>
			  </table>
			  <input type="hidden" name="device_code"  
						value="COM00001" /><!-- 장비코드명 보내기 -->
				<input type="hidden" name="lend_type"
						value="1" /> <!-- 장비 타입 (노트북) 보내기 -->
      </div>
      <div class="modal-footer">
     
       <button class="btn btn-secondary" data-bs-target="#exampleModalToggle" data-bs-toggle="modal" data-bs-dismiss="modal">뒤로가기</button>
     <button type="submit" class="btn btn-primary"  data-confirm>예약신청완료</button>	
      </form>
     
     	
      </div>
    </div>
  </div>
</div>
				</td>
				
				<!-- LG 14Z970-GA5BML -->
				
				<td>
					<div class="card" style="width: 18rem;" style="height: 18rem;">
						<img src="/media/device/lg.jpg" class="card-img-top" alt="lg그램"
							data-bs-toggle="modal" href="#exampleModalToggle3">
						<div class="card-body">
							<h5 class="card-title">LG 14Z970-GA5BML</h5>
						</div>
					</div>
				</td>
				<td>
				
<div class="modal fade" id="exampleModalToggle3" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
  <div class="modal-dialog modal-xl">
    <div class="modal-content">
    <div class="modal-header">
									<h3 class="modal-title" id="exampleModalLabel">
										세부정보
										</h3>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
								</div>
								<table class="m">
								<tr>
								<td>
								<div class="modal-body">
									<table class="select_img">
										<tr>
											<td colspan="2">
											<div id="carouselExampleDark" class="carousel carousel-dark slide" data-bs-ride="carousel">
										  <div class="carousel-indicators">
										    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
										    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="1" aria-label="Slide 2"></button>
										    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="2" aria-label="Slide 3"></button>
										  </div>
										  <div class="carousel-inner">
										    <div class="carousel-item active" data-bs-interval="3000">
										      <img src="/media/device/lg.jpg" class="d-block w-100" alt="...">
										    </div>
										    <div class="carousel-item" data-bs-interval="3000">
										      <img src="/media/device/lg_up.jpg" class="d-block w-100" alt="...">
										    </div>
										    <div class="carousel-item" data-bs-interval="3000">
										      <img src="/media/device/lg_down.jpg" class="d-block w-100" alt="...">
										    </div>
										  </div>
										  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="prev">
										    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
										    <span class="visually-hidden">Previous</span>
										  </button>
										  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="next">
										    <span class="carousel-control-next-icon" aria-hidden="true"></span>
										    <span class="visually-hidden">Next</span>
										  </button>
										</div>
											</td>
										</tr>
										</table>
										
										</td>
										<td>
										
									<table class="t">
										<tr>
											<th>모델명</th>
											<td>LG 14Z970-GA5BML</td>
										</tr>
										<tr>
											<th>화면크기</th>
											<td>35.56(14인치)</td>
										</tr>
										<tr>
											<th>CPU 종류</th>
											<td>코어i5-7세대</td>
										</tr>
										<tr>
											<th>CPU 넘버</th>
											<td>i5-7200U (1.6GHz)</td>
										</tr>
										<tr>
											<th>운영체제(OS)</th>
											<td>윈도우10</td>
										</tr>
										<tr>
											<th>메모리 용량</th>
											<td>8GB</td>
										</tr>
										<tr>
											<th class="lineless">SSD</th>
											<td class="lineless">256GB</td>
										</tr>
									</table>
								</div>
								</td>
								</tr>
								</table>
      <div class="modal-footer">
        <button class="btn btn-primary" data-bs-target="#exampleModalToggle4" data-bs-toggle="modal" data-bs-dismiss="modal">예약신청</button>
      </div>
    </div>
  </div>
</div>
<div class="modal fade" id="exampleModalToggle4" aria-hidden="true" aria-labelledby="exampleModalToggleLabel2" tabindex="-1">
  <div class="modal-dialog modal-lg modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalToggleLabel2">예약신청</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
       <table class="table">
	
       <form name="device" method="post" action="userlist">
					 <thead>
					 <tr>
					 <th>#</th>
					<th>대여장비</th>
					<th>방문날짜</th>
					</tr>
					</thead>
					<tbody>
					<tr>
					<td></td>
					<td>14Z970-GA5BML</td>
						<td>
					<select class="btn btn-secondary"  name="visit_date">
							<option class="btn btn-light" value=${calendar[0] }
								${ visit_date == calendar[0] ? "selected" : "" }>${selectDate[0]}</option>
							<option class="btn btn-light" value=${calendar[1] }
								${ visit_date == calendar[1] ? "selected" : "" }>${selectDate[1]}</option>
							<option class="btn btn-light"  value=${calendar[2] }
								${ visit_date == calendar[2] ? "selected" : "" }>${selectDate[2]}</option>
							<option class="btn btn-light" value=${calendar[3] }
								${ visit_date == calendar[3] ? "selected" : "" }>${selectDate[3]}</option>
							<option class="btn btn-light" value=${calendar[4] }
								${ visit_date == calendar[4] ? "selected" : "" }>${selectDate[4]}</option>
					</select>
					</td>
				
				</tr>
	</tbody>
			  </table>
			  <input type="hidden" name="device_code"
						value="COM00002" />
						<input type="hidden" name="lend_type"
						value="1" />
      </div>
      <div class="modal-footer">
       <button class="btn btn-secondary" data-bs-target="#exampleModalToggle" data-bs-toggle="modal" data-bs-dismiss="modal">뒤로가기</button>
     <button type="submit" class="btn btn-primary"  data-confirm>예약신청완료</button>	
      </form>
    
      </div>
    </div>
  </div>
</div>
				</td>
				
				
				
				
      <!-- LG 15Z970 -->
				
				<td>
					<div class="card" style="width: 18rem;" style="height: 18rem;">
						<img src="/media/device/lg.jpg" class="card-img-top" alt="lg그램"
							data-bs-toggle="modal" href="#exampleModalToggle5">
						<div class="card-body">
							<h5 class="card-title">LG 15Z970</h5>
						</div>
					</div>
				</td>
				<td>
<div class="modal fade" id="exampleModalToggle5" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
  <div class="modal-dialog modal-xl">
    <div class="modal-content">
    <div class="modal-header">
									<h3 class="modal-title" id="exampleModalLabel">
										세부정보
										</h3>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
								</div>
								
								<table class="m">
								<tr>
								<td>
								
								
								<div class="modal-body">
									<table class="select_img">
										<tr>
											<td colspan="2">
											<div id="carouselExampleDark" class="carousel carousel-dark slide" data-bs-ride="carousel">
										  <div class="carousel-indicators">
										    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
										    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="1" aria-label="Slide 2"></button>
										    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="2" aria-label="Slide 3"></button>
										  </div>
										  <div class="carousel-inner">
										    <div class="carousel-item active" data-bs-interval="3000">
										      <img src="/media/device/lg.jpg" class="d-block w-100" alt="...">
										    </div>
										    <div class="carousel-item" data-bs-interval="3000">
										      <img src="/media/device/lg_up.jpg" class="d-block w-100" alt="...">
										    </div>
										    <div class="carousel-item" data-bs-interval="3000">
										      <img src="/media/device/lg_down.jpg" class="d-block w-100" alt="...">
										    </div>
										  </div>
										  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="prev">
										    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
										    <span class="visually-hidden">Previous</span>
										  </button>
										  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="next">
										    <span class="carousel-control-next-icon" aria-hidden="true"></span>
										    <span class="visually-hidden">Next</span>
										  </button>
										</div>
											</td>
										</tr>
										</table>
										
										</td>
										<td>
										
									<table class="t">
										<tr>
											<th>모델명</th>
											<td>LG 15Z970</td>
										</tr>
										<tr>
											<th>화면크기</th>
											<td>39.62(15.6인치)</td>
										</tr>
										<tr>
											<th>CPU 종류</th>
											<td>코어i5-7세대</td>
										</tr>
										<tr>
											<th>CPU 넘버</th>
											<td>i5-7200U (2.5GHz)</td>
										</tr>
										<tr>
											<th>운영체제(OS)</th>
											<td>윈도우10</td>
										</tr>
										<tr>
											<th>메모리 용량</th>
											<td>8GB</td>
										</tr>
										<tr>
											<th class="lineless">SSD</th>
											<td class="lineless">256GB</td>
										</tr>
									</table>
								</div>
								
								</td>
								</tr>
								</table>
								
      <div class="modal-footer">
        <button class="btn btn-primary" data-bs-target="#exampleModalToggle6" data-bs-toggle="modal" data-bs-dismiss="modal">예약신청</button>
      </div>
    </div>
  </div>
</div>
<div class="modal fade" id="exampleModalToggle6" aria-hidden="true" aria-labelledby="exampleModalToggleLabel2" tabindex="-1">
  <div class="modal-dialog modal-lg modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalToggleLabel2">예약신청</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      
        <table class="table">
	
       <form name="device" method="post" action="userlist">
					 <thead>
					 <tr>
					 <th>#</th>
					<th>대여장비</th>
					<th>방문날짜</th>
					</tr>
					</thead>
					<tbody>
					<tr>
					<td></td>
					<td>LG 15Z970</td>
						<td>
					<select class="btn btn-secondary"  name="visit_date">
							<option class="btn btn-light" value=${calendar[0] }
								${ visit_date == calendar[0] ? "selected" : "" }>${selectDate[0]}</option>
							<option class="btn btn-light" value=${calendar[1] }
								${ visit_date == calendar[1] ? "selected" : "" }>${selectDate[1]}</option>
							<option class="btn btn-light"  value=${calendar[2] }
								${ visit_date == calendar[2] ? "selected" : "" }>${selectDate[2]}</option>
							<option class="btn btn-light" value=${calendar[3] }
								${ visit_date == calendar[3] ? "selected" : "" }>${selectDate[3]}</option>
							<option class="btn btn-light" value=${calendar[4] }
								${ visit_date == calendar[4] ? "selected" : "" }>${selectDate[4]}</option>
					</select>
					</td>
				
				</tr>
	</tbody>
			  </table>
			  <input type="hidden" name="device_code"
						value="COM00003" />
						<input type="hidden" name="lend_type"
						value="1" />
      </div>
      <div class="modal-footer">
      <table>
      <tr>
      <td>
       <button class="btn btn-secondary" data-bs-target="#exampleModalToggle" data-bs-toggle="modal" data-bs-dismiss="modal">뒤로가기</button>
      </td>
      <td>	<td><button type="submit" class="btn btn-primary"  data-confirm>예약신청완료</button>	</td>
      </form>
      
      
      
      
      </tr>
      </table>
     	
      </div>
    </div>
  </div>
</div>
</td>			
	</tr><tr>		
			 <!-- LG 14Z950-GT5BL -->
						
				<td>
					<div class="card" style="width: 18rem;" style="height: 18rem;">
						<img src="/media/device/14Z950-GT5BL.jpg" class="card-img-top" alt="lg그램"
							data-bs-toggle="modal" href="#exampleModalToggle7">
						<div class="card-body">
							<h5 class="card-title">LG 14Z950-GT5BL</h5>
						
						</div>
					</div>
				</td>
				<td>
<div class="modal fade" id="exampleModalToggle7" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
  <div class="modal-dialog modal-xl">
    <div class="modal-content">
    <div class="modal-header">
									<h3 class="modal-title" id="exampleModalLabel">
										세부정보
										</h3>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
								</div>
								
								<table class="m">
								<tr>
								<td>
								
								
								<div class="modal-body">
									<table class="select_img">
										<tr>
											<td colspan="2">
											<div id="carouselExampleDark" class="carousel carousel-dark slide" data-bs-ride="carousel">
										  <div class="carousel-indicators">
										    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
										    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="1" aria-label="Slide 2"></button>
										    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="2" aria-label="Slide 3"></button>
										  </div>
										  <div class="carousel-inner">
										    <div class="carousel-item active" data-bs-interval="3000">
										      <img src="/media/device/14Z950-GT5BL.jpg" class="d-block w-100" alt="...">
										    </div>
										    <div class="carousel-item" data-bs-interval="3000">
										      <img src="/media/device/14Z950-GT5BL_up.jpg" class="d-block w-100" alt="...">
										    </div>
										    <div class="carousel-item" data-bs-interval="3000">
										      <img src="/media/device/14Z950-GT5BL_side.png" class="d-block w-100" alt="...">
										    </div>
										  </div>
										  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="prev">
										    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
										    <span class="visually-hidden">Previous</span>
										  </button>
										  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="next">
										    <span class="carousel-control-next-icon" aria-hidden="true"></span>
										    <span class="visually-hidden">Next</span>
										  </button>
										</div>
											</td>
										</tr>
										</table>
										
										</td>
										<td>
									<table class="t">
										<tr>
											<th>모델명</th>
											<td>LG 14Z950-GT5BL</td>
										</tr>
										<tr>
											<th>화면크기</th>
											<td>35.56(14인치)</td>
										</tr>
										<tr>
											<th>CPU 종류</th>
											<td>코어i5-5세대</td>
										</tr>
										<tr>
											<th>CPU 넘버</th>
											<td>i5-5200U (2.2GHz)</td>
										</tr>
										<tr>
											<th>운영체제(OS)</th>
											<td>윈도우8.1</td>
										</tr>
										<tr>
											<th>메모리 용량</th>
											<td>4GB</td>
										</tr>
										<tr>
											<th class="lineless">SSD</th>
											<td class="lineless">128GB</td>
										</tr>
									</table>
								</div>
								</td>
								</tr>
								</table>
      <div class="modal-footer">
        <button class="btn btn-primary" data-bs-target="#exampleModalToggle8" data-bs-toggle="modal" data-bs-dismiss="modal">예약신청</button>
      </div>
    </div>
  </div>
</div>
<div class="modal fade" id="exampleModalToggle8" aria-hidden="true" aria-labelledby="exampleModalToggleLabel2" tabindex="-1">
  <div class="modal-dialog modal-lg modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalToggleLabel2">예약신청</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
       <table class="table">
	
       <form name="device" method="post" action="userlist">
					 <thead>
					 <tr>
					 <th>#</th>
					<th>대여장비</th>
					<th>방문날짜</th>
					</tr>
					</thead>
					<tbody>
					<tr>
					<td></td>
					<td>LG 14Z950-GT5BL</td>
						<td>
					<select class="btn btn-secondary"  name="visit_date">
							<option class="btn btn-light" value=${calendar[0] }
								${ visit_date == calendar[0] ? "selected" : "" }>${selectDate[0]}</option>
							<option class="btn btn-light" value=${calendar[1] }
								${ visit_date == calendar[1] ? "selected" : "" }>${selectDate[1]}</option>
							<option class="btn btn-light"  value=${calendar[2] }
								${ visit_date == calendar[2] ? "selected" : "" }>${selectDate[2]}</option>
							<option class="btn btn-light" value=${calendar[3] }
								${ visit_date == calendar[3] ? "selected" : "" }>${selectDate[3]}</option>
							<option class="btn btn-light" value=${calendar[4] }
								${ visit_date == calendar[4] ? "selected" : "" }>${selectDate[4]}</option>
					</select>
					</td>
			
				</tr>
	</tbody>
			  </table>
			  <input type="hidden" name="device_code"
						value="COM00004" />
						<input type="hidden" name="lend_type"
						value="1" />
      </div>
      <div class="modal-footer">
      <table>
      <tr>
      <td>
       <button class="btn btn-secondary" data-bs-target="#exampleModalToggle" data-bs-toggle="modal" data-bs-dismiss="modal">뒤로가기</button>
      </td>
      <td>	<td><button type="submit" class="btn btn-primary"  data-confirm>예약신청완료</button>	</td>
      </form>
         
      </tr>
      </table>
     	
      </div>
    </div>
  </div>
</div>
</td>					
      
       <!-- LG 14Z950-GT5BL -->
    
				<td>
					<div class="card" style="width: 18rem;" style="height: 18rem;">
						<img src="/media/device/14Z950-GT5BL.jpg" class="card-img-top" alt="lg그램"
							data-bs-toggle="modal" href="#exampleModalToggle9">
						<div class="card-body">
							<h5 class="card-title">LG 13Z950</h5>
						
						</div>
					</div>
				</td>
				<td>
<div class="modal fade" id="exampleModalToggle9" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
  <div class="modal-dialog modal-xl">
    <div class="modal-content">
    <div class="modal-header">
									<h3 class="modal-title" id="exampleModalLabel">
										세부정보
										</h3>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
								</div>
								
								<table class="m">
								<tr>
								<td>
								
								<div class="modal-body">
									<table class="select_img">
										<tr>
											<td colspan="2">
											<div id="carouselExampleDark" class="carousel carousel-dark slide" data-bs-ride="carousel">
										  <div class="carousel-indicators">
										    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
										    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="1" aria-label="Slide 2"></button>
										    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="2" aria-label="Slide 3"></button>
										  </div>
										  <div class="carousel-inner">
										    <div class="carousel-item active" data-bs-interval="3000">
										      <img src="/media/device/14Z950-GT5BL.jpg" class="d-block w-100" alt="...">
										    </div>
										    <div class="carousel-item" data-bs-interval="3000">
										      <img src="/media/device/14Z950-GT5BL_up.jpg" class="d-block w-100" alt="...">
										    </div>
										    <div class="carousel-item" data-bs-interval="3000">
										      <img src="/media/device/14Z950-GT5BL_side.png" class="d-block w-100" alt="...">
										    </div>
										  </div>
										  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="prev">
										    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
										    <span class="visually-hidden">Previous</span>
										  </button>
										  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="next">
										    <span class="carousel-control-next-icon" aria-hidden="true"></span>
										    <span class="visually-hidden">Next</span>
										  </button>
										</div>
											</td>
										</tr>
										</table>
										
										</td>
										<td>
										
									<table class="t">
										<tr>
											<th>모델명</th>
											<td>LG 13Z950</td>
										</tr>
										<tr>
											<th>화면크기</th>
											<td>33.78(13.3인치)</td>
										</tr>
										<tr>
											<th>CPU 종류</th>
											<td>펜티엄</td>
										</tr>
										<tr>
											<th>CPU 넘버</th>
											<td>3805U (1.9GHz)</td>
										</tr>
										<tr>
											<th>운영체제(OS)</th>
											<td>윈도우10</td>
										</tr>
										<tr>
											<th>메모리 용량</th>
											<td>4GB</td>
										</tr>
										<tr>
											<th class="lineless">SSD</th>
											<td class="lineless">128GB</td>
										</tr>
									</table>
								</div>
								</td>
								</tr>
								</table>
								
      <div class="modal-footer">
        <button class="btn btn-primary" data-bs-target="#exampleModalToggle10" data-bs-toggle="modal" data-bs-dismiss="modal">예약신청</button>
      </div>
    </div>
  </div>
</div>
<div class="modal fade" id="exampleModalToggle10" aria-hidden="true" aria-labelledby="exampleModalToggleLabel2" tabindex="-1">
  <div class="modal-dialog modal-lg modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalToggleLabel2">예약신청</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      
        <table class="table">
	
       <form name="device" method="post" action="userlist">
					 <thead>
					 <tr>
					 <th>#</th>
					<th>대여장비</th>
					<th>방문날짜</th>
					</tr>
					</thead>
					<tbody>
					<tr>
					<td></td>
					<td>LG 13Z950</td>
						<td>
					<select class="btn btn-secondary"  name="visit_date">
							<option class="btn btn-light" value=${calendar[0] }
								${ visit_date == calendar[0] ? "selected" : "" }>${selectDate[0]}</option>
							<option class="btn btn-light" value=${calendar[1] }
								${ visit_date == calendar[1] ? "selected" : "" }>${selectDate[1]}</option>
							<option class="btn btn-light"  value=${calendar[2] }
								${ visit_date == calendar[2] ? "selected" : "" }>${selectDate[2]}</option>
							<option class="btn btn-light" value=${calendar[3] }
								${ visit_date == calendar[3] ? "selected" : "" }>${selectDate[3]}</option>
							<option class="btn btn-light" value=${calendar[4] }
								${ visit_date == calendar[4] ? "selected" : "" }>${selectDate[4]}</option>
					</select>
					</td>
				
				</tr>
	</tbody>
			  </table>
			  <input type="hidden" name="device_code"
						value="COM00005" />
						<input type="hidden" name="lend_type"
						value="1" />
      </div>
      <div class="modal-footer">
      <table>
      <tr>
      <td>
       <button class="btn btn-secondary" data-bs-target="#exampleModalToggle" data-bs-toggle="modal" data-bs-dismiss="modal">뒤로가기</button>
      </td>
      <td>	<td><button type="submit" class="btn btn-primary"  data-confirm>예약신청완료</button>	</td>
      </form>
      
      
      </tr>
      </table>
     	
      </div>
    </div>
  </div>
</div>
</td>			
			</tr>
			
		</table>
	</div>
</body>
</html>


