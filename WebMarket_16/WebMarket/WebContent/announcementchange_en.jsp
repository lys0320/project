<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
function DeleteCheck(number, type) {
	if (confirm("do you want delete?")) {
		var url = "boarddelete.jsp?number=" + number + "&type=" + type;
		window.location.href = url;
		return true; // 하이퍼링크를 계속 따라갑니다.
	} else {
		// 아니오를 선택한 경우 실행할 동작
		alert("delete cancel.");
		return false; // 하이퍼링크를 따라가지 않습니다.
	}
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
	String title = request.getParameter("title");
	int number = Integer.parseInt(request.getParameter("number"));
	session.setAttribute("number", number);
	%>
	<div class="container">
		<img src="img/board.jpg" alt="My Image" width="100%" height="15%">
		<h2>announcement</h2>
		<form action="announcementchangesuccess.jsp" method="post">
			<div class="form-group">
				<label for="title">title</label> <input type="text"
					class="form-control" id="title" value="<%=title%>" name="title"
					maxlength="100" required="required" pattern=".{4,100}" readonly>
			</div>
			<div class="form-group">
				<label for="content">content</label>
				<textarea class="form-control" rows="5" id="content" name="content"
					placeholder="content" style="resize: none;"></textarea>
			</div>
			<p>
			<p></p>
			<button type="submit" class="btn btn-default">submit</button>
			<button type="button" class="btn btn-default"
				onclick="DeleteCheck(<%=number%>, 4)">delete</button>
		</form>
		<p>
		<form action="announcement_en.jsp" method="post">
			<button type="submit" class="btn btn-default">cancel</button>
		</form>
		<p></p>
	</div>

</body>
</html>