<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>room메인</title>
<link rel="stylesheet" href="./resources/css/main.css" />
<link rel="stylesheet" href="./resources/css/header.css" />
<link rel="stylesheet" href="./resources/css/footer.css" />
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
                <div class="many_room">
                    <div class="room_info">
                        <div class="room_icon">

                        </div>
                        <div class="room_title">
                            
                            <div class="room_number">
                                <div style="margin-left: -10px; "><span>100</span></div>
                                <div class="room_name" style="text-align: center;">
                                    대우
                                </div>
                            </div>
                            <div class="room_sub_title">
                                <div style="width: 50%;">이병길</div>
                                <div style="display: flex;">
                                <div>
                                    5/20
                                </div>
                                <div class="people_icon">
                                    
                                </div>
                            </div>

                            </div>
                        </div>
                        
                    </div>
                </div>
                <div class="many_room">
                    <div class="room_info">
                        <div class="room_icon">

                        </div>
                        <div class="room_title">
                            
                            <div class="room_number">
                                <div style="margin-left: -10px;"><span>100</span></div>
                                <div class="room_name" style="text-align: center;">
                                    대우
                                </div>
                            </div>
                            <div class="room_sub_title">
                                <div style="width: 50%;">이병길</div>
                                <div style="display: flex;">
                                <div>
                                    5/20
                                </div>
                                <div class="people_icon">
                                    
                                </div>
                            </div>

                            </div>
                        </div>
                        
                    </div>
                </div>
                <div class="many_room">
                    <div class="room_info">
                        <div class="room_icon">

                        </div>
                        <div class="room_title">
                            
                            <div class="room_number">
                                <div style="margin-left: -10px;"><span>100</span></div>
                                <div class="room_name" style="text-align: center;">
                                    대우
                                </div>
                            </div>
                            <div class="room_sub_title">
                                <div style="width: 50%;">이병길</div>
                                <div style="display: flex;">
                                <div>
                                    5/20
                                </div>
                                <div class="people_icon">
                                    
                                </div>
                            </div>

                            </div>
                        </div>
                        
                    </div>
                </div>
                <div class="many_room">
                    <div class="room_info">
                        <div class="room_icon">

                        </div>
                        <div class="room_title">
                            
                            <div class="room_number">
                                <div ><span>100</span></div>
                                <div class="room_name" style="text-align: center;">
                                    대우
                                </div>
                            </div>
                            <div class="room_sub_title">
                                <div style="width: 50%;">이병길</div>
                                <div style="display: flex;">
                                <div>
                                    5/20
                                </div>
                                <div class="people_icon">
                                    
                                </div>
                            </div>

                            </div>
                        </div>
                        
                    </div>
                </div>
                <div class="many_room">
                    <div class="room_info">
                        <div class="room_icon">

                        </div>
                        <div class="room_title">
                            
                            <div class="room_number">
                                <div style="margin-left: -10px;"><span>100</span></div>
                                <div class="room_name" style="text-align: center;">
                                    대우
                                </div>
                            </div>
                            <div class="room_sub_title">
                                <div style="width: 50%;">이병길</div>
                                <div style="display: flex;">
                                <div>
                                    5/20
                                </div>
                                <div class="people_icon">
                                    
                                </div>
                            </div>

                            </div>
                        </div>
                        
                    </div>
                </div>

                <div class="many_room">
                    <div class="room_info">
                        <div class="room_icon">

                        </div>
                        <div class="room_title">
                            
                            <div class="room_number">
                                <div style="margin-left: -10px;" ><span>100</span></div>
                                <div class="room_name" style="text-align: center;">
                                    대우
                                </div>
                            </div>
                            <div class="room_sub_title">
                                <div style="width: 50%;">이병길</div>
                                <div style="display: flex;">
                                <div>
                                    5/20
                                </div>
                                <div class="people_icon">
                                    
                                </div>
                            </div>

                            </div>
                        </div>
                        
                    </div>
                </div>
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