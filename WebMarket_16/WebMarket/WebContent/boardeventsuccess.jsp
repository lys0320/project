<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.time.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

<title>Insert title here</title>
</head>
<body>
	<%@ include file="dbconn.jsp"%>
	<%
	request.setCharacterEncoding("utf-8");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String writer = (String) session.getAttribute("userId");
	String Page = (String) session.getAttribute("page");
	
	try {
		String sql = "insert into event (title,content,writer,date) Values(?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, title);
		pstmt.setString(2, content);
		pstmt.setString(3, writer);
		pstmt.setObject(4, LocalDateTime.now());
		pstmt.executeUpdate();

	} catch (Exception excep) {

	} finally {
		if (pstmt != null)
			pstmt.close();
		if (conn != null)
			conn.close();
	}

	if (Page.equals("korea")) {
		response.sendRedirect("boardeventwrite.jsp");
	} else {
		response.sendRedirect("boardeventwrite_en.jsp");
	}
	%>

</body>
</html>