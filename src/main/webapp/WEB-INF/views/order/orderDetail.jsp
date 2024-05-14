<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>
<!-- Latest compiled and minified CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<meta charset="UTF-8">
<meta name="viewport", initial-scale=1.0">
<title>Insert title here</title>
</head>

<body>
	<!-- header -->
	<%@ include file="/WEB-INF/views/common/header.jsp"%>

	<div
		class="my-5 d-flex justify-content-center container-fluid d-flex flex-column"
		style="width: 800px;">
		<div class="d-flex justify-content-center p-2 m-2">
			<h5>주문상세내역</h5>
		</div>
		<div class="container-fluid d-flex flex-column justify-content-center bg-light">
				<div class="p-3 d-flex justify-content-center">
					<span>${order.ordsttschar }</span>
				</div>
				
				<div
					class="mb-3 container-fluid d-flex justify-content-between w-100 pt-3">
					<span><b>주문번호 ${order.ordno}</b></span>
					<span>주문 날짜 <fmt:formatDate value="${order.orddate}" pattern="yyyy-MM-dd"/></span>
				</div>
		</div>

		<c:forEach var="ordprod" items="${ordProdList}" >
		<div class="card mb-3 d-flex justify-content-center container-fluid">
			<div class="row g-0">
				<div class="col-md-1 mt-5">
					<img
						src="${pageContext.request.contextPath}/item/downloadRepimg?prodno=${ordprod.prodno}"
						width="80" height="80" class="img rounded-start"/>
				</div>
				<div class="col-md-11">
						<div class="card-body">
							<h5 class="card-title">${ordprod.prodname}</h5>
							<div class="mx-100%">
								<hr />
								<div class="col text-end">
									<div id="reviewButton${ordprod.prodno}">
									<c:if test="${ordprod.hasReview == false and order.ordsttschar == '완료'}">
										<button type="button" class="btn btn-dark btn-sm" onclick="showModal(${ordprod.prodno})"
											  data-bs-toggle="modal" data-bs-target="#myModal">사용후기 쓰기</button>
									</c:if>
									
									<c:if test="${ordprod.hasReview == true or order.ordsttschar != '완료'}">
										<a prodno=${ordprod.prodno} href='${pageContext.request.contextPath}/item/item_detail?prodno=${ordprod.prodno}' 
											class='btn btn-dark btn-sm'>상품으로 이동</a>
									</c:if>
									
									</div>
									<hr />
									<div class="container mt-3">
										<div class="d-flex">
											<div class="container-fluid d-flex justify-content-between">
												<span>판매가
													
												</span> <span><fmt:formatNumber value="${ordprod.prodprice}" pattern="#,###" />원
													
												</span>
											</div>
											<div class="container-fluid d-flex justify-content-between">
												<span>수량
													
												</span> <span>${ordprod.qty}개
													
												</span>
											</div>
	
										</div>
										<div
											class="container-fluid d-flex justify-content-between border bg-light p-2">
											<span>주문금액</span> <span><fmt:formatNumber value="${ordprod.subtot}" pattern="#,###" />원</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
		<div class="border border-2 container-fluid"></div>

		<div class="mt-4">
			<h5>주문하신 분</h5>
			<hr />
			<div class="container-fluid d-flex justify-content-between">
				<span>이 름</span> <span>${orderer.ordname}</span>
			</div>
			<hr />
			<div class="container-fluid d-flex justify-content-between">
				<span>핸드폰</span> <span>${orderer.ordtel}</span>
			</div>
			<hr />
			<div class="container-fluid d-flex justify-content-between">
				<span>우편번호</span> <span>${orderer.ordpostno}</span>
			</div>
			<hr />
			<div class="container-fluid d-flex justify-content-between">
				<span>주소</span> <span>${orderer.ordadr}${orderer.ordadrdtl}</span>
			</div>
			<hr />
			<div class="container-fluid d-flex justify-content-between">
				<span>E-mail</span> <span>${orderer.ordemail}</span>
			</div>
			<hr />


		</div>

		<div class="mt-4">
			<h5>받으시는 분</h5>
			<hr />
			<div class="container-fluid d-flex justify-content-between">
				<span>이 름</span> <span>${recipient.rcptname}</span>
			</div>
			<hr />
			<div class="container-fluid d-flex justify-content-between">
				<span>핸드폰</span> <span>${recipient.rcpttel}</span>
			</div>
			<hr />
			<div class="container-fluid d-flex justify-content-between">
				<span>우편번호</span> <span>${recipient.rcptpostno}</span>
			</div>
			<hr />
			<div class="container-fluid d-flex justify-content-between">
				<span>주소</span> <span>${recipient.rcptadr}${recipient.rcptadrdtl}</span>
			</div>
			<hr />
			<div class="container-fluid d-flex justify-content-between">
				<span>E-mail</span> <span>${recipient.rcptemail}</span>
			</div>
			<hr />
		</div>

		<div class="mt-4">
			<h5>배송정보</h5>
			<hr />
			<div class="container-fluid d-flex justify-content-between">
				<span>배송회사</span> <span>우체국 배송조회(문의전화: 1855-1300)</span>
			</div>
			<hr />
			<div class="container-fluid d-flex justify-content-between">
				<span>운송장번호</span> <span>6861581676379</span>
			</div>
			<hr />
			<div class="container-fluid d-flex justify-content-between">
				<span>배송일시</span> <span>2024-03-21 13:14:11</span>
			</div>
			<hr />
			<div class="mt-4">

				<div class="container-fluid border bg-light m-2 p-2">
					<div class="container-fluid d-flex justify-content-between p-2">
						<span>주문총액</span> <span><fmt:formatNumber value="${order.ordprice}" pattern="#,###" />원</span>
					</div>
					<div class="container-fluid d-flex justify-content-between p-2">
						<span>배달비</span> <span><fmt:formatNumber value="${order.ordprice>100000 ? 0: 3000}" pattern="#,###" />원</span>
					</div>
					<div class="container-fluid d-flex justify-content-between p-2">
						<span>할인 금액</span> <span><fmt:formatNumber value="${order.discprice}" pattern="#,###" />원</span>
					</div>
					<div class="container-fluid d-flex justify-content-between p-2">
						<span>적립포인트</span> <span><fmt:formatNumber value="${order.finprice/100 * 5}" pattern="#,###" />원</span>
					</div>
					<hr />
					<div class="container-fluid d-flex justify-content-between p-2">
						<span class="fw-bold">총계</span> <span class="fw-bold"><fmt:formatNumber value="${order.finprice}" pattern="#,###" />원</span>
					</div>
				</div>

				<div class="mt-3">
					<div class="border border-2"></div>
					<div class="container-fluid d-flex justify-content-center mb-3">
					</div>
					<c:if test="${order.ordsttschar != '주문 취소' and order.ordsttschar != '완료'}">
						<div class="container-fluid">
							<a href="${pageContext.request.contextPath}/order/cancel_order?ordno=${order.ordno}" 
								class="btn btn-secondary w-100 mb-3">주문취소하기</a>
						</div>
					</c:if>
				</div>
			</div>
		</div>
	</div>
	</div>
	</div>
	<!-- Footer -->
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	<%@ include file="/WEB-INF/views/order/write_review_modal.jsp"%>
</body>
<script src="/javajavajo_mini_web/resources/js/order/orderDetail.js"></script>>
</html>