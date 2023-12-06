<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Question Answer Window</title>
<style>
body{
position: absolute; 
top: 30%; 
left: 35%; 
margin: -25px 0 0 -25px;
}

input[type=button]{
    width: 50px;
	height: 30px;
	border: 2px solid black;
	background-color: skyblue;
	color: black;
	font-weight: bold;
	border-radius: 7px;
	margin-left: 15px;
}

input[type=button]:hover{
    background-color: white;
	color: skyblue;
	border: 2px solid skyblue;
}

.answer{
width: 300px;
height: 100px;
resize: none;
}

.answerwindow_buttons{
margin-left: 80px;
}


</style>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<body>
<input type="hidden" class="questioncode" name="questioncode" value="${questioncode}">
<input type="hidden" class="roomcode" name="roomcode" value="${roomcode }">
<div class="questionAnswerWindowWrap">
<h2>답변 등록</h2>
<textarea name="answer" class="answer" placeholder="답변을 작성해주세요"></textarea>
<div class="answerwindow_buttons">
<input type="button" onclick="downWindow()" value="취소">
<input type="button" onclick="answerEnrollAction()" value="등록">
</div>
</div>
<script>
function downWindow(){
	window.close();
}

function answerEnrollAction(){
	const queryString = window.location.search;
    const urlParams = new URLSearchParams(queryString);
    
	var answer = $('.answer').val();
	var questioncode = urlParams.get('questioncode');
	var roomcode = urlParams.get('roomcode');
	var answermember = urlParams.get('answermember');
	
	console.log('Question Code:', questioncode);
	console.log('Room Code:', roomcode);
	console.log('member:',answermember);
	
	if(answer===""){
		alert("");
	}
	
	$.ajax({
		type : 'POST',
		url : '/room/questionAnswerWindow',
		data : {
			answer : answer,
			questioncode : questioncode,
			answermember : answermember,
			roomcode : roomcode
		},
		success : function(data) {
			alert("답변 등록 완성");
			 if (opener && !opener.closed) {
	                opener.questionDetail(questioncode); //questionDetail 창 reload 
	            }
			window.close();
		},
		error : function(xhr, status, error) {
			console.error("에러 발생:", error);
		}
	});
	
}
</script>
</body>
</html>

