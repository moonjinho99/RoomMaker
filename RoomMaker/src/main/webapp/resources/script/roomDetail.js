
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
    
    $(".fileUploadGo").click(function(){
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
    
    $(".filebutton").click(function(){
        var roomcode = $('.roomcode').val();
        var filetitle = $('.filetitle').val();
        var filemember = $('.filemember').val();
        var content = $('.content').val();
        var uploadPath = $('.uploadPath').val();
        let formData = new FormData($("#fileUpload_form")[0]);


        $.ajax({
            type: "POST",
            enctype: 'multipart/form-data',
            url: "/room/fileUpload",
            data: formData,
            processData: false,
            contentType: false,
            cache: false,
            timeout: 600000,
            success: function (data) {
                console.log("SUCCESS : ", data);
                window.location.href="/room/fileList";
            },
            error: function (e) {
                console.log("ERROR : ", e);
            }
        });
    });
    
    $(".resetbutton").click(function(){
    	window.location.href="/room/fileList";
    });
    
    
});

function Go(){
	var buttonValue= document.getElementById("fileUploadGo").getAttribute('data-value');
	//var buttonValue = $(this).val().trim();
	alert(buttonValue);
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
        