<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
section {
	display: flex;
	width: 60%;
	height: 500px;
	border-bottom: 1px solid black;
	
}
</style>
	

<script>
function question()
{
	var url = '/room/roomAIQuestion';
	window.open(url,"_blank_1","toolbar=no , menubar=no, scrollbars=yes,resizeble=no, width=450,height=600");
}
</script>



</head>
<body>
	<section id="dynamicContent">
<div class="table_wrap">
<form action="/room/question" method="post">
<div>
	<form id="questionList_form">
	<div class="questionUploadTitle">
 		 <img class="QAIcon" src="../resources/images/qaimage.png" style="width: 50px; height: 50px; float: left; margin-right: 25px;">
		<span>질문 게시판</span>
	</div>
	<div style="display:flex">
	<div class="questionUploadGo_div" style="
    width: 100px;
"><input type="button" onclick="QuestionWriteMovo()" id="questionUploadGo" class="questionUploadGo" value="글 작성">
	</div>
	
	<div class="button_Ai">
		<input type="button" value="Ai 질문" onclick="question()" style="
    idth: 70px;
    height: 35px;
    border: 2px solid black;
    background-color: skyblue;
    color: black;
    font-weight: bold;
    border-radius: 10px;
">
	</div>
	</div>
  	<table>
  	<tr>
  	<th width="100">no.</th><th width="300" class="notFirst">제목</th><th width="200" class="notFirst">아이디</th><th width="300" class="notFirst">작성일</th>
  	</tr>
  	<c:forEach items="${list}" var="list" varStatus="status">
  	<tr>
  	<td>${list.questioncode}</td><td><a class="questiontitle" onclick="questionDetail(${list.questioncode})">${list.questiontitle}</a></td><td>${list.questionmember}</td><td> <fmt:formatDate value="${list.questiondate}" pattern="yyyy년 MM월 dd일" ></fmt:formatDate> </td>
  	</tr>
  	
  	</c:forEach>
  	</table>
  	</form>	
	
	<div style="display: block; text-align: center; margin-top:20px" class="pagemove">	
		<input type="hidden" class="startPage" name="startPage" value="${paging.startPage}">
		<input type="hidden" class="endPage" name="endPage" value="${paging.endPage}">
		<input type="hidden" class="cntPerPage" name="cntPerPage" value="${paging.cntPerPage}">	
			
		<c:if test="${paging.startPage != 1 }">
			<a onclick="beforeActionQS()" class="before">◀이전</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b style="color:skyblue;">${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="/main?nowPage=${p }&cntPerPage=${paging.cntPerPage}">다음▶</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a onclick="afterActionQS()"  class="next">다음▶</a>
		</c:if>
	</div> 
</div>
	<section id="dynamicContent">

		<div class="clear" style="float:left;"></div>
    	<div th:include="${'defaultJSP'} :: content"></div>	
    </section>
    
    


</body>
</html>