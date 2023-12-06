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
	width: 870px;
    height: 740px;
    font-size: 18px;
    padding: 0;
    display: block;
}
.input_wrap{
	margin-top: 20px;
	margin-left: -90px;
}
.noticeEnrollsection{
	width: 100%;
	height: 100%;
}
.noticeTitle{
	margin-top: 25px;
    width: 100%;
    height: 50px
}
.noticeTitle img{
	width: 50px;
    height: 50px;
    float: left;
}
.noticeTitle span{
	margin: 0;
    margin-left: 70px;
    width: 650px;
    height: 50px;
    font-size: 2em;
    line-height: 50px;
    font-weight: bold;
    display: block;
}
.input_wrap1{
	width: 870px;
    height: 65px;
    margin-top: 50px;
    border-top: 1px solid black;
    border-bottom: 1px solid black;
}
.input_wrap1 label{
	line-height: 60px;
    font-weight: bold;
}

.input_wrap2{
	width: 870px;
    height: 150px;
    border-bottom: 1px solid black;	
}
.input_wrap2{
	line-height: 50px;
	font-weight: bold;
	height: 200px;
	width: 900px;
}
.input_wrap1 .title{
	border: 2px solid skyblue;
    border-radius: 7px;
    width: 300px;
    height: 35px;
    margin-left: 150px;
    color:black
}
.input_wrap2 .content{
margin-left: 115px;
    margin-top: 15px;
   width: 500px;
    height: 150px;
    resize: none;
    border: 2px solid skyblue;
    border-radius: 7px;
}
</style>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<body>
<div class="noticeEnroll">
<div class="noticeEnrollsection">
<div class="noticeTitle">
<img src="../resources/images/notice.jpg">
<span>공지 등록</span>
</div>
<form action="/room/noticeEnroll" method="post" style="margin-top: 80px; margin-left: 40px;">
    <input class="roomcode" type="hidden" value="${roomDetail.roomcode }">
    <input class="writemember" type="hidden" value="${roomDetail.id }">
    
    <div class="input_wrap1">
        <label style="font-weight: bold;">Title</label>
        <input type="text" class="title">
    </div>
   
    <div class="input_wrap2">
        <label style="font-weight: bold;">Content</label>
        <textarea rows="3" class="content" style="width: 600px; height: 150px;"></textarea>
    </div>

 <div class="noticeListGo_div" style="margin-top: 40px; margin-left: 800px;">
<a onclick="NoticeEnrollAction()" data-value="공지보기" id="noticeListGo" class="noticeListGo" style="margin-left: -40px; font-weight: bold; border: 2px solid black;">공지 등록</a>	
</div>
 
    
</form>
</div>
</div>
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