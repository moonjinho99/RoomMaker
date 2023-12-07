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
.noticeDetailTitle{
	margin-top: 25px;
    width: 100%;
    height: 50px
}
.noticeDetailTitle img{
	width: 50px;
    height: 50px;
    float: left;
}
.noticeDetailTitle span{
	margin: 0;
    margin-left: 80px;
    width: 400px;
    height: 50px;
    font-size: 2em;
    line-height: 50px;
    font-weight: bold;
    display: block;
}

.detail_section{
	width: 870px;
    height: 500px;
}

.input_wrap1{
	margin-top: 20px;
	font-size: 15px;
	margin-left: 60px;
	border-bottom: 2px solid black;
}
.input_wrap1 label{
	line-height: 50px;
    font-weight: bold;
    font-size: 1.2em;
}
.input_wrap1 span{
    line-height: 50px;
    font-weight: bold;
    font-size: 1.2em;
}
.input_wrap2{
	width: 870px;
    height: 50px;
    line-height: 40px;
    font-size: 1.1em;
    margin-left: 60px;
    border-bottom: 2px solid black;
}
.input_wrap3{
	width: 870px;
    height: 150px;
    line-height: 30px;
    font-size: 1em;
    border-bottom: 2px solid black;
    margin-left: 60px;
}

.input_wrap3 textarea{
	margin-left: 50px;
    margin-top: 20px;
    width: 600px;
    height: 100px;
}
.input_wrap4{
	width: 870px;
    height: 50px;
    line-height: 50px;
    font-size: 1em;
    border-bottom: 2px solid black;
    margin-left: 60px;
}
.input_wrap5{
	width: 870px;
    height: 60px;
    line-height: 50px;
    font-size: 1em;
    border-bottom: 2px solid black;
    margin-left: 60px;
}

.btn_wrap6{
	text-align: center;
	margin-top: 5px;
}

.btn{
	width: 50px;
    height: 30px;
    border: 2px solid black;
    background-color: skyblue;
    color: black;
    font-weight: bold;
    border-radius: 7px;
    margin-left: 15px;
}
</style>
</head>
<body>
<div class="clear"></div>
<div class="detail_section">
<div class="noticeDetailTitle">
<img src="../resources/images/notice.jpg">
<span>공지 상세 보기</span>
</div>
	
	<div class="input_wrap1">
		<label>게시판 번호</label>
		<input name="bno" readonly="readonly" style="margin-left: 50px; border: none;" value='<c:out value="${pageInfo.noticecode}"/>' >
	</div>
	<div class="input_wrap2">
		<label>게시판 제목</label>
		<input name="title" readonly="readonly" style="margin-left: 50px; border: none;" value='<c:out value="${pageInfo.title}"/>' >
	</div>
	<div class="input_wrap3">
		<label>게시판 내용</label>
		<textarea rows="3" name="content" readonly="readonly" style="margin-left: 50px; border: none;"><c:out value="${pageInfo.content}"/></textarea>
	</div>
	<div class="input_wrap4">
		<label>게시판 작성자</label>
		<input name="writer" readonly="readonly" style="margin-left: 50px; border: none;" value='<c:out value="${pageInfo.writemember}"/>' >
	</div>
	<div class="input_wrap5">
		<label>게시판 등록일</label>
		<input name="regdater" style="margin-left: 50px; border: none;" readonly="readonly" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${pageInfo.writedate}" />' >
	</div>
		
	<div class="btn_wrap6">
		<a class="btn" id="list_btn" onclick="resetNoticeAction()">목록 페이지</a> 
		<c:if test="${member.id == pageInfo.writemember}">
		<a class="btn" id="modify_btn" onclick="goNoticeModify(${pageInfo.noticecode})">수정 하기</a>
		</c:if>
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

function resetNoticeAction(){
	var buttonValue = "공지보기";
	console.log(buttonValue);
	//var buttonValue = $(this).val().trim();
	$.ajax({
        type: 'GET',
        url: '/room/loadDynamicJSP',
        data: {buttonValue: buttonValue , roomcode:roomcode},
        success: function (data) {
            $('#dynamicContent').html(data);
        },
        error: function (xhr, status, error) {
            console.error("에러 발생:", error);
        }
    });
};


</script>
	
</body>
</html>