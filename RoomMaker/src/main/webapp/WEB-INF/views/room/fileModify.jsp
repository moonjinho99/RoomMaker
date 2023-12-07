<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<style>
section {
    	display: flex;
        width: 60%;
        height: 500px;
        border-bottom: 1px solid black;
       
	}
</style>
	<section>
		 <div id="fileModifyWrap">
			<input type="hidden" class="loginId" value="${member.id }"> <input
				type="hidden" class="roomId" value="${roomModify.id}"> <input
				type="hidden" class="uploadId" value="${file.filemember }">
			<div class="fileModifyTitle">
				<img class="ModifyIcon" src="../resources/images/fileDetailIcon.png">
				<span>자료 디테일</span>
			</div>
				<div class="fileModify_title">
					<span> no. ${file.filecode} </span> <input type="text" class="fileModify_title_sec" name="filetitle" value="${file.filetitle }">
				</div>
				<div class="fileModify_member">${file.filemember }</div>
				<div class="fileModify_uploaddate">
					<fmt:formatDate value="${file.fileuploaddate}"
						pattern="yyyy년 MM월 dd일"></fmt:formatDate>
				</div>
<%-- 				<div class="fileModify_fileName">${file.fileName } <input type="button" class="filedownload" onclick="fileDownload(${file.filecode})" value="다운로드"></div>
 --%>				<div class="fileModify_content"><textarea class="modifycontent">${file.content }</textarea></div>
				<div class="buttons">
					<input type="button" id="resetbutton" onclick="resetActionFromFileMod(${file.filecode})" value="취소">
		 <input type="button" id="modifybutton" onclick="modifyAction(${file.filecode})" value="수정">
				</div>
		</div>
		 
        <div class="clear"></div>
        
        </section>
       