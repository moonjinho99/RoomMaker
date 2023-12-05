<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.noticeEnroll{
	display: flex;
	font-weight: blod;
}
.input_wrap{
	margin-top: 20px;
	margin-left: -90px;
}
</style>
<body>
<div class="noticeEnroll"></div>
<h1>공지 등록</h1>

<form action="/room/noticeEnroll" method="post" style="margin-top: 100px; margin-left: 40px;">
    <input class="roomcode" type="hidden" value="${roomDetail.roomcode }">
    <input class="writemember" type="hidden" value="${roomDetail.id }">
    
    <div class="input_wrap">
        <label style="font-weight: bold;">Title</label>
        <input class="title" style="width: 300px; height: 30px;margin-left: 20px;" >
    </div>
   
    <div class="input_wrap">
        <label style="font-weight: bold;">Content</label>
        <textarea rows="3" class="content" style="width: 300px; height: 150px;"></textarea>
    </div>

 <div class="noticeListGo_div" style="margin-top: 40px;">
<a onclick="NoticeEnrollAction()" data-value="공지보기" id="noticeListGo" class="noticeListGo" style="margin-left: -40px; font-weight: bold; border: 2px solid black;">공지 등록</a>	
</div>
    
    
</form>
<script type="text/javascript">
function NoticeEnrollAction(){
	
	
    
    var title = $('.title').val();
    var content = $('.content').val();
    var writemember = $('.writemember').val();
   
    
    console.log("roomcode= "+roomcode);
    console.log("title" + title);
    console.log("content= "+content);
    console.log("writemember" + writemember);

    $.ajax({
        type: 'POST',
        url: '/room/roomNoticeEnroll',
        data: {
        	roomcode:roomcode,
        	title:title,
        	content:content,
        	writemember:writemember
        },
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