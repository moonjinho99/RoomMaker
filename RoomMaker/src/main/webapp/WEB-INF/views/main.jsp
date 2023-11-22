<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>room메인</title>
<link rel="stylesheet" href="./resources/css/main.css?v=1" />
<link rel="stylesheet" href="./resources/css/header.css?v=1" />
<link rel="stylesheet" href="./resources/css/footer.css?v=1" />
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/40.0.0/classic/ckeditor.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<style type="text/css">
	#result_card img{
		max-width: 100%;
	    height: auto;
	    display: block;
	    padding: 5px;
	    margin-top: 10px;
	    margin: auto;	
	}
</style>

</head>

	<%@ include file="header.jsp" %>
    <section>
        <div id="main_room">
            <div class="main_room_top">
                <button class="room_button" onclick="location.href='room/makeRoom';"><span>방만들기</span></button>
                <button class="room_button" style="margin-left: 400px;"><span>방리스트</span></button>
                <button class="room_button"><span>친구 보기</span></button>
            </div>
            <div class="main_room_section">
            
            <c:forEach items="${roomList}" var="roomList">
            	
                <div class="many_room">
                	<a href='/room/roomDetail?roomcode=<c:out value="${roomList.roomcode}"/>'>

                    <div class="room_info">
                    
                        <div class="room_icon">
                        
                        <div class="form_section">
                    			<div class="form_section_title">
                    				<label>상품 이미지</label>
                    			</div>
                    			<div class="form_section_content">

									<div id="uploadReslut">
																		
									</div>
                    			</div>
                    		</div>

                        </div>
                        
                        <div class="room_title">
                            
                            <div class="room_number">
                                <div style="margin-left: -10px; ">
                                <span>${roomList.roomcode}</span>
                                </div>
                                <div class="room_name" style="text-align: center;">
                                    ${roomList.title}
                                </div>
                            </div>
                            <div class="room_sub_title">
                                <div style="width: 50%;">${roomList.id}</div>
                                <div style="display: flex;">
                                <div>
                                    ${roomList.join_member_cnt}/${roomList.member_cnt}
                                </div>
                                <div class="people_icon">
                                    
                                </div>
                            </div>

                            </div>
                        </div>
                        
                    </div>
                    </a>
                </div>
            
                </c:forEach>
            </div>
        </div>
                

        <div class = "section_footer">
			<input type="button" class = "btn1" value="◀이전" onclick = "back()"/>
			-
			<span id = "page_number">1</span>
			-
			<input type="button" class = "btn2" value="다음▶"/>
		</div>
    </section>
   
<%@ include file="footer.jsp" %>