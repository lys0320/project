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
<input type="text" name="id" id="id" placeholder="���̵� �Է��ϼ���.">
<input type="password" name="pw" id="pw" placeholder="��й�ȣ �Է��ϼ���.">
<input type="submit" value="�Է�">

</form>
</body>
</html>