<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<style type="text/css">
.detail_section{
	display: inline-block;
}

.input_wrap{
	margin-top: 20px;
	font-size: 15px;
	margin-left: 60px;
}
</style>
</head>
<body>

<div class="detail_section" style="margin-left: 100px; text-align: right;">
<h1>공지 상세보기 페이지</h1>
	<div class="clear"></div>
	<div class="input_wrap">
		<label>게시판 번호</label>
		<input name="bno" readonly="readonly" value='<c:out value="${pageInfo.noticecode}"/>' >
	</div>
	<div class="input_wrap">
		<label>게시판 제목</label>
		<input name="title" readonly="readonly" value='<c:out value="${pageInfo.title}"/>' >
	</div>
	<div class="input_wrap">
		<label>게시판 내용</label>
		<textarea rows="3" name="content" readonly="readonly"><c:out value="${pageInfo.content}"/></textarea>
	</div>
	<div class="input_wrap">
		<label>게시판 작성자</label>
		<input name="writer" readonly="readonly" value='<c:out value="${pageInfo.writemember}"/>' >
	</div>
	<div class="input_wrap">
		<label>게시판 등록일</label>
		<input name="regdater" readonly="readonly" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${pageInfo.writedate}"/>' >
	</div>
		
	<div class="btn_wrap">
		<a class="btn" id="list_btn" onclick="gonoticeList()">목록 페이지</a> 
		<a class="btn" id="modify_btn" onclick="goNoticeModify(${pageInfo.noticecode})">수정 하기</a>
	</div>
	<form id="infoForm" action="/room/noticeModify" method="get">
		<input type="hidden" id="bno" name="bno" value='<c:out value="${pageInfo.noticecode}"/>'>
	</form>
	</div>
                
<script>
function goNoticeModify(noticecode){
	$.ajax({
		type: 'GET',
		url: '/room/noticeModify',
        data: {noticecode: noticecode, roomcode:roomcode},
        success: function (data) {
            $('#dynamicContent').html(data);
        },
        error: function (xhr, status, error) {
            console.error("에러 발생:", error);
        }
	});
}


function gonoticeList(){
	$.ajax({
		type: 'GET',
		url: '/room/noticeList',
        data: {roomcode:roomcode},
        success: function (data) {
            $('#dynamicContent').html(data);
        },
        error: function (xhr, status, error) {
            console.error("에러 발생:", error);
        }
	});
}

</script>
	
</body>
</html>