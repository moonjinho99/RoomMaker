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
<link rel="stylesheet" href="../resources/css/room/questionDetail.css" />
<link rel="stylesheet" href="../resources/css/room/question.css" />

<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>

<link rel="stylesheet" href="../resources/css/room/fileModify.css" />  
<link rel="stylesheet" href="../resources/css/room/question.css" />
<link rel="stylesheet" href="../resources/css/room/questionDetail.css" />
<link rel="stylesheet" href="../resources/css/room/questionModify.css" />
<link rel="stylesheet" href="../resources/css/room/questionWrite.css" />
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>

<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
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
	<%@ include file="roomHeader.jsp"%>
	<%@ include file="roomAside.jsp"%>

<section id="dynamicContent">
    <div class="clear" style="float:left;"></div>

     <div th:include="${'defaultJSP'} :: content"></div>
     
</section>
	
	

<%@ include file="../room/roomFooter.jsp" %>

	
<script th:src="@{/webjars/jquery/jquery.min.js}"></script>
<script type="text/javascript" src="../resources/script/roomDetail.js"></script>
    
     
<script>
        

	var roomcode = document.getElementsByName("roomcode")[0].value;
	console.log(roomcode);

        $(document).ready(function () {
        	
        	//첫화면
        	$.ajax({
                type: 'GET',
                url: '/room/loadDynamicJSP',
                data: {buttonValue: '공지보기' , roomcode:roomcode},
                success: function (data) {
                    $('#dynamicContent').html(data);
                },
                error: function (xhr, status, error) {
                    console.error("에러 발생:", error);
                }
            });
        	
        	
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
          
          function answerButton() {
  			var answermember = $('.loginId').val();
  		    var questioncode = $('#questioncode').val();
  		    console.log(questioncode);
  		    console.log(answermember);
  		    
  		    var url = '/room/questionAnswerWindow?questioncode='+questioncode+'&roomcode='+roomcode+'&answermember='+answermember;
  		    window.open(url, "_blank_1", "toolbar=no, menubar=no, scrollbars=yes, resizeble=no, width=450, height=300");
  		}
          function resetActionQuestion(questioncode){
        	  console.log(questioncode)
        	  $.ajax({
      			type: 'GET',
      			url: '/room/questionDetail',
      	        data: {questioncode: questioncode, roomcode:roomcode},
      	        success: function (data) {
      	        	 $('#dynamicContent').html(data);
      	        },
      	        error: function (xhr, status, error) {
      	            console.error("에러 발생:", error);
      	        }
      		});
        	  
          }
          
          function questionModify(questioncode){
         		var loginId = $('.loginId').val();  //로그인 되어 있는 유저 Id
         		var roomId=$('.roomId').val();		//방장 Id
         		var uploadId= $('.uploadId').val();		//파일을 업로드한 유저 Id
         
          
          	if(loginId===uploadId||loginId===roomId){
          		console.log("일치");
          		$.ajax({
          		type: 'GET',
          		url: '/room/questionModify',
                  data: {questioncode: questioncode, roomcode:roomcode},
                  success: function (data) {
                  	 $('#dynamicContent').html(data);

                  },
                  error: function (xhr, status, error) {
                      console.error("에러 발생:", error);
                  }
          	});
          		
          	}
          	else{
          		alert("수정할 수 있는 권한이 없습니다.");
          		return false;
         		}
        	
          }
              
      function modifyActionQS(questioncode){
      	var questiontitle = $('.questionModify_title_sec').val();
      	var content = $('.modifycontent').val();
      	
      	console.log(questiontitle, content);
      	
      	if(questiontitle===""){
      	alert("수정하실 게시물 제목을 입력해주세요");
      	return false;
      	}
      	$.ajax({
      		type: 'POST',
      		url: '/room/modifyUploadedQuestion',
              data: {questioncode: questioncode, roomcode:roomcode, questiontitle: questiontitle, content: content},
              success: function (data) {
              	 $('#dynamicContent').html(data);
              },
              error: function (xhr, status, error) {
                  console.error("에러 발생:", error);
              }

      	});
      	
      }
      
        
    </script>
    
