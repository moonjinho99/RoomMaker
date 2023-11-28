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

    
     