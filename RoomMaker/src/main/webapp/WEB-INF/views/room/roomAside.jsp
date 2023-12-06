<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<aside>
 <div class="aside_function">
     <div class="clear"></div>
     <button class="room_function">자료공유</button>
     <button class="room_function">채팅하기</button>
     <button class="room_function">질문확인</button>
     <button class="room_function">공지보기</button>
     <button class="room_out" onclick="out()">방 나가기</button>

<input type="hidden" name="roomcode" value="${roomDetail.roomcode}">

 </div>
 
 <script>
 function out()
 {
 	location.href="/main";
 }
 </script>
</aside>