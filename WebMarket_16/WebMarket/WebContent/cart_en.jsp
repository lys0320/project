<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Product"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<style>

.fontcolor {
	color: #ffffff;
}

</style>

<%
	String cartId = session.getId();
	DecimalFormat dFormat = new DecimalFormat("###,###");
%>
<title>cart</title>
</head>
<body class="bg-dark fontcolor">
	<jsp:include page="header_en.jsp" />
	
	<div class="jumbotron bg-dark">
		<div class="container">
			<h1 class="display-3">cart</h1>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<table width="100%">
				<tr>
					<td align="left"><a href="./deleteCart.jsp?cartId=<%=cartId%>" class="btn btn-danger">delete</a></td>
					<td align="right"><a href="./shippingInfo.jsp?cartId=<%= cartId %>" class="btn btn-success">order</a></td>
				</tr>
			</table>
		</div>
		<div style="padding-top: 50px">
			<table class="table table-hover">
				<tr>
					<th>product</th>
					<th>price</th>
					<th>quantity</th>
					<th>subtotal</th>
					<th>cancel</th>
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
					<td><%=product.getPname()%></td>
					<td><%=dFormat.format(product.getUnitPrice()) %></td>
					<td><%=product.getQuantity()%></td>
					<td><%=dFormat.format(total) %></td>
					<td><a href="./removeCart.jsp?id=<%=product.getProductId()%>" class="badge badge-danger">delete</a></td>
				</tr>
				<%
					}
				%>
				<tr>
					<th></th>
					<th></th>
					<th>Total amount</th>
					<th><%= dFormat.format(sum)%></th>
					<th></th>
				</tr>
			</table>
			<a href="./testmain_en.jsp" class="btn btn-secondary"> &laquo; continue shopping</a>
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>
