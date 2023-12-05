<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
<body>
<a href="/room/questionWrite">게시판 등록</a>

<form action='/room/questionWrite' method="POST">
	
	<div class="form-group">
		<label for="exampleFormControllInput1">제목</label>
		<input type="text" class="form-control questiontitle" id="exampleFormControlInput1" name="questiontitle" placeholder="제목을 작성해주세요.">
	</div>
	
	
	<input type="hidden" class="form-control questionmember" id="exampleFormControllInput1" name="questionmember" value="${member.id}">


	<div class="form-group">
		<label for="exampleFormControllInput1">내용</label>
		<textarea class="form-control content" id="exampleFormControlTextarea1" name="content" rows="10"></textarea>
	</div>
	
	<button type="button" class="btn btn-info" onclick="QuestionWrite()">등록하기</button>
	<button type="button" class="btn btn-secondary">목록으로</button>
	
	</form>


</body>
</html>