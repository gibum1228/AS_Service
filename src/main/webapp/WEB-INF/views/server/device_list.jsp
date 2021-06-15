<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>장비 관리 페이지</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/lend.css">
    <link rel="stylesheet" href="/css/main.css">
    <script src="/js/main.js"></script>
    <script src="/js/lend.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js"
        integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT" crossorigin="anonymous">
    </script>
    <script src="https://cdn.jsdelivr.net/npm/vue@2.6.0"></script>
    <style>
        .modal-content {
            width: 1000px;
            height: 700px;
            margin: 0 auto;
        }
        .modal-header {
            text-align: center;
            width: 100%;
            height: 5em;
        }
        .modal-body {
            margin: 0 auto;
            height: 350px;
            font-size: 30px;
        }
        .modal-body table {
            border-collapse: collapse;
            margin: 0 auto;
        }
        .modal-body td {
            border: 1px solid black;
            width: 200px;
            height: 80px;
            text-align: center;
        }
        .modal-body td:nth-child(1) {
            background-color: #bbb;
        }
        .modal-footer {
            position: absolute;
            bottom: 0;
            width: 100%;
        }
        .modal-body input {
            width: 100%;
            height: 80%;
            border: none;
        }
        .modal-body input:focus, select:focus {
            outline: none;
        }
        .modal-body select {
            width: 100%;
            height: 100%;
            border: none;
        }
    </style>
</head>

<body>
    <div id="navBar">
        <a href="/index" id="homeImg"><img src="/media/mark_SKHU.png" alt="MAIN" width="100%" height="100%"></a>
        <a href="">공지사항</a>
        <a href="">장비 예약</a> <a href="">장비 목록</a>
        <a href="">문의하기</a>
        <sec:authorize access="authenticated">
            <a class="btn" style="float: right;" href="/logout_processing">로그아웃</a>
        </sec:authorize>
        <a href="/user/mypages" style="float: right;">마이페이지</a>
    </div>
    <div class="header" style="box-shadow: 0px 1px 20px gray;">
        <div class="headerBtn" style="float: left; width: 350px;" onclick="location.href='/index'">
            <img src="/media/logo_mark_mr_sin.jpg" alt="logo_AS" width="100%" height="100%">
        </div>
        <a class="headerBtn" href="/logout_processing">로그아웃</a>
        <a class="headerBtn" href="/user/mypages">마이페이지</a>
        <a class="headerBtn" href="">문의하기</a>
        <a class="headerBtn" href="">예약하기</a>
        <a class="headerBtn" href="">공지사항</a>
    </div>
    <div style="width: 100%;">
        <div class="list_top">
            <h1>장비 관리</h1>
        </div>
        <div class="list_middle">
            <table class="middle">
                <tr>
                    <ul class="nav nav-pills nav-tabs nav-fill">
                        <li class="nav-item">
                            <a class="nav-link" data-bs-toggle="modal" data-bs-target="#exampleModal">추가</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active " aria-current="page" href="deviceList">목록</a>
                        </li>
                    </ul>
                </tr>
                <tr></tr>
                <tr>
                    <td>
                        <form>
                        <div class="input-group mb-3">
                            <button class="btn btn-outline-secondary dropdown-toggle" type="button"
                                data-bs-toggle="dropdown" aria-expanded="false">${ select }</button>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="/server/deviceList?select=장비명&search=${ search }">장비명</a></li>
                                <li><a class="dropdown-item" href="/server/deviceList?select=전공명&search=${ search }">전공명</a></li>
                            </ul>
                            <input type="hidden" name="select" value="${ select }">
                            <input type="text" name="search" value="${ search }" placeholder="검색어를 입력해주세요"
                                class="form-control" aria-label="Recipient's username" aria-describedby="button-addon2">
                            <button class="btn btn-outline-secondary" type="submit" id="button-addon2">조회</button>
                        </div>
                        </form>
                    </td>
                </tr>
            </table>
            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered modal-xl">
                    <div class="modal-content">
                        <form method="post">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">장비 추가</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <table>
                                    <tr>
                                        <td>코드명</td>
                                        <td><input type="text" name="code" required></td>
                                    </tr>
                                    <tr>
                                        <td>모델명</td>
                                        <td><input type="text" name="name" required></td>
                                    </tr>
                                    <tr>
                                        <td>장비 타입</td>
                                        <td>
                                            <select name="type" required>
                                                <option value="1">노트북</option>
                                                <option value="2">태블릿</option>
                                                <option value="3">카메라</option>
                                                <option value="4">삼각대</option>
                                                <option value="5">빔 프로젝터</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>구매년월</td>
                                        <td><input type="date" name="buy_date" required></td>
                                    </tr>
                                    <tr>
                                        <td>소속 전공</td>
                                        <td>
                                            <select name="major_id" required>
                                            <option value="1">IT융합자율학부</option>
                                            <option value="2">미디어콘텐츠융합자율학부<option>
                                            <option value="3">인문융합자율학부</option>
                                            <option value="4">사회융합자율학부</option>
                                            <option value="5">컴퓨터공학전공</option>
                                            <option value="6">소프트웨어공학전공</option>
                                            <option value="7">정보통신공학전공</option>
                                            <option value="8">글로컬IT전공</option>
                                            <option value="9">디지털콘텐츠전공</option>
                                            <option value="10">신문방송학전공</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>상세 번호</td>
                                        <td>
                                            <input type="number" name="no" required>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="modal-footer">
                                <button type="submit" class="btn btn-primary">추가</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="list_bottom" id="app">
            <table class="table list">
                <thead>
                    <tr>
                        <td>코드명</td>
                        <td>모델명</td>
                        <td>타입</td>
                        <td>구매년월</td>
                        <td>소속 전공</td>
                        <td>No.</td>
                        <td>장비 상태</td>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="device" items="${ devices }">
                        <tr data-url>
                            <td>${ device.code }</td>
                            <td>${ device.name }</td>
                            <td>{{ device_type[${ device.type }] }}</td>
                            <td><fmt:formatDate pattern="yyyy-MM-dd" value="${ device.buy_date }" /></td>
                            <td>{{ major_list[${ device.major_id }] }}</td>
                            <td>${ device.detail_no }</td>
                            <td>{{ detail_state[${ device.state}] }}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous">
        </script>
        <script>
            var app = new Vue({
                el: "#app",
                data: {
                    major_list: [
                        "학생", "IT융합자율학부", "미디어콘텐츠융합자율학부", "인문융합자율학부", "사회융합자율학부", "컴퓨터공학전공",
                        "소프트웨어공학전공", "정보통신공학전공", "글로컬IT전공", "디지털콘텐츠전공", "신문방송학전공"
                    ],
                    device_type: [
                        "NONE", "노트북", "태블릿", "카메라", "삼각대", "빔 프로젝터"
                    ],
                    detail_state: [
                        "대여중", "대여 가능", "예약중"
                    ]
                }
            })
        </script>
    </div>
    <div class="footer">
		<p>
			<br>전화번호: 02-2610-4201
			<br>주소: 서울특별시 구로구 오류2동 연동로 320 (성공회대학교), 월당관 1층
			<br>근무시간: 9:00 AM ~ 5:00 PM
			<br>점심시간: 12:00 PM ~ 1:00 PM<br>
			<br>&copy; 2021 skhu4201.com
		</p>
	</div>
</body>

</html>