<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
	
	<section>
		<form id="fileUpload_form" method="POST" enctype="multipart/form-data">
		<input type="hidden" class="roomcode" name="roomcode" value='<c:out value="${roomList.roomcode}"/>'>
		<input type="hidden" class="uploadPath" name="uploadPath" value="/Users/hangayeon/RoomMaker/RoomMaker/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/webapp/upload">
		<input type="hidden" class="filemember" name="filemember" value="aa"> 
		 <div class="fileUpload_wrap">
		 	<div class="fileUploadTitle">
		 	<img class="uploadIcon" src="../resources/images/uploadFileIcon.png">
		 	<span>자료 올리기</span>
		 	</div>
		 	<div class="fileUpload_title">
		 		<div class="span"><span>TITLE</span></div>
		 		<input type="text" class="filetitle" name="filetitle">
		 	</div>
		 	<div class="fileUpload_div">
		 		<span>첨부파일</span>
		 		<input type="file" multiple name="uploadFile">
		 	</div>
		 	<div class="fileUpload_content">
		 		<span>설명</span>
		 		<textarea class="content" name="content" rows="4" cols="10"></textarea>
		 	</div>
		 <input type="button" class="filebutton" value="자료 올리기">
		 <input type="button" class="resetbutton" value="취소">
		 </div>
		</form>
        <div class="clear"></div>
        
    </section>


