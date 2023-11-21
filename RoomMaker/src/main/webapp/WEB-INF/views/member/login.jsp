<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
</head>
<body>
	<h1>로그인</h1>
	<form id="login_form" method="post">
		<label>아이디</label> 
		<input type="text" id="loginId" name="id"> 
		<label>비밀번호</label>
		<input type="password" id="loginPw" name="pw"> 
		<input class="login_button" type="button" value="login">
		<c:if test = "${result == 0 }">
                <div class = "login_warn">사용자 ID 또는 비밀번호를 잘못 입력하셨습니다.</div>
            </c:if>
	</form>
	<script>
		$(".login_button").click(function() {
			//alert("로그인 버튼 작동");
	        $("#login_form").attr("action", "/member/login");
	        $("#login_form").submit();
		});
		
	</script>
</body>
</html>