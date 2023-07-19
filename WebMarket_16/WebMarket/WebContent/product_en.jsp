<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="dto.Product"%>
<%@ page import="dao.ProductRepository"%>
<%@ page errorPage ="exceptionNoProductId.jsp"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*"%>
<%@ include file="dbconn.jsp" %>
<html>
<head>
<link rel ="stylesheet" href ="./resources/css/bootstrap.min.css" />
<style>
.my-class {
	color: #d0a85c;
}
.font-color{
	color:ffffff;
}

</style>
<title>details</title>
<script type="text/javascript">

	function addToCart() {
		var userid = '<%=session.getAttribute("userId")%>';
		if(userid === "null"){
			alert('please use after login!');
		return false;
		}
		if (confirm("Would you like to add the product to your shopping cart?")) {
			document.addForm.submit();
		} else {
			document.addForm.reset();
		}
	}
	
</script>
</head>
<body>
	<jsp:include page="header_en.jsp" />
	<br><br>
	<div class="jumbotron bg-dark font-color">
		<div class="container">
			<h1 class="display-3">details</h1>
		</div>
	</div>
	<%
		String sid = (String)session.getAttribute("userId");
		String id = request.getParameter("id");
		/* ProductRepository dao = ProductRepository.getInstance();
		Product product = dao.getProductById(id); */
		String sql = "select * from product where p_id = ? ";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		while(rs.next()) {
	%>
	<div class="container my-class">
		<div class="row">
			<div class ="col-md-5">
				<img src="resources/images/<%=rs.getString("p_fileName")%>" style="width: 70%" />
			</div>
			<div class="col-md-6">
				<h3><%=rs.getString("p_Name")%></h3>
				<p><%=rs.getString("p_description")%>
				<p><b>Product Code : </b><span class="badge badge-danger"> <%=rs.getString("p_id")%></span>
				<p><b>category</b> : <%=rs.getString("p_category")%>
				<h4><%=rs.getInt("p_unitPrice")%> ₩</h4>
				<p><form name="addForm" action="./addCart.jsp?id=<%=rs.getString("p_id")%>&name=<%=rs.getString("p_name")%>&price=<%=rs.getInt("p_unitPrice")%>" method="post">
					<a href="#" class="btn btn-info" onclick="addToCart()"> cart </a> 
					<a href="./testmain_en.jsp" class="btn btn-secondary"> product list </a>
				</form>
				
				<%
		}
		if(rs != null) rs.close();
		if(pstmt != null)pstmt.close();
		if(conn != null)conn.close();
				%>
			</div>
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>