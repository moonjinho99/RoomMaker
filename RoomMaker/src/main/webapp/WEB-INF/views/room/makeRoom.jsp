<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/room/header.css" />
<link rel="stylesheet" href="../resources/css/room/makeRoom.css" />
<link rel="stylesheet" href="../resources/css/room/footer.css" />
</head>

<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/40.0.0/classic/ckeditor.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<style>
<style type="text/css">

	

	#result_card img{
		max-width: 200px;
	    height: 80px;
	    display: block;
	    padding: 5px;
	    margin-top: 10px;
	    margin: auto;	
	}
	#result_card {
		position: relative;
	}
	.imgDeleteBtn{
	    position: absolute;
	    top: 0;
	    right: 5%;
	    background-color: skyblue;
	    color: wheat;
	    font-weight: 900;
	    width: 30px;
	    height: 30px;
	    border-radius: 50%;
	    line-height: 26px;
	    text-align: center;
	    border: none;
	    display: block;
	    cursor: pointer;	
	}
	
</style>

<body>
<%@ include file="../header.jsp" %>
<section>
<div class="create_room">
<h1>방 생성</h1>

<form action="/room/makeRoom" method="post" name="frm" onsubmit="return makeCheck()" enctype="multipart/form-data">
<table style="height: 540px; text-align: center; margin: 0 auto;">
	<tr>
		<td>방 제목</td>
		<td><input type="text" name="title"></td>
	<tr>
	<tr>
		<td>암호</td>
		<td><input type="text" name="roompw"></td>
	<tr>
	<tr>
		<td>방 인원수</td>
		<td><input type="text" name="member_cnt"></td>
	<tr>
	<tr>
		<td>대표 이미지 :</td>
		<td><input type="file" id="fileItem" name="uploadFile" style="height: 30px;">
		<div id="uploadResult">
		
		</div>
		</td>
	<tr>
	<tr>
		<td>설명</td>
		<td><textarea rows="15" cols="40" name="explanation"></textarea></td>
	<tr>
	
	<tr>
		<td>방 종류</td>
		<td><input type="radio" name="type" value=0 style="padding-right: 10px;" checked="checked">교육기관
			<input type="radio" name="type" value=1>프로젝트
		</td>
	</tr>
</table>
<input type="hidden" name="id" value="${member.id}">
<input type="submit" value="방생성" style="border: none;
  display: inline-block;
  text-align: center;
  cursor: pointer;
  text-transform: uppercase;
  outline: none;
  overflow: hidden;
  position: relative;
  color: #fff;
  background:skyblue;
  font-size: 20px;
  padding: 17px 60px;
  margin-top: 80px;
  box-shadow: 0 5px 15px rgba(0,0,0,0.20);
  border-radius: 10px;"
  >

</form>
</div>
</section>

<script>

function makeCheck()
{
	let result = true;
	
	if(document.frm.title.value.length == 0)
	{
		result = false;
		alert("방 제목을 입력해주세요");
		makeRoomForm.title.focus();
	 	return result;
	}
	
	if(document.frm.roompw.value.length == 0)
	{
		result = false;
		alert("방 암호를 입력해주세요");
		makeRoomForm.title.focus();
		return result;
	}
	
	if(document.frm.member_cnt.value.length == 0)
	{
		result = false;
		alert("방 인원수를 입력해주세요");
		makeRoomForm.title.focus();
		return result;
	}
	
	if(document.frm.explanation.value.length == 0)
	{
		result = false;
		alert("설명을 입력해주세요");
		makeRoomForm.title.focus();
		return result;
	}
	
	return result;
	
}

/* 이미지 업로드 */
$("input[type='file']").on("change", function(e){
	
	/* 이미지 존재시 삭제 */
	if($(".imgDeleteBtn").length > 0){
		deleteFile();
	}
	
	let formData = new FormData();
	let fileInput = $('input[name="uploadFile"]');
	let fileList = fileInput[0].files;
	let fileObj = fileList[0];
	
	if(!fileCheck(fileObj.name, fileObj.size)){
		return false;
	}
	
	formData.append("uploadFile", fileObj);
	
	$.ajax({
		url: '/room/uploadAjaxAction',
    	processData : false,
    	contentType : false,
    	data : formData,
    	type : 'POST',
    	dataType : 'json',
    	success : function(result){
    		console.log(result);
    		showUploadImage(result);
    	},
    	error : function(result){
    		alert("이미지 파일이 아닙니다.");
    	}
	});	
});

/* var, method related with attachFile */
let regex = new RegExp("(.*?)\.(jpg|png|jpeg)$");
let maxSize = 1048576; //1MB	

function fileCheck(fileName, fileSize){

	if(fileSize >= maxSize){
		alert("파일 사이즈 초과");
		return false;
	}
		  
	if(!regex.test(fileName)){
		alert("해당 종류의 파일은 업로드할 수 없습니다.");
		return false;
	}
	
	return true;		
	
}

/* 이미지 출력 */
function showUploadImage(uploadResultArr){
	
	/* 전달받은 데이터 검증 */
	if(!uploadResultArr || uploadResultArr.length == 0){return}
	
	let uploadResult = $("#uploadResult");
	
	let obj = uploadResultArr[0];
	
	let str = "";
	

	let fileCallPath = encodeURIComponent(obj.uploadPath.replace(/\\/g, '/') + "/s_" + obj.uuid + "_" + obj.fileName);
	
	str += "<div id='result_card'>";
	str += "<img src='/room/display?fileName=" + fileCallPath +"'>";
	str += "<div class='imgDeleteBtn' data-file='" + fileCallPath + "'>x</div>";
	str += "<input type='hidden' name='imageList[0].fileName' value='"+ obj.fileName +"'>";
	str += "<input type='hidden' name='imageList[0].uuid' value='"+ obj.uuid +"'>";
	str += "<input type='hidden' name='imageList[0].uploadPath' value='"+ obj.uploadPath +"'>";
	str += "</div>";		
	
		uploadResult.append(str);     
    
}	

/* 이미지 삭제 버튼 동작 */
$("#uploadResult").on("click", ".imgDeleteBtn", function(e){
	
	deleteFile();
	
});

/* 파일 삭제 메서드 */
function deleteFile(){
	
	let targetFile = $(".imgDeleteBtn").data("file");
	
	let targetDiv = $("#result_card");
	
	$.ajax({
		url: '/room/deleteFile',
		data : {fileName : targetFile},
		dataType : 'text',
		type : 'POST',
		success : function(result){
			console.log(result);
			
			targetDiv.remove();
			$("input[type='file']").val("");
			
		},
		error : function(result){
			console.log(result);
			
			alert("파일을 삭제하지 못하였습니다.")
		}
	});
}





</script>

<%@ include file="../room/roomFooter.jsp" %>

