<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/nav.jsp" %>
<%@ page import="java.util.List" %>
<%@ page import="com.javachip.vo.ProductVO" %>
<%@ page import="com.javachip.vo.ReviewVO" %>
<%
	ProductVO pv = (ProductVO)request.getAttribute("pv");
	List<ReviewVO> reviewList = (List<ReviewVO>)request.getAttribute("reivewList");
	// boolean canReview = (boolean)request.getAttribute("canReview");
%>
<script>
	function addCartFn() {
		$.ajax({
			url:"addCart.do",
			type:"post",
			data:{
				pNo:$("#pNo").val(),
				cCount:$("#cCount").val()
			},
			success:function(data) {
				if(data == 1) {
					if(confirm("장바구니에 추가되었습니다. 장바구니로 이동하시겠습니까?")) {
						location.href="<%= request.getContextPath() %>/mypage/cart.do";
					}
				}else if(data == 2) {
					if(confirm("이미 장바구니에 있는 상품입니다. 장바구니로 이동하시겠습니까?")) {
						location.href="<%= request.getContextPath() %>/mypage/cart.do";
					}
				}else if(data == -1) {
					alert("로그인이 필요한 서비스입니다.");
					location.href="<%= request.getContextPath() %>/member/login.do";
				}else {
					alert("오류가 발생했습니다.");
				}
			},
			error:function(){
				alert("오류가 발생했습니다.");
			}
		});
	}
	
	function buyNowFn() {
		var pNo = $("#pNo").val();
		var cCount = $("#cCount").val();
		document.location.href="buyNow.do?pNo="+pNo+"&cCount="+cCount;
	}
	
	function reviewWriteFn() {
		$.ajax({
			url:"reviewWrite.do",
			type:"post",
			data:"rContents="+$("#rContents").val(),
			success:function(data) {
				if(data == 1) {
					alert("후기가 작성되었습니다.");
					location.reload();
				}else {
					alert("오류가 발생했습니다.");
				}
			},
			error:function() {
				alert("오류가 발생했습니다.");
			}
		});
	}
	
	function shareTwitter() {
	    var sendText = "자바칩 프라페"; // 전달할 텍스트
	    var sendUrl = "javachip.com/"; // 전달할 URL
	    window.open("https://twitter.com/intent/tweet?text=" + sendText + "&url=" + sendUrl);
	}
	function shareFacebook() {
	    var sendUrl = "javachip.com/"; // 전달할 URL
	    window.open("http://www.facebook.com/sharer/sharer.php?u=" + sendUrl);
	}
</script>
<!-- 메인 작성 영역 -->
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="<%= request.getContextPath() %>/resources/img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>${pv.pName}</h2>
                        <div class="breadcrumb__option">
                            <a href="<%= request.getContextPath() %>">홈</a>
                            <a href="grid.do">항목</a>
                            <span>${pv.pName}</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Product Details Section Begin -->
    <section class="product-details spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__pic">
                        <div class="product__details__pic__item">
                            <img class="product__details__pic__item--large"
                                src="<%= request.getContextPath() %>/resources/img/product/details/product-details-1.jpg" alt="">
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__text">
                        <h3>${pv.pName}</h3>
                        <div class="product__details__price">${pv.pPrice}원</div>
                        <p>${pv.pNote}</p>
                        <div class="product__details__quantity">
                            <div class="quantity">
                                <div class="pro-qty">
                                    <input type="text" name="cCount" id="cCount" value="1"  oninput="this.value=this.value.replace(/[^0-9]/g,'');">
                                </div>
                            </div>
                        </div>
                    	<input type="hidden" name="pNo" id="pNo" value="${pv.pNo}">
                        <a href="javascript:addCartFn()" class="primary-btn">장바구니에 추가</a>
                        <a href="javascript:buyNowFn()" class="primary-btn" style="background-color:#DD5555">바로 구매</a>
                        <ul>
                            <li><b>판매상태</b> <span>재고 있음</span></li>
                            <li><span style="float:left;"><b>옵션</b></span>
                            	<select>
                            		<option>커피 원두 에티오피아산 100g</option>
                            		<option>200g</option>
                            		<option>500g</option>
                            	</select><br><br><br>
                            </li>
                            <li><b>배송정보</b> <span>평균 1일 소요 <samp>배송비 무료</samp></span></li>
                            <li><b>공유하기</b>
                                <div class="share">
                                    <a href="javascript:shareFacebook()"><i class="fa fa-facebook"></i></a>
                                    <a href="javascript:shareTwitter()"><i class="fa fa-twitter"></i></a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="product__details__tab">
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab"
                                    aria-selected="true">상품정보</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab"
                                    aria-selected="false">후기</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab"
                                    aria-selected="false">QnA</a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="tabs-1" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <h6>상품정보</h6>
                                    <p>${pv.pDetail}</p>
                                </div>
                            </div>
                            <div class="tab-pane" id="tabs-2" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <table class="table table-hover">
									  <thead>
									    <tr>
									      <th scope="col" width="15%">작성자</th>
									      <th scope="col">내용</th>
									      <th scope="col" width="15%">작성일</th>
									    </tr>
									  </thead>
									  <tbody>
										  <c:choose>
										  	<c:when test="${empty reviewList}">
										  		<tr>
										  			<td colspan="2">작성된 리뷰가 없습니다.</td>
										  		</tr>
										  	</c:when>
										  	<c:otherwise>
											  	<c:forEach items="${reviewList}" var="review">
											    <tr>
											      <td>${reviewList.uName}</td>
											      <td>${reviewList.rContents}</td>
											      <td>${reviewList.rDate}</td>
											    </tr>
											  	</c:forEach>
										  	</c:otherwise>
										  </c:choose>
										  <%-- <c:if test="${canReview}"> --%>
										    <tr>
										      <td>작성자</td>
										      <td><textarea name="rContents" id="rContents"
										      	style="width:95%; height:100%; border:solid 1px #e8e8e8; resize:none;"></textarea></td>
										      <td><button type="button" class="btn btn-dark" onclick="reviewWriteFn()">후기 등록</button></td>
										    </tr>
										  <%-- </c:if> --%>
									  </tbody>
									</table>
                                </div>
                            </div>
                            <div class="tab-pane" id="tabs-3" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <table class="table table-hover">
									  <thead>
									    <tr>
									      <th scope="col" width="5%">#</th>
									      <th scope="col">제목</th>
									      <th scope="col" width="15%">작성자</th>
									      <th scope="col" width="15%">작성일</th>
									    </tr>
									  </thead>
									  <tbody>
									    <tr>
									      <th scope="row">1</th>
									      <td>Otto</td>
									      <td>Mark</td>
									      <td>2023-07-21</td>
									    </tr>
									    <tr>
									      <th scope="row">2</th>
									      <td>Thornton</td>
									      <td>Jacob</td>
									      <td>2023-07-21</td>
									    </tr>
									  </tbody>
									</table>
									<button type="button" class="btn btn-dark">Q&A 등록</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Product Details Section End -->
<!-- 메인 작성 영역 -->
<%@ include file="../include/footer.jsp" %>