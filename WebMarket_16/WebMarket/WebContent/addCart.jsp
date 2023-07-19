<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Product"%>
<%@ include file="dbconn.jsp" %>
<%
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	int price = Integer.parseInt(request.getParameter("price"));
	if (id == null || id.trim().equals("")) {
		response.sendRedirect("products.jsp");
		return;
	}
	
	ArrayList<Product> list = (ArrayList<Product>)session.getAttribute("cartlist");
	if(list == null){
		list = new ArrayList<Product>();
		session.setAttribute("cartlist", list);
	}
	
	Product product = new Product();
	product.setProductId(id);
	product.setPname(name);
	product.setUnitPrice(price);
	product.setQuantity(1)	;
	
	boolean isProductInCart = false;
	for(Product item : list){
		if(item.getPname().equals(name)){
			int orderQuantity = item.getQuantity() + 1;
			item.setQuantity(orderQuantity);
			isProductInCart = true;
			break;
		}
	}
	
	if(!isProductInCart){
		list.add(product);
	}
	
	
	
	
	//String sql = "select * from product where id = ?";
	//pstmt = conn.prepareStatement(sql);
	//pstmt.setString(1, id);
	//rs = pstmt.executeQuery();
	//while(rs.next()){		
	//}
	
	
	/* ProductRepository dao = ProductRepository.getInstance();

	Product product = dao.getProductById(id);
	if (product == null) {
		response.sendRedirect("exceptionNoProductId.jsp");
	} */

	/*  ArrayList<Product> goodsList = 
	Product goods = new Product();
	for (int i = 0; i < goodsList.size(); i++) {
		goods = goodsList.get(i);
		if (goods.getProductId().equals(id)) { 			
			break;
		}
	}
	
	ArrayList<Product> list = (ArrayList<Product>) session.getAttribute("cartlist"); 
	if (list == null) { 
		list = new ArrayList<Product>();
		session.setAttribute("cartlist", list);
	}

	int cnt = 0;
	Product goodsQnt = new Product();
	for (int i = 0; i < list.size(); i++) {
		goodsQnt = list.get(i);
		if (goodsQnt.getProductId().equals(id)) {
			cnt++;
			int orderQuantity = goodsQnt.getQuantity() + 1;
			goodsQnt.setQuantity(orderQuantity);
		}
	}

	if (cnt == 0) { 
		goods.setQuantity(1);
		list.add(goods);
	} */

	
	//response.sendRedirect("product.jsp?id=" + id);
	response.sendRedirect("cart.jsp");
%>