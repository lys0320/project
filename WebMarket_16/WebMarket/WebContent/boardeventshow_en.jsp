<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="model.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.time.LocalDateTime"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="utf-8">
<title>게시판 글쓰기</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
	function goToBoardChange(title, number) {
		var url = 'boardeventchange_en.jsp?title=' + encodeURIComponent(title)
				+ '&number=' + encodeURIComponent(number);
		location.href = url;
	}
</script>
<style>
div {
	width: 90%;
}
body {
	background-image: url("img/boardback.jpg");
	background-size: cover 800px;
	background-repeat: no-repeat
}

body>div {
	background-color: white;
}
.container {
    border: 4px solid #f2f2f2;
    padding: 10px;
    border-radius: 5px;
  }
</style>
</head>
<body>

	<%
	request.setCharacterEncoding("utf-8");
	int Number = Integer.parseInt(request.getParameter("title"));
	int currentPage = Integer.parseInt(request.getParameter("page"));
	String search =request.getParameter("search");
	String id = (String) session.getAttribute("userId");
	String title = "";
	String content = "";
	String writer = "";
	int ratingValue = 0;
	LocalDateTime date = LocalDateTime.now();
	%>
	<%@ include file="dbconn.jsp"%>
	<%
	int num = 1;
	try {

		pstmt = conn.prepareStatement("select * from event where titlenum='" + Number + "'");

		rs = pstmt.executeQuery();

		while (rs.next()) {
			title = rs.getString("title");
			content = rs.getString("content");
			writer = rs.getString("writer");
			date = rs.getTimestamp("date").toLocalDateTime();
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

	<div class="container">
	<p></p>
		<img src="img/board.jpg" alt="My Image" width="100%" height="15%">
		<h2>event</h2>
		<table class="table table-hover" border="1">
			<tr>
				<th style="width: 15%; text-align: center;">title</th>
				<th><%=title%></th>
			</tr>
			<tr>
				<th style="text-align: center;">writer</th>
				<th><%=writer%></th>
			</tr>
			<tr>
				<th style="text-align: center;">content</th>
				<th style="height: 200px;"><%=content%></th>
			</tr>
			<tr>
				<th style="text-align: center;">date</th>
				<th style="text-align: center;"><%=date.toLocalDate()%></th>
			</tr>

		</table>
		<%if(search == null){ %>
		<form action="boardeventwrite_en.jsp?page=<%=currentPage %>" method="post">
		<%}else{ %>
		<form action="boardeventsearch_en.jsp?page=<%=currentPage %>&search=<%=search %>" method="post">
		<%} %>
				<%
			if (writer.equals(id)) {
			%>
			<button type="button" class="btn btn-default"
				onclick="goToBoardChange('<%=title%>', '<%=Number%>')">change</button>
			<%
			}
			%>
			<button type="submit" class="btn btn-default">back</button>
		</form>
		<p></p>
	</div>
</body>
</html>