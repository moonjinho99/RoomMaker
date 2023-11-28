
var roomcode = document.getElementsByName("roomcode")[0].value;
        $(document).ready(function () {
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
    
        
            $(".room_function").click(function () {
                var buttonValue = $(this).text().trim();
                $.ajax({
                    type: 'GET',
                    url: '/room/loadDynamicJSP',
                    data: {buttonValue: buttonValue, roomcode: roomcode },
                    success: function (data) {
                        $('#dynamicContent').html(data);
                    },
                    error: function (xhr, status, error) {
                        console.error("에러 발생:", error);
                    }
                });
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
        