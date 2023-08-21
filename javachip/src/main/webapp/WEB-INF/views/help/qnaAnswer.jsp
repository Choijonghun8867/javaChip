<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/nav.jsp" %>

<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/qna.css" type="text/css"/>

<script src="<%=request.getContextPath() %>/resources/js/qna.js"></script>
<script>
function qnaAnswerFn() {

		var formData = $("#submitFrm").serialize();
		var qAnswer =  $("#qAnswer").html();
		
		$.ajax({
			url:"qnaAnswer.do",
			type:"post",
			data:formData+"&qAnswer=" + qAnswer,
			dataType:"json",
			success:function(data) {
				alert(data.result);
				location.replace(data.path);
			},
			error:function() {
				
				alert('게시글 등록에 실패하였습니다.');
				var url = "qna.do";
				location.replace(url);
			}
		});
		
}
</script>
	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg" data-setbg="<%= request.getContextPath() %>/resources/img/breadcrumb.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>글 쓰기</h2>
						<div class="breadcrumb__option">
							<a href="<%= request.getContextPath() %>/">Home</a>
							<a href="#">고객센터</a>
							<span>QnA 글 쓰기</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="board-box spad">
		<div class="container">
			<div class="write-form">
				<form id="submitFrm" method="post">
					<div class="d-flex flex-column bd-highlight mb-3">
						<div class="p-2 bd-highlight">
							<h4>Qna 답변</h4>
						</div>
						<table class="table" style="margin-top:40px; margin-bottom:50px; font-size:11pt; text-align:left">
							<tr>
								<td style="width:12%">제목
									<input type="hidden" name="qNo" value="${ qnaVO.qNo }">
								</td>
								<td colspan="2">
									${qnaVO.qTitle}
								</td>
							</tr>
							<tr>
								<td>작성자</td>
								<td colspan="2">${qnaVO.uName}</td>
							</tr>
						<c:if test="${qnaVO.qType eq 'P'}">
							<tr style="height:120px;">
								<td style="vertical-align:middle;">문의 상품</td>
								<td style="vertical-align:middle; text-align:center; width:20%">(사진)</td>
								<td>${qnaVO.pNo}</td>
							</tr>
						</c:if>
							<tr style="font-color:gray; font-size:10pt;">
								<td colspan="2">작성일  ${qnaVO.qDate}</td>
							</tr>
							<tr>
								<td colspan="3" style="white-space:pre-line;">${qnaVO.qContents}</td>
							</tr>
						</table>
					</div>
					<div class="p-2 bd-highlight" style="text-align:right">
						<p>비밀글  <input type="checkbox" value="${qnaVO.secretYN}" <c:if test="${qnaVO.secretYN eq 'Y'}">checked</c:if> disabled /></p>
					</div>
					<div class="p-2 bd-highlight">
						<div class="form-control textbox" id="qAnswer" contentEditable="true" >
						</div>
					</div>
					<div class="p-2 bd-highlight">
						<div class="input-group mb-1">
							<div class="custom-file">
								<input type="file" class="custom-file-input" id="inputGroupFile02">
								<label class="custom-file-label" for="inputGroupFile02" aria-describedby="inputGroupFileAddon02">Choose file</label>
							</div>
						</div>
					</div>
					<div class="p-2 bd-highlight" align="center">
						<button type="button" class="btn btn-outline-secondary" style="margin-right:20px;" onclick="helpResetFn">취소하기</button>
						<button type="button" class="btn btn-dark" onclick="qnaAnswerSubmitFn();">작성하기</button>
					</div>
				</form>
			</div>
		</div>
	</section>
<%@ include file="../include/footer.jsp" %>