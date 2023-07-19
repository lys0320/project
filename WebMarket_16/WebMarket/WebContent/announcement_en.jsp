<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="model.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.time.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

<title>게시판 글쓰기</title>
<script type="text/javascript">
	function LoginCheck() {
		var form = document.member;
		if (form.id.value == "null") {
			alert("please use after login!");
			return;
		}
		form.submit();

	}
	function boardsearch() {
		var form = document.member;
		var url = 'announcementsearch_en.jsp?search=' + encodeURIComponent(form.search.value);
		location.href = url;

	}
	function checkEnter(event) {
		if (event.keyCode === 13) { // Enter 키의 keyCode는 13입니다.
			return false;
		}
	}
</script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
div {
	width: 90%;
}

body {
	background-image: url("img/boardback.jpg");
	background-size: cover 800px;
	background-repeat: no-repeat
}

td a {
	text-decoration: none;
	color: black;
}

td a:hover {
	color: blue;
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
	<%@ include file="dbconn.jsp"%>
	<%
	session.setAttribute("page", "english");
	request.setCharacterEncoding("utf-8");
	int num = 1;
	List<BoardInfo> boards = new ArrayList<BoardInfo>();
	String id = (String) session.getAttribute("userId");
	String admin = "admin";
	try {

		pstmt = conn.prepareStatement("select * from announcement ORDER BY titlenum DESC");
		rs = pstmt.executeQuery();

		while (rs.next()) {
			BoardInfo board = new BoardInfo();
			board.setTitle(rs.getString("title"));
			board.setNumber(rs.getInt("titlenum"));
			board.setContent(rs.getString("content"));
			board.setWriter(rs.getString("writer"));
			board.setRegisterDateTime(rs.getTimestamp("date").toLocalDateTime());
			boards.add(board);
		}
		request.setAttribute("boards", boards);

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
		<h4 style="text-align: right;">
			<a href="announcement.jsp">korea /</a> <a href="announcement_en.jsp">english</a>
		</h4>
		<h2>announcement</h2>
		<%
		if (id == null) {
		%>

		<h4 style="text-align: right;">go to login</h4>
		<h4 style="text-align: right;">
			<a href="loginpage.jsp">login</a>
		</h4>

		<%
		} else {
		%>

		<h4 style="text-align: right;">UserName :<%=id%>
		</h4>
		<h4 style="text-align: right;">
			<a href="boardlogout_en.jsp">logout</a>
		</h4>

		<%
		}
		%>
		<%@ include file="boardmenu_en.jsp"%>
		<br>
		<form action="announcementwrite_en.jsp" method="post" name="member">
			<table class="table table-hover">
				<thead>
					<tr>
						<th width="10%">num</th>
						<th>title</th>
						<th width="10%">writer</th>
						<th width="10%">date</th>
					</tr>
				</thead>
				<tbody>
					<%
					// 한 페이지에 보여줄 데이터 개수
					int pageSize = 10;

					// 전체 데이터 개수와 전체 페이지 수 계산
					int totalCount = boards.size();
					int totalPageCount = (int) Math.ceil((double) totalCount / pageSize);

					// 현재 페이지 번호 파라미터 받기 (파라미터가 없으면 기본값 1로 설정)
					int currentPage = 1;
					if (request.getParameter("page") != null) {
						currentPage = Integer.parseInt(request.getParameter("page"));
					}

					// 현재 페이지에 해당하는 데이터 계산
					int start = (currentPage - 1) * pageSize;
					int end = Math.min(start + pageSize, totalCount);
					List<BoardInfo> currentBoards = boards.subList(start, end);
					%>
					<%
					for (BoardInfo board : currentBoards) {
					%>
					<tr>
						<td><a
							href="./announcementshow_en.jsp?title=<%=board.getNumber()%>&page=<%=currentPage %>"><%=(currentPage - 1) * 10 + num%></a></td>
						<td><a
							href="./announcementshow_en.jsp?title=<%=board.getNumber()%>&page=<%=currentPage %>"><%=board.getTitle()%></a></td>
						<td><%=board.getWriter()%></td>
						<td><%=board.getRegisterDateTime().toLocalDate()%></td>
					</tr>
					<%
					num++;
					}
					%>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</tbody>
			</table>
			<div style="text-align: center;">
				<%
				if (currentPage > 1) {
					out.print("<a href='announcement_en.jsp?page=" + (currentPage - 1) + "'>&lt; previous</a>");
				}
				for (int i = 1; i <= totalPageCount; i++) {
					if (i == currentPage) {
						out.print("<b><a class='active' href='announcement_en.jsp?page=" + i + "'>" + i + "&nbsp</a></b>");
					} else {
						out.print("<a href='announcement_en.jsp?page=" + i + "'>" + i + "&nbsp</a>");
					}
				}
				if (currentPage < totalPageCount) {
					out.print("<a href='announcement_en.jsp?page=" + (currentPage + 1) + "'>next &gt;</a>");
				}
				%>
			</div>
			<input type="button" value="search" onclick="boardsearch()" name="bt"
					style="float: right;"> <input type="search" id="search" onkeydown="return checkEnter(event)"
					name="search" style="float: right;">
			<%
			if(admin.equals(id)){
				
			%>
			<input type="button" value="write" onclick="LoginCheck()" name="bt">
			
			<%
			}
			%>
			<input type="hidden" value="<%=id%>" name="id"> 
			<br><p></p>
		</form>
	</div>
</body>
</html>