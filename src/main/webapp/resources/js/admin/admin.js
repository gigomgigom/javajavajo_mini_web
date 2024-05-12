
//PopUp
//상품 상세 확인 및 정보 수정
function openProductDetail(prodno){
	var prodnoParam = prodno;
	var url = 'product_detail?prodno=' + prodnoParam;
	window.open(url, 'new', 'scrollbars=yes,resizable=no,width=500,height=600,left=0,top=0');
}
//상품 추가 팝업
function openAddProduct(){
	window.open('add_product','new','scrollbars=yes,resizable=no width=500 height=600, left=0,top=0');
}

//상품 추가 화면 - 이미지 업로드시 미리보기 썸네일 띄우기
function setThumbnail(event) {
	for (var image of event.target.files) {
		var reader = new FileReader();

		reader.onload = function(event) {
			document.getElementById('repimg-container').setAttribute("src", event.target.result);
		};
		reader.readAsDataURL(image);
	}
}

//상품 추가, 수정[팝업화면]에서 작업이 끝난 후 팝업창을 닫고 원래 페이지에서 새로고침하는 메소드
function closePopupAndRefresh(response) {
	if(response == 'success') {
		// 팝업 창을 닫음
		window.close();
		// 원래 페이지를 새로 고침
		window.opener.location.reload();
	}
}
//폼 제출 버튼 클릭 이벤트 처리
const editProductDetail = () => {
	console.log('---');
	
	var formData = new FormData(document.getElementById('editproductform'));
	
	console.error(formData);
	
	$.ajax({
		url:"edit_product",
		type:"post",
		data: formData,
		contentType: false,
        processData: false,
        success: closePopupAndRefresh,
		error: function(xhr, status, error) {
			// 오류가 발생했을 때 실행할 코드
			console.error(xhr.responseText); // 오류 내용을 콘솔에 출력
			// 오류 처리 등을 수행할 수 있음
		}
	});
}