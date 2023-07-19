<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.net.URLDecoder"%>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>

<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<style>
.font-color {
	color: ffffff;
}
</style>
<title>주문 완료</title>
</head>
<body>
	<%
	
	String shipping_cartId = "";
	String shipping_name = "";
	String shipping_shippingDate = "";
	String shipping_country = "";
	String shipping_zipCode = "";
	String shipping_addressName = "";
	String id = (String)session.getAttribute("userId");
	Cookie[] cookies = request.getCookies();

	if (cookies != null) {
		for (int i = 0; i < cookies.length; i++) {
			Cookie thisCookie = cookies[i];
			String n = thisCookie.getName();
			if (n.equals("Shipping_cartId"))
		shipping_cartId = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Shipping_shippingDate"))
		shipping_shippingDate = URLDecoder.decode((thisCookie.getValue()), "utf-8");
		}
	}
	%>
	<jsp:include page="header.jsp" />
	<div class="jumbotron bg-dark font-color">
		<div class="container">
			<h1 class="display-3">주문 완료</h1>
		</div>
	</div>
	<div class="container font-color">
		<h2 class="alert alert-danger">주문해주셔서 감사합니다.</h2>
		<p>
			주문은
			<%
		out.println(shipping_shippingDate);
		%>에 배송될 예정입니다! !
		<p>
			주문번호 :
			<%
		out.println(shipping_cartId);
		%>
		
		<%
		String sql = "insert into orders (id, order_num, order_date) values(?,?,now())";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, shipping_cartId);
		pstmt.executeUpdate();
		
		if (pstmt != null)
	 		pstmt.close();
	 	if (conn != null)
			conn.close(); %>
		
		
	</div>
	<div class="container">
		<p>
			<a href="./testmain.jsp" class="btn btn-secondary"> 돌아가기 </a>
	</div>
</body>
</html>
<%
session.removeAttribute("cartlist");

for (int i = 0; i < cookies.length; i++) {
	Cookie thisCookie = cookies[i];
	String n = thisCookie.getName();
	if (n.equals("Shipping_cartId"))
		thisCookie.setMaxAge(0);
	if (n.equals("Shipping_name"))
		thisCookie.setMaxAge(0);
	if (n.equals("Shipping_shippingDate"))
		thisCookie.setMaxAge(0);
	if (n.equals("Shipping_country"))
		thisCookie.setMaxAge(0);
	if (n.equals("Shipping_zipCode"))
		thisCookie.setMaxAge(0);
	if (n.equals("Shipping_addressName"))
		thisCookie.setMaxAge(0);

	response.addCookie(thisCookie);
}
%>
