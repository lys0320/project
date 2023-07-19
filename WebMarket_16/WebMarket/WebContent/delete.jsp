<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ page import="java.sql.*"%>
<%@ include file="dbconn.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>

<%
	request.setCharacterEncoding("utf-8");
String id = (String)session.getAttribute("userId");
	try{
	pstmt = conn.prepareStatement("DELETE FROM projectdata where id =?");
	pstmt.setString(1, id);
	pstmt.executeUpdate();
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        // 리소스 해제
        if (pstmt != null)
          pstmt.close();
        if (conn != null)
          conn.close();
    }
	 %>
	 <script type="text/javascript">
alert("완료되었습니다.");
location.href ="logout.jsp";
</script> 
</body>
</html> 