<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
section {
	display: flex;
	width: 65%;
	height: 500px;
	border-bottom: 1px solid black;
}
</style>

</head>
<body>

	<section id="dynamicContent">
		<form action="/room/questionDetail" method="get">
			<div id="questionDetailWrap">
				<input type="hidden" class="loginId" value="${member.id}"> <input
					type="hidden" class="roomId" value="${roomDetail.id}"> <input
					type="hidden" class="uploadId"
					value="${questionDetail.questionmember }">
				<div class="questionDetailTitle">
				<img class="QDetailIcon" src="../resources/images/Q&A.png">
				<span>질문 상세보기</span>
			    </div>
				<div class="questionDetail_title">
					<span> no. ${questionDetail.questioncode}</span> <span
						class="questionDetail_title_sec">
						${questionDetail.questiontitle}</span>
				</div>
				<div class="questionDetail_member">${questionDetail.questionmember}</div>
				<div class="questionDetail_uploaddate">
					<fmt:formatDate pattern="yyyy년 MM월 dd일"
						value="${questionDetail.questiondate}" />
				</div>
				<div class="questionDetail_content">${questionDetail.content}</div>


				<div class="answer_content">
					<c:forEach items="${answer }" var="answer" varStatus="status">
						<div class="answer_detail">
							<img class="enterImg" src="../resources/images/enter.png">
							<div class="answer_detail_div">
							<div class="answer_member">${answer.answermember }</div>
							<c:if test="${roomDetail.id == answer.answermember}">
								<img class="Kingimg" src="../resources/images/King.png">
							</c:if>
							<div class="answer_date">
								<fmt:formatDate value="${answer.answerdate}"
									pattern="yyyy년 MM월 dd일"></fmt:formatDate>
							</div>
							<div class="answer_answer">${answer.answer }</div>
						</div>
						</div>
						<input type="button" class="answer_delete" value="삭제">
						<c:if test="${!status.last }">
						<hr class="hr">
						</c:if>
					</c:forEach>
				</div>

				<div class="buttons">
					<input type="hidden" id="questioncode" name="questioncode"
						value='<c:out value="${questionDetail.questioncode}"/>'> <input
						type="button" id="resetbutton" onclick="resetActionQS()"
						value="취소"> <input type="button" id="deletebutton"
						onclick="deleteAction(${questionDetail.questioncode})" value="삭제">
					<input type="button" id="modifybutton"
						onclick="questionModify(${questionDetail.questioncode})"
						value="수정"> <input type="button" id="answerbutton"
						onclick="answerButton()" value="답변">
				</div>

			</div>

		</form>

		<div class="clear"></div>
	</section>



</body>
</html>