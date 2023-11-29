<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<body>
<header style="display: flex;">
        <div class="make_room" style="width: 60%;">
        	<img class="logo" src="../resources/images/logo.png">
            <input type="text" class="find_room" placeholder="방 제목을 입력해주세요" id="keyword">
            <button class="find_room_click"><img src="./resources/images/clickicon.jpg"></button>
            <a href="#" class="mypage" data-text="마이페이지" style="margin-left: 750px;">마이페이지</a>       
        </div>
		<div class="make_room_right" style="margin-left:300px;margin-top:80px; width: 10%;">
			<span style="font-size: 24px;">${member.name}님</span>
		</div>
		<div class="make_room_logout" style="width: 10%">
			<button class="logout">logout</button>
		</div>

</header>

<script>


$(".find_room_click").on("click", function(e){
	
	var keyword = document.getElementById('keyword').value;
	location.href = "/main?keyword="+keyword;
});
</script>
