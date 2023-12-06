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
.noticeModifyTitle{
	margin-top: 25px;
    width: 100%;
    height: 50px
}
.noticeModifyTitle img{
	width: 50px;
    height: 50px;
    float: left;
}
.noticeModifyTitle span{
	margin: 0;
    margin-left: 80px;
    width: 400px;
    height: 50px;
    font-size: 2em;
    line-height: 50px;
    font-weight: bold;
    display: block;
}

.input_wrap{
	width: 870px;
    height: 50px;
    line-height: 50px;
    font-size: 1em;
    border-bottom: 2px solid black;
}

.noticeModify span{
	line-height: 50px;
    font-weight: bold;
    font-size: 1.2em;
}
.noticeModify .title{
	margin-left: 20px;
    width: 775px;
    height: 30px;
    border: 2px solid skyblue;
    border-radius: 5px;
}
.noticeModifyContent{
	width: 870px;
    height: 150px;
    line-height: 50px;
    font-size: 1em;
    border-bottom: 2px solid black;
}

.noticeModifyContent .content{
	margin: 0;
    margin-top: 20px;
    margin-left: 5px;
    width: 850px;
    height: 100px;
    border: 2px solid skyblue;
    border-radius: 5px;
    line-height: 15px;
    resize: none;
}

.btn_wrap{
text-align: center;
margin-top:10px;
}
</style>
</head>
<body>

<div class="detail_section" style="width: 870px;height: 500px;">
<div class="noticeModifyTitle">
<img src="../resources/images/notice.jpg">
<span>공지 수정</span>
</div>

<form id="modifyForm" action="/board/modify" method="post">
	<div class="clear"></div>
	<div class="noticeModify">
		<span>${pageInfo.noticecode}</span> <input class="title" name="title" style="color:black;" value='<c:out value="${pageInfo.title}"/>' >
	</div>
	<div class="noticeModifyContent">
		<textarea rows="3" class="content" name="content" ><c:out value="${pageInfo.content}"/></textarea>
	</div>
	<div class="input_wrap">
		<label>게시판 작성자</label>
		<input name="writer" readonly="readonly" style="margin-left: 35px; border: none;" value='<c:out value="${pageInfo.writemember}"/>' >
	</div>
	<div class="input_wrap">
		<label>게시판 등록일</label>
		<input name="regdater" readonly="readonly" style="margin-left: 35px; border: none;" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${pageInfo.writedate}"/>' >
	</div>
		
	<div class="btn_wrap">
        <input type="button" id="resetbutton" onclick="resetActionFromNoticeMod(${pageInfo.noticecode})" value="취소">
		<input type="button" id="deletebutton" onclick="deleteAction('${pageInfo.noticecode}','${pageInfo.roomcode}')" value="삭제">
		<input type="button" id="modifybutton" onclick="noticeModifyAction(${pageInfo.noticecode})" value="수정">
	</div>
	</form>
	</div>

<script>

function noticeModifyAction(noticecode){
	var title = $('.title').val();
	var content = $('.content').val();

	
	console.log(title, content);
	
	if(title===""){
	alert("수정하실 공지 제목을 입력해주세요");
	return false;
	}
	
	if(content===""){
		alert("수정하실 공지 내용을 입력해주세요")
	}
	$.ajax({
		type: 'POST',
		url: '/room/noticeModify',
        data: {noticecode: noticecode, roomcode:roomcode, title: title, content: content},
        success: function (data) {
        	 $('#dynamicContent').html(data);
        },
        error: function (xhr, status, error) {
            console.error("에러 발생:", error);
        }

	});
	
}


function resetActionFromNoticeMod(noticecode){
	console.log(noticecode)
	$.ajax({
		type: 'GET',
		url: '/room/noticeDetail',
        data: {noticecode: noticecode, roomcode:roomcode},
        success: function (data) {
        	 $('#dynamicContent').html(data);
        },
        error: function (xhr, status, error) {
            console.error("에러 발생:", error);
        }
	});

}

function deleteAction(noticecode,roomcode){
	console.log(noticecode)
	$.ajax({
		type: 'GET',
		url: '/room/roomNoticeDelete',
        data: {noticecode: noticecode, roomcode:roomcode},
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