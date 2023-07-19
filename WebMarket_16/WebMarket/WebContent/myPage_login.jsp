<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp" />
<form action="myPage.jsp" name="myPageForm" method="post">
<input type="text" name="id" id="id" placeholder="아이디를 입력하세요.">
<input type="password" name="pw" id="pw" placeholder="비밀번호 입력하세요.">
<input type="submit" value="입력">

</form>
</body>
</html>