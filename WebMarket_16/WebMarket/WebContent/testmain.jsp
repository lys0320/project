<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>

<html>
<head>
<jsp:include page="header.jsp" />
<!-- header에 부트스트랩 내장 -->
<title>DARIUS</title>

<style type="text/css">


.my-class {
	color: #d0a85c;
}


body {
	background-color: black;
}
</style>

</head>
<body>
	<%
	String id = (String) session.getAttribute("userId");
	%>
	<br>
	<br>
	<%
	if (id != null && id.equals("admin")) {
	%>
	<jsp:include page="menu.jsp" />
	<%
	}
	%>
	<br>
	<center>
		<table>
			<tr>
				<td><a href="testmain.jsp"><img src="img/logo.png"
						width="700px" height="300px" /></a></td>
			</tr>
		</table>
	</center>

	<br>
	<hr />

	<%@ include file="linemenu.jsp"%>

	<br>

	<div class="container">
		<div class="row" align="center">
			<%@ include file="dbconn.jsp"%>
			<%
			String sql = "select * from product";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
			%>
			<div class="col-md-4 my-class">
				<img src="resources/images/<%=rs.getString("p_fileName")%>"
					class="img-thumbnail" style="width: 50%">
				<h3><%=rs.getString("p_name")%></h3>
				<p><%=rs.getString("p_description")%>
				<p><%=rs.getString("p_UnitPrice")%>원
				<p>
					<a href="./product.jsp?id=<%=rs.getString("p_id")%>"
						class="btn btn-secondary" role="button"> 상세 정보 </a>
			</div>

			<%
			}

			if (rs != null)
			rs.close();
			if (pstmt != null)
			pstmt.close();
			if (conn != null)
			conn.close();
			%>
		</div>
		<hr>
	</div>
	<%@ include file="footer.jsp"%>

</body>
</html>