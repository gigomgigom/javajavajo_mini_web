<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!-- 사용자 정의 자바스크립트 -->
<style>
* {
	margin: 0px;
	padding: 0px;
}
</style>
<!-- jQuery 외부 라이브러리 설정 -->
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Latest compiled and minified CSS -->
<!-- 클라이언트에게 라이브러리 파일을 어디 서버에 다운받을 지 배정받는다. -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<meta charset="UTF-8">
<title>주문서 작성</title>
</head>
<body>
	<!-- header -->
	<%@ include file="/WEB-INF/views/common/header.jsp"%>

	<div style="height: 70px"></div>

	<div id="wrapper"
		class="container-fluid d-flex flex-column align-items-center my-5">
		<!--title-->
		<div
			class="w-75 row d-flex justify-content-between align-items-center m-0">
			<div class="col-6 d-flex justify-content-start m-0 mt-4 p-0">
				<h3>주문서 작성</h3>
			</div>

			<div class="col-6 d-flex justify-content-end m-0 p-0">
				<p class="text-center m-0" style="font-size: 0.75rem;">
					장바구니 > <b>주문,결제</b> > 완료
				</p>
			</div>
		</div>

		<div class="w-75 bg-black my-3" style="height: 5px;"></div>

		<!--주문 상품 리스트 출력-->
		<div class="w-75">
			<ul class="p-0">
				<li class="w-100 row border border-top border-dark m-0">
					<div
						class="col-5 d-flex flex-column justify-content-center align-items-center p-0">
						<p class="m-0 p-0 fw-bold">상품명</p>
					</div>
					<div
						class="col-3 d-flex align-items-center justify-content-center m-0 p-0">
						<p class="m-0 p-0 fw-bold">수량</p>
					</div>
					<div
						class="col-2 d-flex flex-column justify-content-center align-items-center p-0">
						<p class="m-0 p-0 fw-bold">판매단가</p>
					</div>
					<div
						class="col-2 d-flex justify-content-center align-items-center p-0">
						<p class="m-0 p-0 fw-bold">소계</p>
					</div>
				</li>
					<li class="w-100 row border-bottom m-0">
						<div class="col-2 row m-0 p-0">
							<div
								class="d-flex col-10 justify-content-center align-items-center p-0">
								<img src="${pageContext.request.contextPath}/item/downloadRepimg?prodno=${product.prodno}" width="75px">
							</div>
						</div>
						<div
							class="col-3 d-flex flex-column justify-content-center align-items-center p-0">
							<p class="m-0 p-0">${product.prodname}</p>
						</div>
						<div
							class="col-3 d-flex align-items-center justify-content-center m-0 p-0">
							<div>
								<p class="m-0 p-0">${qty.qty}개</p>
							</div>
						</div>
						<div
							class="col-2 d-flex flex-column justify-content-center align-items-center p-0">
							<div>
								<p class="m-0 p-0">${product.prodprice}원</p>
							</div>
						</div>
						<div
							class="col-2 d-flex justify-content-center align-items-center p-0">
							<div class="w-75 text-center">
								<p class="m-0 p-0"></p>
							</div>
						</div>
					</li>
			</ul>
		</div>

		<form class="w-100 d-flex justify-content-center" action="create_order" method="post">
			<div class="w-75 d-flex flex-row border-top border-dark">
				<!--주문정보 입력-->
				<div
					class="col-7 d-flex flex-column justify-content-center border-end border-dark">
					<!--주문자 정보-->
					<div class="ps-5 my-4">
						<h4>
							<b>주문자 정보</b>
						</h4>
					</div>
					<div 
						class="d-flex flex-column align-items-center border-bottom border-dark pb-4" >
						<!--입력란-->
						<div id="orderer" class="w-75 d-flex flex-column">
							<input type="text" class="form-control mb-4" id="ordname"
								placeholder="이름 (필수 입력)" name="ordname" required value="${member.memname}"/> 
							<input type="text" class="form-control mb-4" id="ordtel"
								placeholder="휴대폰번호 (필수 입력)" name="ordtel" required value="${member.memtel}" />
							<div class="d-flex">
								<input type="text" class="form-control mb-4 w-25" id="ordpostno"
									placeholder="우편번호" name="ordpostno" required value="${memberAdr.postno}"/>
								<button type="button" class="btn btn-sm ms-2 text-white"
									style="height: 38px; background-color: #27374D">주소검색</button>
							</div>
							<input type="text" class="form-control mb-4" id="ordadr"
								placeholder="주소 (필수 입력)" name="ordadr" required value="${memberAdr.adr}" /> 
							<input type="text" class="form-control mb-4" id="ordadrdtl"
								placeholder="상세주소 (필수 입력)" name="ordadrdtl" required value="${memberAdr.adrdtl}"/> 
							<input type="email" class="form-control mb-4" id="ordemail"
								placeholder="E-mail (필수 입력)" name="ordemail" required value="${member.mememail}"/>
						</div>
					</div>
					<!--수령인 정보-->
					<div class="ps-5 my-4">
						<h4>
							<b>수령인 정보</b>
						</h4>
					</div>
					<div class="d-flex flex-column align-items-center pb-4">
						<!--입력란-->
						<div class="w-75 mb-2">
							<div class="form-check">
								<input class="form-check-input" type="radio" id="sameasuser" onclick="defaultInfo()"> 
								<label class="form-check-label" for="sameasuser"> 기본 정보와 동일 </label>
							</div>
							<div class="form-check">
								<input class="form-check-input" type="radio" id="sameasorderer" onclick="ordInfo()"> 
								<label class="form-check-label" for="sameasorderer"> 주문자와 동일 </label>
							</div>
						</div>
						<div id="recipient" class="w-75 d-flex flex-column">
							<input type="text" class="form-control mb-4" id="rcptname"
								placeholder="이름 (필수 입력)" name="rcptname" required /> <input
								type="text" class="form-control mb-4" id="rcpttel"
								placeholder="휴대폰번호 (필수 입력)" name="rcpttel" required />
							<div class="d-flex">
								<input type="text" class="form-control mb-4 w-25" id="rcptpostno"
									placeholder="우편번호" name="rcptpostno" required />
								<button type="button" class="btn btn-sm ms-2 text-white"
									style="height: 38px; background-color: #27374D">주소검색</button>
							</div>
							<input type="text" class="form-control mb-4" id="rcptadr"
								placeholder="주소 (필수 입력)" name="rcptadr" required /> 
							<input type="text" class="form-control mb-4" id="rcptadrdtl"
								placeholder="상세주소 (필수 입력)" name="rcptadrdtl" required /> 
							<input type="email" class="form-control mb-4" id="rcptemail"
								placeholder="E-mail (필수 입력)" name="rcptemail" required /> 
							<label for="request">요청사항</label>
							<textarea class="form-control" name="ordrqst" rows="3"></textarea>
						</div>
					</div>
				</div>
				<!--2. 결제정보 입력-->
				<div class="col-5 d-flex flex-column align-items-center">
					<!--2.1 할인정보 사용-->
					<div class="w-100 ps-5 my-4">
						<h4>
							<b>할인 정보 입력</b>
						</h4>
					</div>
					<div
						class="px-2 mb-2 w-75 border d-flex justify-content-between align-items-center"
						style="height: 38px;">
						<span><b>보유중 포인트</b></span> <span id="haspoint">${member.mempoint}</span>
					</div>
					<div
						class="px-2 mb-2 w-75 border d-flex justify-content-between align-items-center"
						style="height: 38px;">
						<span><b>사용할 포인트</b></span> 
						<input type="number" id="discprice" name="discprice" value="0" min="0" max="${member.mempoint}" onchange="usePoint()"   style="width: 100px" />
					</div>
					<div style="height: 20px;"></div>
					<!--2.2 결제 정보-->
					<div class="w-100 ps-5 my-4">
						<h4>
							<b>결제 정보</b>
						</h4>
					</div>
					<!--2.2.1 금액 계산-->
					<div class="w-75 d-flex flex-row border">
						<div
							class="col-4 pt-3 border-end d-flex flex-column align-items-center">
							<p>
								<b>주문 금액</b>
							</p>
							<p id="ordprice" class="mt-3">${itemsPrice}원</p>
							<input type="hidden" name="ordprice" value="${itemsPrice}">
						</div>
						<div
							class="col-4 pt-3 border-end d-flex flex-column align-items-center">
							<p>
								<b>할인 금액</b>
							</p>
							<p id="useprice" class="mt-3">0원</p>
						</div>
						<div class="col-4 pt-3 d-flex flex-column align-items-center">
							<p>
								<b>배송비</b>
							</p>
							<p id="deliveryprice" class="mt-3">${deliveryPrice}원</p>
						</div>
					</div>
					<div class="py-1 w-75 text-center"
						style="background-color: #DDE6ED;">
						<span><b>최종 결제금액 : <span id="finprice">${itemsPrice + deliveryPrice}원</span></b></span>
						<input type="hidden" name="finprice" value="${itemsPrice + deliveryPrice}">
					</div>
					<div style="height: 30px;"></div>
					<!--2.3 결제방식 선택-->
				<!-- 	<div class="w-100 ps-5 my-4">
						<h4>
							<b>결제 방식 선택</b>
						</h4>
					</div>

					<input type="radio" class="btn-check" name="options"
						id="creditcard" autocomplete="off" checked> <label
						class="w-75 btn" for="creditcard"
						style="background-color: #DDE6ED;">신용카드</label> <input
						type="radio" class="btn-check" name="options" id="accounttransfer"
						autocomplete="off" checked> <label
						class="w-75 btn text-white mt-4" for="accounttransfer"
						style="background-color: #27374D;">무통장 입금</label>

					<div style="height: 30px;"></div>

					2.3.1 무통장입금시 예금주명 입력
					<div class="w-75 p-3 d-flex flex-column align-items-center">
						<span><b>입금 계좌 : 3333-06-144-1796 카카오</b></span>

						<div
							class="mt-4 d-flex justify-content-between align-items-center">
							<span><b>예금주</b></span> <input type="text" id="depositor"
								name="despositor" class="form-control w-50" placeholder="예금주 입력"
								required />
						</div>
					</div> -->

					<button class="btn text-white w-75" type="submit"
						style="background-color: #27374D;">결제하기</button>
				</div>
			</div>
		</form>
	</div>

	<div style="height: 150px"></div>

	<!-- Footer -->
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>

	<script src="/javajavajo_mini_web/resources/js/order/orderForm.js"></script>>

</body>
</html>