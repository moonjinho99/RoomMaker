<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<input type="button" value="질문하기" onclick="question()">
</body>

<script>
function question()
{
	var url = '/room/roomAIQuestion';
	window.open(url,"_blank_1","toolbar=no , menubar=no, scrollbars=yes,resizeble=no, width=450,height=600");
}
</script>

<link rel="stylesheet" href="../resources/css/room/question.css" />
 <link rel="stylesheet" href="../resources/css/room/roomHeader.css" />
<link rel="stylesheet" href="../resources/css/room/roomAside.css" />
<link rel="stylesheet" href="../resources/css/room/roomFooter.css" />
</head>
<body>
	<section id="dynamicContent">
<div class="table_wrap">
<form action="/room/question" method="post">
  	<table>
  		<thead>
  				<tr>
  					<th class="roomcode_width">번호</th>
  					<th class="title_width">제목</th>
					<th class="id_width">아이디</th>
					<th class="date_width">작성일</th>
  				</tr>
  		
  		</thead>
  		
  		
  		
        <c:forEach items="${list}" var="list">
            <tr>
                <td>${list.questioncode}</td>
                <td><a onclick="questionDetail(${list.questioncode})">${list.questiontitle}</a></td>
                <td>${list.questionmember}</td>
                <td><fmt:formatDate pattern="yyyy/MM/dd" value="${list.questiondate}"/></td>
                
            </tr>
        </c:forEach>
        
  		
  	</table>
  	
  	 <input type="button" value="글 작성" onclick="QuestionWriteMovo()" >
  	
  	
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


	<div class="clear" style="float:left;"></div>
    <div th:include="${'defaultJSP'} :: content"></div>	
    </section>
    
    


</body>
</html>