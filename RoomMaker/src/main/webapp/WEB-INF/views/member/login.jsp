<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RoomMaker login</title>
<link rel="stylesheet" href="../resources/css/member/login.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
</head>
<body>
	<div id="login_wrap">
		<div class="login_logo">
			<a href="#"><img src="../resources/images/logo.png"></a>
		</div>
		<div class="login_content">
			<form id="login_form" method="post">
				<div class="login_div">
					<input name="id" type="text" placeholder="아이디">
					<input name="pw" type="password" placeholder="패스워드">
				</div>
					<input class="login_button" type="button" value="LOGIN">
				<div class="a_div">
					<a href="#">아이디 찾기</a>
					<a href="#">비밀번호 찾기</a>
					<a href="/member/join">회원가입</a>
				</div>
				<c:if test = "${result == 0 }">
                <div class = "login_warn">ID 또는 비밀번호를 잘못 입력하셨습니다.</div>
            	</c:if>
			</form>
		</div>

	</div>

	<script>
		$(".login_button").click(function() {
			//alert("로그인 버튼 작동");
			$("#login_form").attr("action", "/member/login");
			$("#login_form").submit();
		});
	</script>
</body>
</html>