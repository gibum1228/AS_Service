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
    <title>학생 권한 관리 페이지</title>
    <link rel="icon" href="/media/mark_SKHU.png">
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
            height: 600px;
            padding-top: 150px;
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
    <script>
        $(document).ready(function () {

            $('#exampleModal').on('show.bs.modal', function (event) {
                $(".modal-body #snum").val($(event.relatedTarget).data('snum'));
                $(".modal-body #name").val($(event.relatedTarget).data('name'));
                $(".modal-body #email").val($(event.relatedTarget).data('email'));
                $(".modal-body #role").val($(event.relatedTarget).data('role'));
            });
        });

        function addArr(sss){
            var addArr = []
            
            console.log(typeof sss)
            console.log(sss.length)
            console.log(sss)
        }
    </script>
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
            <h1>학생 관리자 관리</h1>
        </div>
        <div class="list_middle">
            <table class="middle">
                <tr></tr>
                <tr>
                    <td>
                        <form>
                        <div class="input-group mb-3">
                            <button class="btn btn-outline-secondary dropdown-toggle" type="button"
                                data-bs-toggle="dropdown" aria-expanded="false">${ select }</button>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="/superadmin/organization?select=학번&search=">학번</a></li>
                                <li><a class="dropdown-item" href="/superadmin/organization?select=이름&search=">이름</a></li>
                            </ul>
                            <input type="hidden" name="select" value="${ select }">
                            <input type="text" name="search" value="${ search }" placeholder="학번 또는 이름을 입력해주세요."
                                class="form-control" aria-label="Recipient's username" aria-describedby="button-addon2">
                            <button class="btn btn-outline-secondary" type="submit" id="button-addon2">조회</button>
                        </div>
                        </form>
                    </td>
                </tr>
            </table>
        </div>
        <div class="list_bottom" id="app">
            <table class="table list">
                <thead>
                    <tr>
                        <td>학번(ID)</td>
                        <td>이름</td>
                        <td>이메일</td>
                        <td>전화번호</td>
                        <td>제1전공</td>
                        <td>제2전공</td>
                        <td>가입 날짜</td>
                        <td>권한</td>
                        <td>이메일 인증 여부</td>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="s" items="${ students }">
                        <tr data-bs-toggle="modal" data-bs-target="#exampleModal" 
                        data-snum="${ s.snum }" data-name="${ s.name }" data-role="${ s.role_id }">
                            <td>${ s.snum }</td>
                            <td>${ s.name }</td>
                            <td>${ s.email }</td>
                            <td>${ s.phone }</td>
                            <td>{{ major_list[${ s.first_major_id }] }}</td>
                            <td>{{ major_list[${ s.sec_major_id }] }}</td>
                            <td><fmt:formatDate pattern="yyyy-MM-dd" value="${ s.signup_date }" /></td>
                            <td>{{ role_name_list[${ s.role_id }] }}</td>
                            <td>${ s.access == 1 ? "인증O" : "인증X" }</td>
                        </tr>
                    </c:forEach>
                </tbody>
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
                                        <td>학번</td>
                                        <td><input type="text" id="snum" name="snum" readonly></td>
                                    </tr>
                                    <tr>
                                        <td>학생명</td>
                                        <td><input type="text" id="name" name="name" readonly></td>
                                    </tr>
                                    <tr>
                                        <td>권한</td>
                                        <td>
                                            <select name="role" id="role">
                                                <option value="1">유저</option>
                                                <option value="2">학생</option>
                                                <option value="5">교직원</option>
                                                <option value="10">교수</option>
                                                <option value="90">학생 관리자</option>
                                            </select>
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
                    role_name_list: {
                        1: "유저",
                        2: "학생",
                        5: "교직원",
                        10: "교수",
                        90: "학생 관리자",
                        95: "직원 관리자",
                        99: "총관리자"
                    }
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