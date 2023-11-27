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
	
	
	
<script th:src="@{/webjars/jquery/jquery.min.js}"></script>
<script>
        $(document).ready(function () {
            $(".room_function").click(function () {
                var buttonValue = $(this).text().trim();
                $.ajax({
                    type: 'GET',
                    url: '/room/loadDynamicJSP',
                    data: {buttonValue: buttonValue},
                    success: function (data) {
                        $('#dynamicContent').html(data);
                    },
                    error: function (xhr, status, error) {
                        console.error("에러 발생:", error);
                    }
                });
            });
            
            
            
        });
    </script>
<%@ include file="roomFooter.jsp" %>

