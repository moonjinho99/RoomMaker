<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage메인</title>
<link rel="stylesheet" href="../resources/css/mypage/main.css" />
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/40.0.0/classic/ckeditor.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
</head>
 <%@ include file="header.jsp" %>
<section>
 <div id="my_main" style="background: #f7fdfe">
 	<div class="my_main_content" style="background: #ebf9f9">
 	<div class="my_inform_content" style="background: #f5f5dc;">
 		
 		<div class="my_informs">
 		<div class="my_image">이미지</div>
 		<span class="my_id">${member.id }</span>
 		<span class="my_name">${member.name }</span>
 		<span class="my_email">EMAIL. ${member.email }</span>
 		<span class="my_phone">PHONE. ${member.phonenum }</span>
 		<div class="my_id">
 		${member.id}
 		</div>
 		<div class="my_name">
 		${member.name }
 		</div>
 		<div class="my_email">
 		EMAIL. ${member.email }
 		</div>
 		<div class="my_phone">
 		PHONE. ${member.phonenum }
 		</div>
 		</div>
 	</div>
 	<input class="myModifyButton" type="button" value="수정하기">
 	</div>
 </div>
</section>