<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Insert title here</title>
  <%@ include file = "dbconn.jsp" %>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	%>
<%
  pstmt = conn.prepareStatement("UPDATE projectdata SET name=?, id=?, pw=?, position=?, email=?, sex=?, birth=?, location=?, balance=?, phone=?, grade=? WHERE id=?");
  String newName = request.getParameter("newName"); 
  String newId = request.getParameter("newId"); 
  String newPw = request.getParameter("newPw"); 
  String newPosition = request.getParameter("newPosition"); 
  String newEmail = request.getParameter("newEmail"); 
  String newSex = request.getParameter("newSex"); 
  String newBirth = request.getParameter("newBirth"); 
  String newLocation = request.getParameter("newLocation"); 
  String newBalance = request.getParameter("newBalance"); 
  String newPhone = request.getParameter("newPhone"); 
  String newGrade = request.getParameter("newGrade");
  
  try {
    pstmt.setString(1, newName);
    pstmt.setString(2, newId);
    pstmt.setString(3, newPw);
    pstmt.setString(4, newPosition);
    pstmt.setString(5, newEmail);
    pstmt.setString(6, newSex);
    pstmt.setString(7, newBirth);
    pstmt.setString(8, newLocation);
    pstmt.setString(9, newBalance);
    pstmt.setString(10, newPhone);
    pstmt.setString(11, newGrade);
    pstmt.setString(12, newId); // WHERE 절에 사용할 id 값

    pstmt.executeUpdate();
    out.println("데이터가 성공적으로 업데이트되었습니다.");
    response.sendRedirect("");
  } catch (SQLException ex) {
    out.println("데이터베이스 업데이트 중 오류가 발생했습니다.");
    ex.printStackTrace();
  } finally {
    // 리소스 해제
    if (pstmt != null)
      pstmt.close();
    if (conn != null)
      conn.close();
  }
%>
</body>
</html>