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
<style>
.notice_main{
	display: inline-block;
	font-weight: bold;
}
  a{
  	text-decoration : none;
  }
  table{
 	border-collapse: collapse;
 	width: 1000px;    
 	margin-top : 5px;
 	text-align: center;
  }
  td, th{
  	border : 1px solid black;
  	height: 50px;
  }
  th{
  	font-size : 17px;
  }
  thead{
  	font-weight: 700;
  }
  
  .bno_width{
  	width: 12%;
  }
  .writer_width{
  	width: 20%;
  }
  .regdate_width{
  	width: 15%;
  }
  .updatedate_width{
  	width: 15%;
  }
  .top_btn{
  	font-size: 20px;
    padding: 6px 12px;
    background-color: #fff;
    border: 1px solid #ddd;
    font-weight: 600;
  }
  .noticepage{
  	text-align: center;
  	margin-top: 6px;
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
  </style>
</head>
<body>
<div class="notice_main">
<div class="noticeTitle">
<img src="../resources/images/notice.jpg">
<span>공지!!</span>
</div>
<c:if test="${roomDetail.id == member.id}">
<div class="noticeEnrollGo_div" style="margin-left: 800px;">
<a onclick="gonoticeEnroll()" data-value="공지등록" id="noticeEnrollGo" class="noticeEnrollGo" style="border: 2px solid black;">공지 등록</a>	
</div>
</c:if>

<div class="table_wrap">
	<table>
		<thead>
			<tr>
				<th class="bno_width">번호</th>
				<th class="title_width">제목</th>
				<th class="writer_width">작성자</th>
				<th class="regdate_width">작성일</th>
			</tr>
		</thead>
			<c:forEach items="${list}" var="list">
            <tr>
                <td><c:out value="${list.noticecode}"/></td>
                <td><a onclick="goNoticeDetail(${list.noticecode})">${list.title}</a></td>
                <td><c:out value="${list.writemember}"/></td>
                <td><fmt:formatDate pattern="yyyy/MM/dd" value="${list.writedate}"/></td>
            </tr>
        </c:forEach>
	</table>
	<form id="moveForm" method="get">    
    </form>
</div>

<input type="hidden" class="startPage" name="startPage" value="${paging.startPage}">
		<input type="hidden" class="endPage" name="endPage" value="${paging.endPage}">
		<input type="hidden" class="cntPerPage" name="cntPerPage" value="${paging.cntPerPage}">	
		<div class="noticepage">
		<c:if test="${paging.startPage != 1 }">
			<a onclick="beforeNoticeAction()" class="before">◀이전</a>
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
			<a onclick="afterNoticeAction()"  class="next">다음▶</a>
		</c:if>
		</div>

</div>
<script>
$(document).ready(function(){
    
    let result = '<c:out value="${result}"/>';
    
    checkAlert(result);
    
    function checkAlert(result){
        
        if(result === ''){
            return;
        }
        
        if(result === "enroll success"){
            alert("등록이 완료되었습니다.");
        }
        
        if(result === "modify success"){
            alert("수정이 완료되었습니다.");
        }
 
    }    
    
});


function gonoticeEnroll(){   
    var buttonValue= document.getElementById("noticeEnrollGo").getAttribute('data-value');
        
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
       
}


function goNoticeDetail(noticecode){

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

function beforeNoticeAction(){
	var nowPage= $('.startPage').val();
	var cntPerPage= $('.cntPerPage').val();
	nowPage = parseInt(nowPage, 10);
    cntPerPage = parseInt(cntPerPage, 10);
	console.log(nowPage);
	console.log(cntPerPage);
	
	nowPage = nowPage-1;
	
	console.log(nowPage);
	console.log(cntPerPage);
	
	$.ajax({
        type: 'POST',
        url: '/room/noticeListPaging',
        data: {nowPage: nowPage,cntPerPage: cntPerPage, roomcode:roomcode},
        success: function (data) {
            $('#dynamicContent').html(data);
        },
        error: function (xhr, status, error) {
            console.error("에러 발생:", error);
        }
    });
}

function afterNoticeAction(){
	var nowPage= $('.endPage').val();
	var cntPerPage= $('.cntPerPage').val();
	nowPage = parseInt(nowPage, 10);
    cntPerPage = parseInt(cntPerPage, 10);
	console.log(nowPage);
	console.log(cntPerPage);
	
	nowPage = nowPage+1;
	
	console.log(nowPage);
	console.log(cntPerPage);
	
	$.ajax({
        type: 'POST',
        url: '/room/noticeListPaging',
        data: {nowPage: nowPage,cntPerPage: cntPerPage, roomcode:roomcode},
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