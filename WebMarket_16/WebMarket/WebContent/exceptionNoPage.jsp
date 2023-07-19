<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>페이지 오류</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="jumbotron bg-dark">
		<div class="container">
			<h2 class="alert alert-danger d-flex align-self-md-baseline">요청하신 페이지를 찾을 수 없습니다.</h2>
		</div>
	</div>
	<div class="container">
		<p><%=request.getRequestURL()%></p>
		<p>
			<a href="testmain.jsp" class="btn btn-secondary"> 상품 목록 &raquo;</a>
		</p>
	</div>
</body>
</html>
