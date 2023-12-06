<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방 수정</title>
<style>
    section {
        vertical-align: middle;
        display: table-cell;
        width: 100%;
        height: 500px;
        border-bottom: 1px solid black;
    }

    input {
        width: 80%;
        font-size: 24px;
        margin: 5px;
    }

    .updateDiv {
        margin: 0 auto;
        clear: both;
    }

    table {
        width: 800px;
        margin-right: 20px;
    }

    td {
        padding: 10px;
    }
    
    .buttonContainer {
    text-align: center;
    margin-top: 10px;
	}

	.update, .delete, .cancel {
	    width: 100px;
	    height: 50px;
	    margin: 10px;
	    display: inline-block;
	}
</style>

<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/40.0.0/classic/ckeditor.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
</head>
<body>

<div style="width:100%;">
    <p style="text-align: center; font-size:24px;">방수정</p>
</div>
<input type="hidden" name="roomcode" value="${roomDetail.roomcode}">
<input type="hidden" name="join_member_cnt" value="${roomDetail.join_member_cnt}">
<input type="hidden" name="title" value="${roomDetail.title}">
<input type="hidden" name="id" value="${roomDetail.id}">
<div class="updateDiv">
    <table>
        <tr>
            <td>방제목</td>
            <td><input type="text" name="update_title" value="${roomDetail.title}"></td>
        </tr>
        <tr>
            <td>방암호</td>
            <td><input type="password" style="font-family: serif;" name="update_password" value="${roomDetail.roompw}"></td>
        </tr>
        <tr>
            <td>수용 인원 수</td>
            <td><input type="text" name="update_member_cnt" value="${roomDetail.member_cnt}"></td>
        </tr>
        <tr>
            <td>설명</td>
            <td><input type="text" name="update_explanation" value="${roomDetail.explanation}"></td>
        </tr>
        <tr>
            <td>참여 회원 보기</td>
            <td><a href="#" onclick="roomMember()" style="color:red;">보기</a></td>
        </tr>
    </table>

    <div class="buttonContainer" style=" width:100%; height:100px;">
        <button class="update" onclick="updateRoom()">수정</button>
        <button class="delete" onclick="deleteRoom()">삭제</button>
        <button class="cancel" onclick="cancel()">취소</button>
    </div>
</div>

</body>

<script>
	var roomcode = document.getElementsByName("roomcode")[0].value;
	var beforetitle = document.getElementsByName("title")[0].value;
	
	function updateRoom()
	{
		var roomtitle = document.getElementsByName("update_title")[0].value;
		var roompw = document.getElementsByName("update_password")[0].value;
		var member_cnt = document.getElementsByName("update_member_cnt")[0].value;
		var explanation = document.getElementsByName("update_explanation")[0].value;
		var join_member_cnt = document.getElementsByName("join_member_cnt")[0].value;
		
		$.ajax({
    		type: 'GET',
    		url: '/room/updateRoom',
            data: {
            	roomcode:roomcode,
            	title:roomtitle,
            	roompw:roompw,
            	member_cnt:member_cnt,
            	join_member_cnt:join_member_cnt,
            	explanation:explanation
            },
            success: function (data) {
            	alert(beforetitle+"방이 수정되었습니다.");
            	location.href="/room/roomDetail?roomcode="+roomcode;
            },
            error: function (xhr, status, error) {
                console.error("에러 발생:", error);
            }
      	});
		
	}
	
	function roomMember()
	{
		var url = '/room/roomMemberList?roomcode='+roomcode;
        window.open(url,"_blank_1","toolbar=no , menubar=no, scrollbars=yes,resizeble=no, width=400,height=600");
	}
	
	function deleteRoom()
	{      	
   		 $.ajax({
    		type: 'GET',
    		url: '/room/deleteRoom',
            data: {roomcode:roomcode},
            success: function (data) {
            	alert(beforetitle+"방이 삭제되었습니다.");    
            	location.href="/main";
            },
            error: function (xhr, status, error) {
                console.error("에러 발생:", error);
            }
      	});
	}
	
	function cancel()
	{
		location.href="/room/roomDetail?roomcode="+roomcode;
	}
</script>
</html>