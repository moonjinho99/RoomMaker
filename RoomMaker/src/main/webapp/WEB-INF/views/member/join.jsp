<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RoomMaker join</title>
<link rel="stylesheet" href="../resources/css/member/login.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
</head>
<body>
	<div id="join_wrap">
		<div class="join_logo">
			<a href="#"><img src="../resources/images/logo.png"></a>
		</div>
		<div class="join_content">
			<form id="join_form" method="post">
				<div class="join_div">
				<input type="text" id="joinId" name="id" placeholder="아이디">
				<input type="password" id="joinPw" name="pw" placeholder="패스워드">
				<input type="password" id="joinPwCheck" placeholder="패스워드 확인">
				</div>
				<div class="private_div">
				<input type="text" id="joinName" name="name" placeholder="이름">
				<input type="text" id="joinPhone" name="phonenum" placeholder="전화번호">
				<input type="text" id="joinEmail" name="email" placeholder="이메일">
				<select name="gender">
				<option value="0">남</option>
				<option value="0">여</option>
				</select>
				<input type="hidden" name="memberlevel" value="0">
				</div>
				<input type="button" class="join_button" value="JOIN">
			</form>
		</div>
	</div>
</body>
</html>