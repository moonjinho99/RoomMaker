<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
질문상세
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
  
 <link rel="stylesheet" href="../resources/css/room/roomHeader.css" />
<link rel="stylesheet" href="../resources/css/room/roomAside.css" />
<link rel="stylesheet" href="../resources/css/room/roomFooter.css" />
</head>
<body>
<h1>질문 게시판 상세보기</h1>
	


	<section>
<form action="/room/questionDetail" method="get">

<div class="input_wrap">
      <label>게시판 번호</label>
      <div> ${questionDetail.questioncode} </div>
   </div>
   <div class="input_wrap">
      <label>게시판 제목</label>
      <div> ${questionDetail.questiontitle} </div>
   </div>
   <div class="input_wrap">
      <label>게시판 내용</label>
      <textarea rows="3" name="content" readonly="readonly">${questionDetail.content}</textarea>
   </div>
   <div class="input_wrap">
      <label>게시판 작성자</label>
      <div> ${questionDetail.questionmember} </div>
   </div>
   <div class="input_wrap">
      <label>게시판 등록일</label>
      <div> <fmt:formatDate pattern="yyyy/MM/dd" value="${questionDetail.questiondate}"/></div>
   </div>
   <div>${questionDetail.answer}</div>
         
   <div class="btn_wrap">
      <a class="btn" id="list_btn">목록 페이지</a> 
      <a class="btn" id="modify_btn">수정 하기</a>
   </div>
      <input type="hidden" id="questioncode" name="questioncode" value='<c:out value="${questionDetail.questioncode}"/>'>
	<input type="button" id="resetbutton" onclick="resetActionQS()" value="취소">
	<input type="button" id="deletebutton" onclick="deleteAction(${member.id})" value="삭제">
	<input type="button" id="modifybutton" onclick="modifyAction(${member.id})" value="수정">
	<input type="button" id="answerbutton" onclick="answerbutton(${member.id})" value="답변">
	
   
</form>
	
        <div class="clear"></div>
    </section>



</body>
</html>