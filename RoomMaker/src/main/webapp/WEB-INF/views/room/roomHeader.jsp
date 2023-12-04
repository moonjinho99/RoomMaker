<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<header>
        <div class="study_room">
            <img src="../resources/images/study.png" style="opacity: 0.8;">
        </div>
        <div class="user_study" style="background-color: rgba( 255, 255, 255, 0 );">
                <p style="font-size:30px; font-style: bold;">${roomDetail.id}님 공부방<p>
        </div>
        <div class="useroom_title" style="background-color: rgba( 255, 255, 255, 0 );">
            <p style="font-size:30px; font-style: bold;">${roomDetail.title}</p>
        </div>
        <div class="people" style="background-color: rgba( 255, 255, 255, 0 );">
            <p style="font-size:30px; font-style: bold;">${roomDetail.join_member_cnt}/${roomDetail.member_cnt}</p>
        </div>
    </header>