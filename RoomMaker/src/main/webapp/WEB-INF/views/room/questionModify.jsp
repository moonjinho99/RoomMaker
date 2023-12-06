<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<section>
<form action='/room/questionModify' method="GET">

<div id="questionModifyWrap">
	<input type="hidden" class="loginId" value="${member.id}">
	<input type="hidden" class="roomId" value="${roomModify.id}">
	<input type="hidden" class="uploadId" value="${question.questionmember}">
	
	<div class="questionModifyTitle">
	
		<span>자료 디테일</span>
	</div>
		<div class="questionModify_title">
			<span> no. ${question.questioncode} </span> <input type="text" class="questionModify_title_sec" name="questiontitle" value="${question.questiontitle}">
		</div>
		<div class="questionModify_member">${question.questionmember}</div>
		<div class="questionModify_date">
			<div> <fmt:formatDate value="${question.questiondate}" pattern="yyyy/MM/dd"></fmt:formatDate>
			</div>
		</div>
		<div class="questionModify_questionName">${question.answermember}</div>
		<div class="questionModify_content"><textarea class="modifycontent">${question.content}</textarea></div>
		<div class="buttons">
			<input type="button" id="resetbutton" onclick="resetActionQuestion(${question.questioncode})" value="취소">
			<input type="button" id="modifybutton" onclick="modifyActionQS(${question.questioncode})" value="수정">
		</div>
</div>
	


</form>
</section>

</body>
</html>