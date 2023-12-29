<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
	
	<section>
		<form id="fileUpload_form" method="POST" enctype="multipart/form-data">
		<input type="hidden" class="roomcode" name="roomcode" value="${roomcode }">
		<!-- <input type="hidden" class="uploadPath" name="uploadPath" value="C:\\upload\\temp">
		<input type="hidden" class="uploadPath" name="uploadPath" value="/Users/choejin-yeong/RoomMaker/RoomMaker/RoomMaker/Upload"> -->
		<input type="hidden" class="uploadPath" name="uploadPath" value="/Users/hangayeon/RoomMaker/RoomMaker/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/webapp/upload">
		<input type="hidden" class="filemember" name="filemember" value="${member.id }"> 
		 <div class="fileUpload_wrap">
		 	<div class="fileUploadTitle">
		 	<img class="uploadIcon" src="../resources/images/uploadFileIcon.png">
		 	<span>자료 올리기</span>
		 	</div>
		 	<div class="fileUpload_title">
		 		<span class="span">TITLE</span>
		 		<input type="text" class="filetitle" name="filetitle">
		 	</div>
		 	<div class="fileUpload_div">
		 		<span class="span">첨부파일</span>
		 		<input type="file" class="uploadFile" multiple name="uploadFile">
		 	</div>
		 	<div class="fileUpload_content">
		 		<span class="span">설명</span>
		 		<textarea class="content" name="content"></textarea>
		 	</div>
		 <div class="fileUploadButtons">
		 	<input type="button" class="filebutton" onclick="fileUploadAction()" value="자료 올리기">
		 	<input type="button" id="resetbutton" onclick="resetAction()" value="취소">
		 </div>	
		 </div>
		</form>
        <div class="clear"></div>
        
    </section>


