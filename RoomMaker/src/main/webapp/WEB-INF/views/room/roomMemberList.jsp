<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
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
            background-color: skyblue;
        }


        .deleteBtn{
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
            background: red;
            color:white;
        }

    </style>
</style>
<body>
<div style="text-align: center;">
<h2>참여중인 회원</h2>
</div>
<table>
<thead>
	<tr>
		<th>no.</th>
		<th>ID</th>
		<th>이름</th>
		<th>성별</th>
		<th>탈퇴</th>
	</tr>
</thead>
<tbody>
	<c:forEach items="${roomMemberList}" var="roomMember" varStatus="status">
	<tr>
		<td>${status.index+1}</td>
		<td>${roomMember.id}</td>
		<td>${roomMember.name}</td>
		<c:if test="${roomMember.gender == 0}">
			<td>남</td>
		</c:if>
		<c:if test="${roomMember.gender == 1}">
			<td>여</td>
		</c:if>
		<c:if test="${roomMember.id == member.id}">
			<td>방장</td>
		</c:if>
		<c:if test="${roomMember.id != member.id }">
			<td><input class="deleteBtn" type="button" value="탈퇴" onclick="outRoomMember('${roomMember.id}','${roomcode}')"></td>
		</c:if>
	</tr>
	</c:forEach>
</tbody>
</table>
</body>

<script>
function outRoomMember(id, roomcode)
{
	location.href = "/room/deleteRoomMemberList?roomcode="+roomcode+"&id="+id;
}
</script>
</html>