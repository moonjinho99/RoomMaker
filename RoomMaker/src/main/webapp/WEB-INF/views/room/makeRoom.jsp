<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>방 생성</h1>

<form action="/room/makeRoom" method="post">
<table>
	<tr>
		<td>방 제목</td>
		<td><input type="text" name="title"></td>
	<tr>
	<tr>
		<td>암호</td>
		<td><input type="text" name="roompw"></td>
	<tr>
	<tr>
		<td>방 인원수</td>
		<td><input type="text" name="member_cnt"></td>
	<tr>
	<tr>
		<td><input type="file"></td>
		<td><img></td>
	<tr>
	<tr>
		<td>설명</td>
		<td><textarea rows="15" cols="40" name="explanation"></textarea></td>
	<tr>
	
	<tr>
		<td>방 종류</td>
		<td><input type="radio" name="type" value=0>교육기관
			<input type="radio" name="type" value=1>프로젝트
		</td>
	</tr>
</table>
<input type="hidden" name="id" value="테스트아이디">
<input type="submit" value="방생성">
</form>
</body>
</html>