<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>암호 체크</title>
<style>

</style>


</head>
<body>
<div style=" position: absolute; top: 30%; left: 35%; margin: -25px 0 0 -25px; ">
	<h2 style="text-align: center;">방 암호를 입력해주세요</h2>
	<input type="password" id="roomPw" name="inputpw" style="height: 28px; padding-top: 5px;" >
	<input type="button" value="확인" onclick="checkPw()"  class ="checkbtn"  style="background: skyblue; color:white; font-size: 20px;">
	<input type="hidden" value="${roomDetail.roomcode}" name="roomcode">
	<input type="hidden" value="${roomDetail.roompw}" name="roompw">
	<input type="hidden" value="${member.id}" name="id">
</div>
</body>

<script>

function checkPw()
{
	var roomcode = document.getElementsByName("roomcode")[0].value;
	var roompw = document.getElementsByName("roompw")[0].value;
	var inputpw = document.getElementsByName("inputpw")[0].value;
	var id = document.getElementsByName("id")[0].value;
	if(roompw == inputpw)
	{
		//opener.location.href='/room/roomDetail?roomcode='+roomcode; 
		opener.location.href='/room/roomMemberIn?id='+id+'&roomcode='+roomcode;
		window.close();
	}
	else{
		alert("암호가 일치하지 않습니다.");
	}
}

</script>
</html>