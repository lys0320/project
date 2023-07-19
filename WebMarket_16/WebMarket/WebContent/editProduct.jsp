<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<style>
.my-class {
	color: #d0a85c;
}

.font-color {
	color: ffffff;
}
</style>
<title>상품 편집</title>
<script type="text/javascript">
	function deleteConfirm(id) {
		if (confirm("해당 상품을 삭제합니다!!") == true)
			location.href = "./deleteProduct.jsp?id=" + id;
		else
			return;
	}
</script>
</head>
<%
String edit = request.getParameter("edit");
%>
</head>
<body class="bg-dark">
	<jsp:include page="topadminmenu.jsp" />
	<div class="jumbotron bg-dark">
		<div class="container bg-dark">
			<h1 class="display-3 font-color">상품 편집</h1>
		</div>
	</div>

	<div class="container bg-dark my-class">
		<div class="row" align="center">
			<%@ include file="dbconn.jsp"%>
			<%
			String sql = "select * from product";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
			%>
			<div class="col-md-4">
				<img src="resources/images/<%=rs.getString("p_fileName")%>"
					style="width: 50%">
				<h3><%=rs.getString("p_name")%></h3>
				<p><%=rs.getString("p_description")%>
				<p><%=rs.getString("p_UnitPrice")%>원
				<p>
					<%
					if (edit.equals("update")) {
					%>
					<a href="./updateProduct.jsp?id=<%=rs.getString("p_id")%>"
						class="btn btn-success" role="button"> 수정 &raquo;></a>
					<%
					} else if (edit.equals("delete")) {
					%>
					<a href="#" onclick="deleteConfirm('<%=rs.getString("p_id")%>')"
						class="btn btn-danger" role="button">삭제 &raquo;></a>
					<%
					}
					%>
				
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
	<jsp:include page="footer.jsp" />
</body>
</html>