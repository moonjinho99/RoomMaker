<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div style="text-align: center;">
	<h2 style="text-align: center;">방 암호를 입력해주세요</h2>
	<input type="text" id="roomPw" name="inputpw">
	<input type="button" value="확인" onclick="checkPw()">
	<input type="hidden" value="${roomDetail.roomcode}" name="roomcode">
	<input type="hidden" value="${roomDetail.roompw}" name="roompw">
</div>
</body>

<script>

function checkPw()
{
	
	var roomcode = document.getElementsByName("roomcode")[0].value;
	var roompw = document.getElementsByName("roompw")[0].value;
	var inputpw = document.getElementsByName("inputpw")[0].value;
	if(roompw == inputpw)
	{
		opener.location.href='/room/roomDetail?roomcode='+roomcode; 
		window.close();
	}
	else{
		alert("암호가 일치하지 않습니다.");
	}
}

</script>
</html>