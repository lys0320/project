<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.time.LocalDateTime"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>상품 문의</title>
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
		<h2>inquire</h2>
		<form action="boardinquiresucess.jsp" method="post">

			<div class="form-group">
				<label for="title">title</label> <label style="float: right;">private</label><input
					type="checkbox" style="float: right;" name="check" value="비공개">
				<input type="text" class="form-control" id="title"
					placeholder="title(4-100)" name="title" maxlength="100"
					required="required" pattern=".{4,100}">
			</div>

			<div class="form-group">
				<label for="content">content</label>
				<textarea class="form-control" rows="5" id="content" name="content"
					placeholder="content" style="resize: none;"></textarea>
			</div>
			<p>
				<button type="submit" class="btn btn-default">submit</button>
		</form>
		<p>
		<form action="boardinquirewrite_en.jsp" method="post">
			<button type="submit" class="btn btn-default">cancel</button>
		</form>
		<p></p>
	</div>

</body>
</html>