<%@ page contentType="text/html; charset=utf-8"%>
<script>
	window.addEventListener('scroll', function() {
		var header = document.querySelector('.sticky-menu');
		var scrollPosition = window.scrollY;

		if (scrollPosition > 0) {
			header.classList.add('is-sticky');
		} else {
			header.classList.remove('is-sticky');
		}
				
	});
</script>

<style>

.sticky-menu {
	position: fixed;
	top: 40px;
	width: 100%;
	z-index: 100;
	background-color: black;
	/* 헤더의 배경색, 높이, 폰트 등 추가 스타일링 */
}

.sticky-menu.is-sticky {
	/*background-color: black;  스크롤 시 배경색 변경 */
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* 그림자 효과 추가 /
/ 기타 추가 스타일링 */
}
</style>	

<menu class="sticky-menu">
<nav class="navbar navbar-expand navbar-dark bg-dark">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand" href="./testmain.jsp">Home</a>
		</div>
		<div>
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a class="nav-link" href="customer_Inf.jsp">회원정보변경</a></li>
				<li class="nav-item"><a class="nav-link" href="./testmain.jsp">상품 목록</a></li>
				<li class="nav-item"><a class="nav-link" href="addProduct.jsp">상품 등록</a></li>
				<li class="nav-item"><a class="nav-link" href="./editProduct.jsp?edit=update">상품 수정</a></li>
				<li class="nav-item"><a class="nav-link" href="./editProduct.jsp?edit=delete">상품 삭제</a></li>
			</ul>
		</div>
	</div>
</nav>
</menu>
