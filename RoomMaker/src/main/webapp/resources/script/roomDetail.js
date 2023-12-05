
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
        	var buttonValue= "자료등록";
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
            
            if(filetitle===""){
            alert("게시물의 제목을 입력해주세요");
            return false;
            }
            

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
        
        function resetActionFromFileMod(){
        	var buttonValue=""
        
        
        }
        
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
        
<<<<<<< HEAD
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
=======
        function deleteAction(filecode){
       		var loginId = $('.loginId').val();  //로그인 되어 있는 유저 Id
       		var roomId=$('.roomId').val();		//방장 Id
       		var uploadId= $('.uploadId').val();		//파일을 업로드한 유저 Id
       
        
        	if(loginId===uploadId||loginId===roomId){
        		console.log("일치");
        		$.ajax({
        		type: 'POST',
        		url: '/room/deleteUploadedFile',
                data: {filecode: filecode, roomcode:roomcode},
                success: function (data) {
                	alert("파일 삭제 완료");
                	 $('#dynamicContent').html(data);
>>>>>>> fb4436c26a66f19a01489d3052f70cddc242a534
                },
                error: function (xhr, status, error) {
                    console.error("에러 발생:", error);
                }
<<<<<<< HEAD
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
=======
        	});
        	}
        	else{
        		alert("삭제할 수 있는 권한이 없습니다.");
        		return false;
       		}
      	
        }
        
        function goFileModify(filecode){
       		var loginId = $('.loginId').val();  //로그인 되어 있는 유저 Id
       		var roomId=$('.roomId').val();		//방장 Id
       		var uploadId= $('.uploadId').val();		//파일을 업로드한 유저 Id
       
        
        	if(loginId===uploadId||loginId===roomId){
        		console.log("일치");
        		$.ajax({
        		type: 'GET',
        		url: '/room/goFileModify',
                data: {filecode: filecode, roomcode:roomcode},
                success: function (data) {
                	 $('#dynamicContent').html(data);
>>>>>>> fb4436c26a66f19a01489d3052f70cddc242a534
                },
                error: function (xhr, status, error) {
                    console.error("에러 발생:", error);
                }
<<<<<<< HEAD
            });
        }
        
        
function gonoticeEnroll(){

			
        	var buttonValue= document.getElementById("noticeEnrollGo").getAttribute('data-value');
        	
        	
        	$.ajax({
                type: 'GET',
                url: '/room/loadDynamicJSP',
                data: {buttonValue: buttonValue , roomcode:roomcode},
                success: function (data) {
                    $('#dynamicContent').html(data);
=======
        	});
        		
        	}
        	else{
        		alert("수정할 수 있는 권한이 없습니다.");
        		return false;
       		}
      	
        }
        
        function modifyAction(filecode){
        	var filetitle = $('.fileModify_title_sec').val();
        	var content = $('.modifycontent').val();
        	
        	console.log(filetitle, content);
        	
        	if(filetitle===""){
        	alert("수정하실 게시물 제목을 입력해주세요");
        	return false;
        	}
        	$.ajax({
        		type: 'POST',
        		url: '/room/modifyUploadedFile',
                data: {filecode: filecode, roomcode:roomcode, filetitle: filetitle, content: content},
                success: function (data) {
                	 $('#dynamicContent').html(data);
>>>>>>> fb4436c26a66f19a01489d3052f70cddc242a534
                },
                error: function (xhr, status, error) {
                    console.error("에러 발생:", error);
                }
<<<<<<< HEAD
            });
        }        
        
function NoticeEnrollAction(){
        	
        	
      
            var title = $('.title').val();
            var content = $('.content').val();
            var writemember = $('.writemember').val();
           
            
            console.log("roomcode= "+roomcode);
            console.log("title" + title);
            console.log("content= "+content);
            console.log("writemember" + writemember);

            $.ajax({
                type: 'POST',
                url: '/room/roomNoticeEnroll',
                data: {
                	roomcode:roomcode,
                	title:title,
                	content:content,
                	writemember:writemember
                },
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
=======
        	});
        	
        }
        
        function resetActionFromFileMod(filecode){
        	console.log(filecode)
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
        
       
>>>>>>> fb4436c26a66f19a01489d3052f70cddc242a534
