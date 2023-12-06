<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<section>
<input type="hidden" class="questionmember" name="questionmember" value="${member.id }">
<form action='/room/questionWrite' method="POST">
	
	<div class="questionWriteWrap">
		<div class="questionWriteTitle">
			<span>글 올리기</span>
		</div>
			<div class="questionWrite_title">
				<span class="span"> TITLE </span> 
				<input type="text" class="questiontitle" name="questiontitle">
			</div>
			
			<div class="questionWrite_member">${question.questionmember}</div>
			<div class="questionWrite_date">
				<div><fmt:formatDate value="${question.questiondate}" pattern="yyyy/MM/dd"></fmt:formatDate></div>
				
			</div>
			
			<div class="questionWrite_content">
				<span class="span">내용</span>
				<textarea class="content" name="content"></textarea>
			</div>
		

  <div class="questionWriteButtons">
	<button type="button" class="questionbutton" onclick="QuestionWrite()">등록하기</button>
	<button type="button" id="resetbutton" onclick="resetActionQS()">취소</button>
  </div>	
</div>
	
	</form>
	<div class="clear"></div>
</section>


</body>
</html>