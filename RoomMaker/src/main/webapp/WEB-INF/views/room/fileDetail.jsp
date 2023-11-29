<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/room/roomHeader.css" />
<link rel="stylesheet" href="../resources/css/room/roomAside.css" />
<link rel="stylesheet" href="../resources/css/room/roomFooter.css" />
<style>
section {
    	display: flex;
        width: 65%;
        height: 500px;
        border-bottom: 1px solid black;
	}
</style>
</head>
<body>
	<section>
	<div id="fileDetailWrap">
	<div class="fileDetailTitle">
		 	<img class="DetailIcon" src="../resources/images/fileDetailIcon.png">
		 	<span>자료 디테일</span>
		 </div>
		 <table style="width: 600px; height: 250px; border: none;">
		 <tr>
		 <td style="width: 150px; height: 5px; border-right: none;">no. ${file.filecode }</td>
		 <td>${file.filetitle }</td>
		 </tr>
		  <tr>
		 <td>${file.filemember }</td>
		 <td><fmt:formatDate value="${file.fileuploaddate}" pattern="yyyy년 MM월 dd일" ></fmt:formatDate></td>
		 </tr>
		 <tr>
		 <td colspan="2">${file.fileName}<input type="button" onclick="fileDownload(${file.filecode})" class=".downloadBtn" value="다운로드"></td>
		 </tr>
		 <tr>
		 <td colspan="2">${file.content }</td>
		 </tr>
		 </table>
		 <div class="buttons">
		 <input type="button" id="resetbutton" onclick="resetAction()" value="취소">
		 <input type="button" id="deletebutton" onclick="" value="삭제">
		 <input type="button" id="modifybutton" onclick="" value="수정">
		 </div>
		 </div>
		 
        <div class="clear"></div>
		        
        
    </section>

