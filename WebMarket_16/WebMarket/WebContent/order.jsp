<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*" %>
<%@ include file="dbconn.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
	function delete_check(id) {
		if (confirm("주문을 취소하시겠습니까?") == true)
			location.href = "./deleteorder.jsp?id="+id;
		else
			return;
	}
	


</script>
<jsp:include page="header.jsp" />
<title>Insert title here</title>
<style type="text/css">
.font-color {
	color: #ffffff;
}
</style>
</head>
<body class="font-color">

	<div class="jumbotron bg-dark">
		<div class="container">
			<h1 class="display-3">주문내역</h1>
		</div>
	</div>

	<div class="container">
		<div class="column" align="center">
			<%
			String id = (String) session.getAttribute("userId");
			String sql = "select * from orders where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			boolean result = rs.next(); //resultset에 데이터가 있는지 확인
			
			if(!result){
				out.print("주문내역이 없습니다!");
			}else{
			do{
			%>
		<div class="d-flex justify-content-around">
			
			<div>주문번호 : <%=rs.getString("order_num")%></div>
			<div>주문일 : <%=rs.getString("order_date")%></div>
			<div><a href="#" onclick="delete_check('<%=rs.getInt("order_id")%>')" class="btn btn-danger" role="button">주문 취소</a></div>
		</div>
		<br>	
			<%
				}while(rs.next());
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

</body>
</html>