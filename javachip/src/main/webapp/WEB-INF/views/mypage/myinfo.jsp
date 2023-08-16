<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/nav.jsp" %>
	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg" data-setbg="<%= request.getContextPath() %>/resources/img/breadcrumb.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>회원정보 수정</h2>
						<div class="breadcrumb__option">
							<a href="<%= request.getContextPath() %>/">Home</a>
							<a href="main.do">마이페이지 </a>
							<span>회원정보 수정</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->
<section class="join spad">
        <div class="container">
            <div class="join__form">
                <h4>회원정보 수정</h4>
                <form action="#">
                    <div class="join__input">
                    	<p>아이디<span>*</span></p>
                        	<input type="text" class="join__input__short" id="uId" name="uId" value="${login.uId}" disabled/>
                    	<p>비밀번호<span>*</span>&nbsp;&nbsp;<span style="font-size:10pt; color:silver;">대/소문자, 숫자, 특수기호 최소 8자에서 최대 20자</span></p>
                        	<input type="password" class="join__input__short" id="uPw" name="uPw" onblur="checkFn(this)" value="${login.uPw}" disabled/>
                        	<button type="button" class="btn btn-outline-secondary" onclick="sample6_execDaumPostcode()">비밀번호 변경</button>
                        	<div class="msg"></div>
                        <p>비밀번호 확인<span>*</span>&nbsp;&nbsp;<span style="font-size:10pt; color:silver;">위와 같은 비밀번호를 입력하셔야 정보 수정이 완료됩니다.</span></p>
                        	<input type="password" class="join__input__short" id="uPwc" name="uPwc">
                        <p>성명<span>*</span></p>
                        	<input type="text" class="join__input__short" id="uName" name="uName" onblur="checkFn(this)" value="${login.uName}" disabled/>
                        	<div class="msg"></div>
                        <p>주소<span>*</span></p>
	                        <input type="text" placeholder="우편번호" class="join__input__short" id="uAddNum" name="uAdd">
	                        <button type="button" class="btn btn-outline-secondary" onclick="sample6_execDaumPostcode()">우편번호</button>
	                        <input type="text" placeholder="주소" class="join__input__add" id="uAdd1" name="uAdd">
	                        <input type="text" placeholder="나머지 주소" class="join__input__add" id="uAdd2" name="uAdd">
	                        <input type="hidden" name="uAdd_all" id="uAdd_all" value=""/>
                        <p>전화번호<span>*</span></p>
							<input class="join__input__short" type="text" name="uPhone" id="uPhone" onblur="checkFn(this)">
							<div class="msg"></div>
                        <p>이메일<span>*</span></p>
                        	<input type="text" class="join__input__email" name="uMail" id="uMail" onblur="checkFn(this)">
                        	<div class="msg"></div>
                       <c:if test="${login.uStatus eq 'B'}">
	                        <p>상호명(법인명)<span>*</span></p>
	                        	<input type="text" class="join__input__short" id="uBisname" name="uBisname" disabled/>
	                        <p>사업자 등록 번호<span>*</span></p>
	                        	<input type="text" class="join__input__short" name="uBisno" id="uBisno" disabled/>
                        </c:if>
                   	</div>
                   	<hr>
					<div class="join__submit">
						<input type="submit" class="btn btn-primary" value="회원가입">
						<input type="reset" class="btn btn-outline-secondary" value="취소">
					</div>
                </form>
            </div>
        </div>
    </section>
    <script src="<%=request.getContextPath() %>/resources/js/member.js"></script>
<%@ include file="../include/footer.jsp" %>