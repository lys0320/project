<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.net.URLDecoder"%>
<%@ page import="dto.Product"%>
<%@ page import="dao.ProductRepository"%>
<%@ page import="model.*"%>
<%@ page import="java.util.*"%>
<%@ include file="dbconn.jsp"%>
<%@ page import="java.text.DecimalFormat"%>

<%
request.setCharacterEncoding("UTF-8");
String id = (String) session.getAttribute("userId");

String cartId = session.getId();
DecimalFormat dFormat = new DecimalFormat("###,###");

String shipping_cartId = "";
String shipping_name = "";
String shipping_shippingDate = "";
String shipping_country = "";
String shipping_zipCode = "";
String shipping_addressName = "";

Cookie[] cookies = request.getCookies();

if (cookies != null) {
	for (int i = 0; i < cookies.length; i++) {
		Cookie thisCookie = cookies[i];
		String n = thisCookie.getName();
		if (n.equals("Shipping_cartId"))
	shipping_cartId = URLDecoder.decode((thisCookie.getValue()), "utf-8");
		if (n.equals("Shipping_name"))
	shipping_name = URLDecoder.decode((thisCookie.getValue()), "utf-8");
		if (n.equals("Shipping_shippingDate"))
	shipping_shippingDate = URLDecoder.decode((thisCookie.getValue()), "utf-8");
		if (n.equals("Shipping_country"))
	shipping_country = URLDecoder.decode((thisCookie.getValue()), "utf-8");
		if (n.equals("Shipping_zipCode"))
	shipping_zipCode = URLDecoder.decode((thisCookie.getValue()), "utf-8");
		if (n.equals("Shipping_addressName"))
	shipping_addressName = URLDecoder.decode((thisCookie.getValue()), "utf-8");
	}
}
int balance = 0;
try {
	pstmt = conn.prepareStatement("select * from projectdata where id = '" + id + "'");
	rs = pstmt.executeQuery();
	if (rs.next()) {
		balance = Integer.parseInt(rs.getString("balance"));
	}
} catch (Exception excep) {
	excep.printStackTrace();
} finally {
	try {
		if (rs != null)
	rs.close();
		if (pstmt != null)
	pstmt.close();
		if (conn != null)
	conn.close();
	} catch (Exception excep) {
	}
}
%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<style>
.font-color {
	color: ffffff;
}
</style>
<title>주문 정보</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="jumbotron bg-dark">
		<div class="container">
			<h1 class="display-3 font-color">주문 정보</h1>
		</div>
	</div>

	<div class="container col-8 alert alert-info">
		<div class="text-center ">
			<h1>주문확인</h1>
		</div>
		<div class="row justify-content-between">
			<div class="col-4" align="left">
				<strong>배송 주소</strong> <br> 성명 :
				<%
 out.println(shipping_name);
 %>
				<br> 우편번호 :
				<%
				out.println(shipping_zipCode);
				%><br> 주소 :
				<%
				out.println(shipping_addressName);
				%>(<%
				out.println(shipping_country);
				%>)
				<br>
			</div>
			<div class="col-4" align="right">
				<p>
					<em>배송일: <%
					out.println(shipping_shippingDate);
					%></em>
			</div>
		</div>
		<div>
			<table class="table table-hover">
				<tr>
					<th class="text-center">도서</th>
					<th class="text-center">#</th>
					<th class="text-center">가격</th>
					<th class="text-center">소계</th>
				</tr>
				<%
				int sum = 0;
				ArrayList<Product> cartList = (ArrayList<Product>) session.getAttribute("cartlist");
				if (cartList == null)
					cartList = new ArrayList<Product>();
				for (int i = 0; i < cartList.size(); i++) { // 상품리스트 하나씩 출력하기
					Product product = cartList.get(i);
					int total = product.getUnitPrice() * product.getQuantity();
					sum = sum + total;
				%>
				<tr>
					<td class="text-center"><em><%=product.getPname()%> </em></td>
					<td class="text-center"><%=product.getQuantity()%></td>
					<td class="text-center"><%=dFormat.format(product.getUnitPrice())%>원</td>
					<td class="text-center"><%=total%>원</td>
				</tr>
				<%
				}
				%>
				<tr>
					<td> </td>
					<td> </td>
					<td class="text-right"><strong>총액: </strong></td>
					<td class="text-center text-danger"><strong><%=dFormat.format(sum)%>원
					</strong></td>
				</tr>
			</table>
			
			<a href="./toss.jsp" class="btn btn-primary role="button">토스결제</a> <a
				href="./thankCustomer.jsp" class="btn btn-success" role="button">
				주문 완료 </a>
			
			<a href="./checkOutCancelled.jsp" class="btn btn-secondary"
				role="button"> 취소 </a>
		</div>
	</div>
</body>
</html>
