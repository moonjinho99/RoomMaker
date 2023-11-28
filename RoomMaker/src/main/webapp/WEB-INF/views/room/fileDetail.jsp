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
<style>
a{
 text-decoration: none;
 color: black;
 }
 
 section{
 width: 1000px;
    height: 740px;
    font-size: 18px;
    margin-left: 330px;
    padding: 0;
    display: block;
 }
  
#fileUpload_form{
	width: 1000px;
    height: 740px;
    padding: 0;
    display: block;
}
  
.fileDetailTitle{
	margin-top: 25px;
	width: 870px;
	height: 50px;
}

.fileDetailTitle img{
	width: 50px;
	height: 50px;
	float: left;
}

.fileDetailTitle span{
	margin: 0;
	margin-left: 180px;
	width: 400px;
	height: 50px;
	font-size: 2em;
	line-height: 50px;
	font-weight: bold;
	display: block;
}
</style>
</head>
<body>
<%@ include file="roomHeader.jsp" %>
<%@ include file="roomAside.jsp" %>
	<section>
	<div class="fileDetailTitle">
		 	<img class="DetailIcon" src="../resources/images/fileDetailIcon.png">
		 	<span>자료 디테일</span>
		 </div>
		 <form id="fileDetail_form">
		 <div class="fileDetailTitle"><c:out value="${file.filetitle}"/></div>
		 </form>
        <div class="clear"></div>
		        
        
    </section>
<%@ include file="roomFooter.jsp" %>
