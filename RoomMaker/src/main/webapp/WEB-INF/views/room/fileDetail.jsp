<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		
			<input type="hidden" class="loginId" value="${member.id }"> <input
				type="hidden" class="roomId" value="${roomDetail.id}"> <input
				type="hidden" class="uploadId" value="${file.filemember }">
			<div class="fileDetailTitle">
				<img class="DetailIcon" src="../resources/images/fileDetailIcon.png">
				<span>자료 디테일</span>
			</div>
				<div class="fileDetail_title">
					<span> no. ${file.filecode} </span> <span class="fileDetail_title_sec"> ${file.filetitle}</span>
				</div>
				<div class="fileDetail_member">${file.filemember }</div>
				<div class="fileDetail_uploaddate">
					<fmt:formatDate value="${file.fileuploaddate}"
						pattern="yyyy년 MM월 dd일"></fmt:formatDate>
				</div>
				<div class="fileDetail_fileName"><span class="fileDetail_fileName_span">${file.fileName }</span><input type="button" class="filedownload" onclick="fileDownload(${file.filecode})" value="다운로드"></div>
				<div class="fileDetail_content">${file.content }</div>
				<div class="buttons">
					<input type="button" id="resetbutton" onclick="resetAction()"
						value="취소"> <input type="button" id="deletebutton"
						onclick="deleteAction(${file.filecode})" value="삭제"> <input
						type="button" id="modifybutton"
						onclick="goFileModify(${file.filecode})" value="수정">
				</div>
		</div>



		<div class="clear"></div>


	</section>