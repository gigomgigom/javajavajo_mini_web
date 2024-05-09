<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"></linkh>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<meta charset="UTF-8">
<style>
</style>
<title>장바구니</title>
</head>

<body>
	<header>
		<%@ include file="/WEB-INF/views/common/header.jsp"%>
	</header>

	<div id="shoppingcart" class="container-fluid d-flex flex-column align-items-center my-5">
		<div class="w-75 row d-flex justify-content-between m-0">
			<div class="col-6 d-flex justify-content-start m-0 mt-4 p-0">
				<h3 class="m-0">장바구니</h3>
			</div>

			<div class="col-6 d-flex justify-content-end m-0 p-0">
				<p class="text-center m-0" style="font-size: 0.75rem;">
					<b>장바구니</b> > 주문,결제 > 완료
				</p>
			</div>
		</div>

		<hr class="w-75 my-1 p-0" />

		<div class="w-75  d-flex justify-content-start align-items-center m-1 p-0">
			<input id="allCheck" onclick="allCheck()" class="m-0 p-0" type="checkbox" style="accent-color: #273740D;"> 
			<label class="form-check-label">전체 선택</label>
		</div>

		<ul class="w-75 my-1 p-0 list-unstyled">
			<c:forEach var="cartItem" items="${cartItems}" >
				<li id="item${cartItem.prodno}" class="row border-top border-bottom m-0 py-1">
					<div class="col-2 row border-end m-0 p-0">
						<div class="form-check col-2 d-flex justify-content-start align-items-center m-0 p-0">
							<input onclick="cancelAllCheck()" class="m-0" type="checkbox" style="accent-color: #27374D;">
						</div>
						<div class="d-flex col-10 justify-content-center align-items-center p-0">
							<img src="${pageContext.request.contextPath}/item/downloadRepimg?prodno=${cartItem.prodno}" class="w-50" height="150">
						</div>
					</div>
	
					<div class="col-3 d-flex flex-column justify-content-center align-items-center border-end p-0">
						<p class="m-0 p-0">상품명</p>
						<a href="#" class="m-0 p-0 text-dark text-decoration-none">${cartItem.product.prodname}</a>
					</div>
	
					<div class="col-3 row d-flex align-items-center border-end m-0 p-0">
						<div class="col-5 d-flex justify-content-end p-0">
							<button onclick="updateItemData(${cartItem.prodno},'-')" type="button"
								class="btn m-1 p-2 text-white" style="background-color: #273740">-</button>
						</div>
						<div class="col-2 text-center p-0">
							<p class="m-0 p-0">개수</p>
							<p id="qty${cartItem.prodno}" class="m-0 p-0">${cartItem.qty}개</p>
						</div>
						<div class="col-5 d-flex justify-content-start p-0">
							<button onclick="updateItemData(${cartItem.prodno},'+')" type="button" 
								class="btn m-1 p-2 text-white" style="background-color: #273740">+</button>
						</div>
					</div>
	
					<div class="col-2 d-flex flex-column justify-content-center align-items-center border-end p-0">
						<p class="m-0 p-0">단품 가격</p>
						<p id="price${cartItem.prodno}" class="m-0 p-0">${cartItem.product.prodprice}원</p>
					</div>
	
					<div class="col-2 d-flex justify-content-center align-items-center p-0">
						<div class="w-75 text-white text-center"style="background-color: #27374D">
							<p class="m-0 p-0">총 액</p>
							<p id="totalPrice${cartItem.prodno}" class="m-0 p-0">${cartItem.product.prodprice * cartItem.qty}원</p>
						</div>
				</li>
			</c:forEach>
		</ul>


		<div class="w-75 d-flex justify-content-start align-items-center m-1">
			<button onclick="deleteSelect()" type="button"
				class="btn text-white p-0" style="background-color: #273740">선택 삭제</button>
		</div>

		<hr class="w-75 my-1 p-0" />
		<form action="${pageContext.request.contextPath}/order/order_form" method="post" class="w-50 m-0 p-0">
			<div id="resultBox" class="w-100 row text-white my-1"
				style="background-color: #273740">
				<div
					class="col-3 d-flex flex-column justify-content-center align-items-center my-2 p-0">
					<p class="m-0 p-0">상품금액</p>
					<p id="itemsPrice" class="m-0 p-0"></p>
					<input id="inputItemsPrice" name="itemsPrice" type="hidden">
				</div>
	
				<div
					class="col-3 d-flex flex-column justify-content-center align-items-center my-2 p-0">
					<p class="m-0 p-0">배달비</p>
					<p id="deliveryPrice" class="m-0 p-0"></p>
					<input id="inputDeliveryPrice" name="deliveryPrice" type="hidden">
				</div>
	
				<div
					class="col-3 d-flex flex-column justify-content-center align-items-center my-2 p-0">
					<p class="m-0 p-0">총금액</p>
					<p id="resultPrice" class="m-0 p-0"></p>
				</div>
	
				<div
					class="col-3 d-flex justify-content-center align-items-center my-2 p-0">
					<div class="w-75 d-flex justify-content-center align-items-center">
						<button type="submit" class="btn btn-light p-1"
							style="color: #273740">주문</button>
					</div>
				</div>
			</div>
		</form>
	</div>

	<footer>
		<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	</footer>
</body>
<script src="/javajavajo_mini_web/resources/js/cart/cart.js"></script>
</html>