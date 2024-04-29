<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- 사용자 정의 자바스크립트 -->
<script>
		
		</script>
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
<title>Insert title here</title>
</head>
<body>
	<!-- header -->
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<div style="height: 100px"></div>
	<div class="container-fluid d-flex flex-column align-items-center">
		<h1 class="my-3">주문 내역</h1>
		<hr class="w-50 m-0 my-3 p-0" />
		<div class="w-50 d-flex flex-column align-items-center">
			<div class="w-100 border mb-2 p-3">
				<div class="d-flex justify-content-between m-0 mb-2 p-0">
					<div class="d-flex flex-column">
						<p class="m-0 p-0">
							<a class="text-dark"
								href="${pageContext.request.contextPath}/order/orderDetail">202404181758268</a>
						</p>
						<p class="m-0 mb-2 p-0">상품3</p>
						<p class="m-0 mb-2 p-0">0원</p>
					</div>
					<div class="d-flex flex-column">
						<p class="m-0  p-0" style="font-size: 0.75rem;">24-04-18
						17:59:05</p>
						<div class="d-flex justify-content-center">
						<p class="text-center rounded d-flex align-items-center p-1"
							style="background-color: #27374D; color: white;">주문 취소</p>
					</div>
					</div>					
				</div>				
				<div class="d-flex justify-content-center  m-0 p-0 px-2">
					<p class="w-100 m-0 p-0 py-3 text-center border">배송 정보 없음</p>
				</div>
			</div>

			<div class="w-100 border mb-2 p-3">
				<div class="d-flex justify-content-between m-0 mb-2 p-0">
					<div class="d-flex flex-column">
						<p class="m-0 p-0">
							<a class="text-dark"
								href="${pageContext.request.contextPath}/order/orderDetail">202404181758268</a>
						</p>
						<p class="m-0 mb-2 p-0">상품3</p>
						<p class="m-0 mb-2 p-0">0원</p>
					</div>
					<div class="d-flex flex-column">
						<p class="m-0  p-0" style="font-size: 0.75rem;">24-04-18
						17:59:05</p>
						<div class="d-flex justify-content-center">
						<p class="text-center rounded d-flex align-items-center p-1"
							style="background-color: #27374D; color: white;">배송 완료</p>
					</div>
					</div>					
				</div>				
				<div class="d-flex justify-content-center  m-0 p-0 px-2">
					<p class="w-100 m-0 p-0 py-3 text-center border">우체국 6861581676379</p>
				</div>
			</div>
		</div>
	</div>
	<div style="height: 100px"></div>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>