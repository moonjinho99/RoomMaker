<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
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
		 <div class="fileUploadGo_div"><input type="button" onclick="goFileUpload()" id="fileUploadGo" class="fileUploadGo" value="자료등록">
		 </div>
		 <table>
		<tr>
		<th width="100">no.</th><th width="300" class="notFirst">제목</th><th width="200" class="notFirst">공유자</th><th width="300" class="notFirst">공유일</th>
		</tr>
		
		 <c:forEach items="${list}" var="list" varStatus="status">
		<tr>
		<td>${list.filecode}</td><td><a class="filetitlea" onclick="goFileDetail(${list.filecode})">${list.filetitle}</a></td><td>${list.filemember }</td><td> <fmt:formatDate value="${list.fileuploaddate}" pattern="yyyy년 MM월 dd일" ></fmt:formatDate> </td>
		</tr>
		
		 </c:forEach> 
		</table>
		</form>
		<div style="display: block; text-align: center; margin-top:20px" class="pagemove">	
		<input type="hidden" class="startPage" name="startPage" value="${paging.startPage}">
		<input type="hidden" class="endPage" name="endPage" value="${paging.endPage}">
		<input type="hidden" class="cntPerPage" name="cntPerPage" value="${paging.cntPerPage}">	
			
		<c:if test="${paging.startPage != 1 }">
			<a onclick="beforeAction()" class="before">◀이전</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b style="color:skyblue;">${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="/main?nowPage=${p }&cntPerPage=${paging.cntPerPage}">다음▶</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a onclick="afterAction()"  class="next">다음▶</a>
		</c:if>
	</div> 
        <div class="clear"></div>
        
    </div>
    <section id="dynamicContent">

   		<div class="clear" style="float:left;"></div>
     	<div th:include="${'defaultJSP'} :: content"></div>
	</section>
	
<script>
function goFileUpload(){
	var buttonValue= "자료등록";
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

