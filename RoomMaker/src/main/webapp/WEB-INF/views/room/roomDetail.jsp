<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/room/roomHeader.css" />
<link rel="stylesheet" href="../resources/css/room/roomAside.css" />

<link rel="stylesheet" href="../resources/css/room/roomFooter.css" />
<link rel="stylesheet" href="../resources/css/footer.css?v=1" />

<link rel="stylesheet" href="../resources/css/room/roomChatting.css" /> 
<link rel="stylesheet" href="../resources/css/room/fileList.css" /> 
<link rel="stylesheet" href="../resources/css/room/fileUpload.css" /> 
<link rel="stylesheet" href="../resources/css/room/fileDetail.css" />
<link rel="stylesheet" href="../resources/css/room/fileModify.css" />  
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
	
	

<%@ include file="../footer.jsp" %>

	
<script th:src="@{/webjars/jquery/jquery.min.js}"></script>
<script type="text/javascript" src="../resources/script/roomDetail.js"></script>
    
     
<script>
        

	var roomcode = document.getElementsByName("roomcode")[0].value;
	console.log(roomcode);



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
        
        function QuestionWrite(){
        	 // QuestionWrite에 클래스를 일치시켜서 불러옴
        	 var questiontitle = $('.questiontitle').val();
        	 var questionmember =  $('.questionmember').val();
        	 var content = $('.content').val();
        	 
        	 console.log("roomcode : " + roomcode);
        	
        	$.ajax({
                type: 'POST', 	// JSP 받아오는 방식
                url: '/room/questionWrite', // JSP에 주소
                data: {roomcode:roomcode, questiontitle:questiontitle, questionmember:questionmember, content:content}, //배열 형식
                success: function (data) {
                	// 이 부분에 alert 써주고 싶으면 써준다
                    $('#dynamicContent').html(data); // 스트링 반환 시켜주는것
                },
                error: function (xhr, status, error) {
                    console.error("에러 발생:", error);
                }
            });   
        }
        
       function QuestionWriteMovo(){
    	   var buttonValue = '글 작성';
    	   
    	   $.ajax({
    		   
    		   type: 'GET',
    		   url: '/room/loadDynamicJSP',
    		   data: {buttonValue:buttonValue, roomcode:roomcode},
    		   success: function (data) {
    			   
    			   $('#dynamicContent').html(data);
    		   },
    		   error: function (xhr, status, error) {
                   console.error("에러 발생:", error);
                   
               }
    		   
    	   });
    	  
       }
       
       function questionDetail(questioncode) {
    	   var buttonValue = '조회하기';
    	   
    	   console.log(questioncode);
    	   
    	   $.ajax({
    		   type:'GET',
    		   url: '/room/questionDetail',
    		   data: {roomcode:roomcode, questioncode:questioncode},
    		   success: function (data){
    			   
    			   $('#dynamicContent').html(data);
    		   },
    		   error: function (xhr, status, error) {
    			   console.error("에러 발생", error);
    		   }
    		   
    	   });
       }
       
       function beforeActionQS(){
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
                  url: '/room/questionListPaging',
                  data: {nowPage: nowPage,cntPerPage: cntPerPage, roomcode:roomcode},
                  success: function (data) {
                      $('#dynamicContent').html(data);
                  },
                  error: function (xhr, status, error) {
                      console.error("에러 발생:", error);
                  }
              });
          }
          
          function afterActionQS(){
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
                  url: '/room/questionListPaging',
                  data: {nowPage: nowPage,cntPerPage: cntPerPage, roomcode:roomcode},
                  success: function (data) {
                      $('#dynamicContent').html(data);
                  },
                  error: function (xhr, status, error) {
                      console.error("에러 발생:", error);
                  }
              });
          }
          
          function resetActionQS(){
          	var buttonValue = "조회취소";
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

       
  
        
    
        
        
        
    </script>
    
    
 
