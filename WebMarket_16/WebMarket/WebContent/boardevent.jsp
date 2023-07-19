<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.time.LocalDateTime"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>공지 사항</title>
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
	<br>
	<div class="container">
	<p></p>
		<img src="img/board.jpg" alt="My Image" width="100%" height="15%">
		<h2>이벤트</h2>
		<form action="boardeventsuccess.jsp" method="post">
 
			<div class="form-group">
				<label for="title">제목</label> <input type="text"
					class="form-control" id="title" placeholder="제목 입력(4-100)"
					name="title" maxlength="100" required="required" pattern=".{4,100}">
			</div>

			<div class="form-group">
				<label for="content">내용</label>
				<textarea class="form-control" rows="5" id="content" name="content"
					placeholder="내용 작성" style="resize: none;"></textarea>
			</div>
			<p>
				<button type="submit" class="btn btn-default">등록</button>
		</form>
		<p>
		<form action="boardeventwrite.jsp" method="post">
			<button type="submit" class="btn btn-default">취소</button>
		</form>
		<p></p>
	</div>

</body>
</html>