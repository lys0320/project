<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp"%>
<%
	int id = Integer.parseInt(request.getParameter("id"));
	
	String sql = "delete from orders where order_id = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, id);
	pstmt.executeUpdate();
	
	if(pstmt != null) pstmt.close();
	if(conn != null) conn.close();
	
	response.sendRedirect("order.jsp");
%>