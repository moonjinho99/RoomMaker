<%@page import="com.rm.service.RoomService"%>
<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 방 상세 페이지</title>
  <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }

        h2 {
            color: #333;
        }

        table {
            border-collapse: collapse;
            width: 100%;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        form {
            margin-top: 20px;
        }

        label {
            display: block;
            margin-bottom: 8px;
        }

        .deleteBtn,select {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            box-sizing: border-box;
        }

       .bottomBtn{
       	  margin-top: 50px;
		  background: skyblue;
	      color: white;
	      padding: 10px 15px;
	      border: none;
	      cursor: pointer;
	}

        #header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            border-bottom: 1px solid #000; 
            padding-bottom: 10px;
        }

        #header img {
            max-height: 60px;
            margin: auto; 
        }

    </style>
</head>


<body>
    <h2>방 정보 관리</h2>
    <table id="memberTable">
        <thead>
            <tr>
                <th>방 ID</th>
                <th>방 이름</th>
                <th>방 종류</th>
                <th>참여 인원</th>
                <th>수용 인원</th>
                <th>방장</th>
                <th>방 설명</th>
         
            </tr>
        </thead>
        <tbody>
           	<c:forEach items="${adminInfList}" var="adminIList" varStatus="status">
           		<tr>
           			<input type="hidden" name="roomcode" value="${adminIList.roomcode}">
           			<td>${adminIList.roomcode}</td>
           			<td>${adminIList.title}</td>
           			<c:if test="${adminIList.type == 0}">           		
           				<td>교육기관</td>
           			</c:if>
           			<c:if test="${adminIList.type == 1}">           		
           				<td>프로젝트</td>
           			</c:if>
           			<td>${adminIList.join_member_cnt}</td>
					<td>${adminIList.member_cnt}</td>
					<td>${adminIList.id}</td>
					<td>${adminIList.explanation}</td>
           		</tr>
           	</c:forEach>
        </tbody>
    </table>
    
    <h2>참여중인 회원 관리</h2>
    <table id="roomTable">
        <thead>
            <tr>
                <th>방 ID</th>
                <th>회원 ID</th>
                <th>회원 LEVEL</th>
                <th>탈퇴</th>
            </tr>
        </thead>
        <tbody>
         <c:forEach items="${adminRoomMemberList}" var="adminMRList" varStatus="status">
           		<tr>
           			<td>${adminMRList.roomcode}</td>
           			<td>${adminMRList.id}</td>
           			<c:if test="${adminMRList.roomlevel == 1}">
           				<td>방장</td>
           			</c:if>
           			<c:if test="${adminMRList.roomlevel == 0}">
           				<td>참여자</td>
           			</c:if>
         			<td><input type="button" class="deleteBtn" onclick="deleteRoomMemberList('${adminMRList.id}')" value="탈퇴" style="background: red; color:white;"></td>
           		</tr>
           	</c:forEach> 
        </tbody>
    </table>

    <h2>자료 공유 관리</h2>
    <table id="roomTable">
        <thead>
            <tr>
                <th>방 ID</th>
                <th>파일 ID</th>
                <th>제목</th>
                <th>작성자</th>
                <th>내용</th>
                <th>파일 이름</th>
                <th>작성 일자</th>
                <th>삭제</th>
            </tr>
        </thead>
        <tbody>
         <c:forEach items="${adminFileList}" var="adminFList" varStatus="status">
           		<tr>
           			<td>${adminFList.roomcode}</td>
           			<td>${adminFList.filecode}</td>
           			<td>${adminFList.filetitle}</td>
					<td>${adminFList.filemember}</td>
					<td>${adminFList.content}</td>
					<td>${adminFList.fileName}</td>
					<td>${adminFList.fileuploaddate}</td>
         			<td><input type="button" class="deleteBtn" onclick="deletefileList('${adminFList.filecode}')" value="삭제" style="background: red; color:white;"></td>
           		</tr>
           	</c:forEach> 
        </tbody>
    </table>
    
    <h2>질문 관리</h2>
    <table id="roomTable">
        <thead>
            <tr>
                <th>방 ID</th>
                <th>방 이름</th>
                <th>방 종류</th>
                <th>참여 인원</th>
                <th>수용 인원</th>
                <th>방장</th>
                <th>삭제</th>
            </tr>
        </thead>
        <tbody>
         
        </tbody>
    </table>
    
    <h2>공지 관리</h2>
    <table id="roomTable">
        <thead>
            <tr>
                <th>방 ID</th>
                <th>방 이름</th>
                <th>방 종류</th>
                <th>참여 인원</th>
                <th>수용 인원</th>
                <th>방장</th>
                <th>삭제</th>
            </tr>
        </thead>
        <tbody>
         
        </tbody>
    </table>
    
    <div style="text-align: center;">
    	<input class="bottomBtn" type="button" value="방 삭제" onclick="deleteAll()">
    	<input class="bottomBtn" type="button" value="취소" onclick="cancel()">
    </div>

</body>

<script>


var roomcode = document.getElementsByName("roomcode")[0].value;

function deleteAll()
{
	opener.location.href="/admin/deleteAll?roomcode="+roomcode;
	window.close();
}

function cancel()
{
	opener.location.href="/admin/admin_main";
	window.close();	
}

function deletefileList(filecode)
{
	location.href = "/admin/deleteFileList?roomcode="+roomcode+"&filecode="+filecode;
}

function deleteRoomMemberList(id)
{
	location.href = "/admin/deleteRoomMemberList?roomcode="+roomcode+"&id="+id;
}

</script>
</html>