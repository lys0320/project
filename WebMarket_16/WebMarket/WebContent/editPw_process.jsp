<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="dbconn.jsp"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	String pw = request.getParameter("pw");
	String edit_pw = request.getParameter("edit_pw");
 	String id = (String)session.getAttribute("DBid");
/*	String Dbid = (String)session.getAttribute("DBid"); 
	String Dbpw = (String)session.getAttribute("DBpw"); */
	if (pw.equals(edit_pw)) {
	%>
	<script src="alert.js">
	 window.opener.document.getElementById('pw').value = ""; 
	</script> 
	<%
	}else{ 
		%>
		<script src ="exception.js"> 
		</script>
		<%
	try {
		pstmt = conn.prepareStatement("Update projectdata SET pw =?  WHERE pw=? AND id=?");
		pstmt.setString(1, edit_pw);
		pstmt.setString(2, pw);
		pstmt.setString(3, id);
		pstmt.executeUpdate();
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		if (pstmt != null)
			pstmt.close();
		if (conn != null)
			conn.close();
	}
	%>
	
	<script>

	alert("완료되었습니다.")
	window.close();
	</script>
	<%}
	%>
</body>
</html>