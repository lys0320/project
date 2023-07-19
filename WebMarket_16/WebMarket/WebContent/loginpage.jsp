<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>

<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>DARIUS</title>
<script type="text/javascript">
	window.addEventListener('scroll', function() {
		var header = document.querySelector('.sticky-header');
		var scrollPosition = window.scrollY;

		if (scrollPosition > 0) {
			header.classList.add('is-sticky');
		} else {
			header.classList.remove('is-sticky');
		}
	});
</script>
<style type="text/css">
.sticky-header {
	position: fixed;
	top: 0;
	width: 100%;
	z-index: 100;
	/* 헤더의 배경색, 높이, 폰트 등 추가 스타일링 */
}

.sticky-header.is-sticky {
	background-color: black; /* 스크롤 시 배경색 변경 */
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* 그림자 효과 추가 /
/ 기타 추가 스타일링 */
}

.my-class {
	color: #d0a85c;
}

.menu {
	display: flex;
	justify-content:;
	align-items: center;
	color: white;
	margin-bottom: 20px;
}

.menu a {
	margin-left: 20px;
	color: white;
	text-decoration: none;
}

.menu span {
	margin-left: 20px;
}

al {
	display: flex;
	list-style: none;
	padding: 0;
	justify-content: center;
	color: white;
}

zi {
	margin: 0 50px;
	vertical-align: middle;
	color: white;
}

body {
	background-color: black;
}
</style>

</head>
<header class="sticky-header">
	<p>
	<jsp:include page="header.jsp"/>

</header>
</head>
<body>


	<br>
	<br>
	<br>
	<br>
	<div class="column" align="center">
		<p>
		<h3 class="my-class">아이디와 비밀번호를 입력해주세요.</h3>

		<form name="enterForm" action="mainPage.jsp" method="post">
			<p class="my-class">
				아이디(id): <input type="text" name="id">
			<p class="my-class">
				비밀번호(password): <input type="password" name="pw"> <input
					class="btn btn-secondary" type="submit" value="확인">
		</form>
		<div class="d-flex justify-content-md-center">
			<form name="registerForm" action="register_code.jsp" method="post">
				<input class="btn btn-secondary" type="submit" value="회원가입">
			</form>
			<div class="mx-2"></div>
			<form name="findoutForm" action="findout.jsp" method="post">
				<input class="btn btn-secondary" type="submit" value="회원정보찾기">
			</form>
		</div>
	</div>
	<br>
	<%@ include file="footer.jsp"%>
</body>
</html>