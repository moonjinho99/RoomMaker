<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<header>
        <div class="study_room">
            <img src="../resources/images/study.png" style="opacity: 0.8;">
        </div>
        <div class="user_study" style="background-color: #ecf9fa; opacity: 0.7;">
                <p style="font-size:30px; font-style: bold; border-radius: 10px; ">${roomDetail.id}님 공부방<p>
        </div>
        <c:if test ="${roomDetail.id == member.id}">
        	<div class="master_update_btn" style="background-color: rgba( 255, 255, 255, 0 );">
                <button 
                	 style="font-size:20px; font-style: bold; 
                	 padding:20px; background: skyblue; color:white; padding: 10px 30px;
   					 box-shadow: 0 5px 15px rgba(0,0,0,0.20);
    				 border-radius: 10px; "
    				 >방수정</button>
        	</div>
        </c:if>
        
        <div class="useroom_title" style="background-color: #ecf9fa; opacity: 0.7;">
            <p style="font-size:30px; font-style: bold;">${roomDetail.title}</p>
        </div>
        <div class="people" style="background-color: #ecf9fa; opacity: 0.7;">
            <p style="font-size:30px; font-style: bold;">${roomDetail.join_member_cnt}/${roomDetail.member_cnt}</p>
        </div>
    </header>
   