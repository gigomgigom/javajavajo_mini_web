<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- 사용자 정의 자바스크립트 -->
<script
	src="${pageContext.request.contextPath}/resources/js/admin/admin.js"></script>
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
	<div class="d-flex flex-row">
		<%@ include file="/WEB-INF/views/admin/common/admin_menu.jsp"%>
		<div class="d-flex flex-column align-items-center" id="view_container"
			style="width: 100vw;">
			<!--상단 바-->
			<div class="d-flex justify-content-between align-items-center"
				style="width: 100%; height: 75px; background-color: #27374D;">
				<h4 class="my-0 ms-5 ps-5 text-white">회원 조회</h4>
				<div class="d-flex flex-row align-items-center">
					<button type="button" class="btn me-5 text-white fw-bold"
						style="background-color: #526D82;">로그아웃</button>
					<span class="text-white fw-bold">환영합니다. 관리자 심영조님</span>
					<div class="mx-3"
						style="border-radius: 50%; width: 60px; height: 60px; background-color: aqua;">
					</div>
				</div>
			</div>
			<div class="d-flex" style="width: 90%; height: 91vh;">
				<div class="mt-5 w-100 d-flex flex-column">
					<h5>
						<b>회원 리스트</b>
					</h5>
					<hr class="w-100" />
					<form method="get" action=""
						class="d-flex justify-content-end align-items-center">
						<div class="form-check">
							<input type="radio" class="form-check-input" id="radio1"
								name="srcradio" value="name" checked>이름 <label
								class="form-check-label" for="radio1"></label>
						</div>
						<div class="form-check">
							<input type="radio" class="form-check-input" id="radio1"
								name="srcradio" value="email">이메일 <label
								class="form-check-label" for="radio1"></label>
						</div>
						<input type="text" class="form-control ms-4" placeholder="검색어 입력"
							name="검색" style="width: 15%;">
						<div
							class="btn ms-1 d-flex justify-content-center align-items-center">
							<img
								src="${pageContext.request.contextPath}/resources/image/icon/search_icon.png"
								width="20px">
						</div>
					</form>
					<div class="mt-4">
						<table class="table table-hover text-center">
							<thead class="table-dark">
								<tr>
									<th>회원번호</th>
									<th>아이디</th>
									<th>이름</th>
									<th>Email</th>
									<th>휴대폰번호</th>
									<th>가입일</th>
								</tr>
							</thead>
							<tbody style="vertical-align: middle;">
								<c:forEach var="member" items="${memberList}">
									<tr
										onclick="location.href='${pageContext.request.contextPath}/admin/member_detail?memno=${member.memno}'">
										<td>${member.memno}</td>
										<td>${member.memid}</td>
										<td>${member.memname}</td>
										<td>${member.mememail}</td>
										<td>${member.memtel}</td>
										<td>${member.memdate}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div class="d-flex justify-content-center mt-5">
							<div>
								<a class="btn btn-outline-primary btn-sm"
									href="admin_member_view?pageNo=1">처음</a>
								<c:if test="${pager.groupNo>1}">
									<a class="btn btn-outline-info btn-sm"
										href="admin_member_view?pageNo=${pager.startPageNo-1}">이전</a>
								</c:if>

								<c:forEach var="i" begin="${pager.startPageNo}"
									end="${pager.endPageNo}">
									<c:if test="${pager.pageNo != i}">
										<a class="btn btn-outline-success btn-sm"
											href="admin_member_view?pageNo=${i}">${i}</a>
									</c:if>
									<c:if test="${pager.pageNo == i}">
										<a class="btn btn-danger btn-sm" href="admin_member_view?pageNo=${i}">${i}</a>
									</c:if>
								</c:forEach>

								<c:if test="${pager.groupNo<pager.totalGroupNo}">
									<a class="btn btn-outline-info btn-sm"
										href="admin_member_view?pageNo=${pager.endPageNo+1}">다음</a>
								</c:if>
								<a class="btn btn-outline-primary btn-sm"
									href="admin_member_view?pageNo=${pager.totalPageNo}">맨끝</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>