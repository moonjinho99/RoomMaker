<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<header>
        <div class="study_room">
            <img src="../resources/images/study.png">
        </div>
        <div class="user_study">
                ${roomDetail.id}님 공부방
        </div>
        <div class="useroom_title">
            ${roomDetail.title}
        </div>
        <div class="people">
            ${roomDetail.join_member_cnt}/${roomDetail.member_cnt}
        </div>
    </header>