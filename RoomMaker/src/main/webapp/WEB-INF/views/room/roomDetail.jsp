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
<link rel="stylesheet" href="../resources/css/room/roomChatting.css" /> 
<link rel="stylesheet" href="../resources/css/room/fileList.css" /> 
<link rel="stylesheet" href="../resources/css/room/fileUpload.css" /> 
<link rel="stylesheet" href="../resources/css/room/fileDetail.css" /> 
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<style>
    section {
    	display: flex;
        width: 60%;
        height: 500px;
        border-bottom: 1px solid black;
       
    }
</style>

</head>
<body>
<%@ include file="roomHeader.jsp" %>
<%@ include file="roomAside.jsp" %>

<section id="dynamicContent">
    <div class="clear" style="float:left;"></div>
    <!-- 채팅화면 -->
     <div th:include="${'defaultJSP'} :: content"></div>
</section>
	
	

<%@ include file="roomFooter.jsp" %>

	
<script th:src="@{/webjars/jquery/jquery.min.js}"></script>
<script type="text/javascript" src="../resources/script/roomDetail.js"></script>

    
     
<script>
	var roomcode = document.getElementsByName("roomcode")[0].value;

        $(document).ready(function () {
        	
            $(".room_function").click(function () {
                var buttonValue = $(this).text().trim();
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
            });
            
            	
            	
               
      
        });
        
        function goFileUpload(){
        	var buttonValue= document.getElementById("fileUploadGo").getAttribute('data-value');
        	//var buttonValue = $(this).val().trim();
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
        
        function fileUploadAction(){
        	
            var roomcode = $('.roomcode').val();
            var filetitle = $('.filetitle').val();
            var filemember = $('.filemember').val();
            var content = $('.content').val();
            var uploadPath = $('.uploadPath').val();
            let formData = new FormData($("#fileUpload_form")[0]);
            
            console.log("roomcode= "+roomcode);
            console.log("filetitle= "+filetitle);
            console.log("filemember= "+filemember);
            console.log("content= "+content);
            console.log("uploadPath= "+uploadPath);

            $.ajax({
                type: 'POST',
                enctype: 'multipart/form-data',
                url: '/room/loadDynamicFileJSP',
                data: formData,
                processData: false,
                contentType: false,
                cache: false,
                timeout: 600000,
                success: function (data) {
                    $('#dynamicContent').html(data);
                },
                error: function (xhr, status, error) {
                    console.error("에러 발생:", error);
                }
            });

           
        };
        
        function resetAction(){
        	var buttonValue = "취소";
        	console.log(buttonValue);
        	//var buttonValue = $(this).val().trim();
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
        };
        
        function beforeAction(){
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
                url: '/room/fileListPaging',
                data: {nowPage: nowPage,cntPerPage: cntPerPage, roomcode:roomcode},
                success: function (data) {
                    $('#dynamicContent').html(data);
                },
                error: function (xhr, status, error) {
                    console.error("에러 발생:", error);
                }
            });
        }
        
        function afterAction(){
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
                url: '/room/fileListPaging',
                data: {nowPage: nowPage,cntPerPage: cntPerPage, roomcode:roomcode},
                success: function (data) {
                    $('#dynamicContent').html(data);
                },
                error: function (xhr, status, error) {
                    console.error("에러 발생:", error);
                }
            });
        }
        
        function goFileDetail(filecode){
        	$.ajax({
        		type: 'GET',
        		url: '/room/fileDetail',
                data: {filecode: filecode, roomcode:roomcode},
                success: function (data) {
                    $('#dynamicContent').html(data);
                },
                error: function (xhr, status, error) {
                    console.error("에러 발생:", error);
                }
        	});
        }
        
        function fileDownload(filecode){
        	$.ajax({
        		type: 'POST',
        		url: '/room/fileDownload',
                data: {filecode: filecode, roomcode:roomcode},
                success: function (data) {
                	alert("파일 다운로드 완료");
                },
                error: function (xhr, status, error) {
                    console.error("에러 발생:", error);
                }
        	});
        }
        
    </script>
    

    
