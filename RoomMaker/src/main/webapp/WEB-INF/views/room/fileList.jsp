
<style>
    section {
    	display: flex;
        width: 60%;
        height: 500px;
        border-bottom: 1px solid black;
       
    }
</style>

	<div>
		<form id="fileList_form">
		<div class="fileUploadTitle">
		 	<img class="ListIcon" src="../resources/images/fileListIcon.png">
		 	<span>자료 리스트</span>
		 </div>
		 <div class="fileUploadGo_div"><a onclick="go()" data-value="자료 등록" id="fileUploadGo" class="fileUploadGo" >자료 등록</a>
		 </div>
		 <table>
		<tr>
		<th width="100">no.</th><th width="400" class="notFirst">제목</th><th width="200" class="notFirst">공유자</th><th width="200" class="notFirst">공유일</th>
		</tr>
		
		 <c:forEach items="${list}" var="list" varStatus="status">
		<tr>
		<td>${status.count}</td><td>${list.filetitle}</td><td>${list.filemember }</td><td><fmt:formatDate value="${list.fileuploaddate}" type="both" pattern="yyyy년 MM월 dd일"/></td>
		</tr>
		
		 </c:forEach>
		</table>
		</form>
        <div class="clear"></div>
        
    </div>
    <section id="dynamicContent">
    <div class="clear" style="float:left;"></div>
    <!-- 채팅화면 -->
     <div th:include="${'defaultJSP'} :: content"></div>
</section>
<script>
function go()
{
   
   var buttonValue = document.getElementById("uploadId").getAttribute('data-value');
   
   $.ajax({
        type: 'GET',
        url: '/room/loadDynamicJSP',
        data: {buttonValue: buttonValue , roomcode:roomcode},
        success: function (data) {
            $('#dynamicContent').html(data);
        },
        error: function (xhr, status, error) {
            console.error("에러 발생:", error);
        }
    });
}
</script>

