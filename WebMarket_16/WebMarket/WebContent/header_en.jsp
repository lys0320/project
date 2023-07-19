<%@ page contentType="text/html; charset=utf-8"%>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<script type="text/javascript">
function mypage_check(){
	var sid ='<%=session.getAttribute("userId")%>';
	if(sid === "null"){
		alert("please use after login!");
	}else{
		location.href = "myPage.jsp";
	}
}

function cart_check(){
	var sid ='<%=session.getAttribute("userId")%>';
	if(sid === "null"){
		alert("please use after login!");
	}else{
		location.href = "cart_en.jsp";
	}
}
	window.addEventListener('scroll', function() {
		var header = document.querySelector('.sticky-header');
		var scrollPosition = window.scrollY;

		if (scrollPosition > 0) {
			header.classList.add('is-sticky');
		} else {
			header.classList.remove('is-sticky');
		}
		
		
	});
</script>
<style type="text/css">
.sticky-header {
	position: fixed;
	top: 0;
	width: 100%;
	z-index: 100;
	background-color: black;
	/* 헤더의 배경색, 높이, 폰트 등 추가 스타일링 */
}

.sticky-header.is-sticky {
	/*background-color: black;  스크롤 시 배경색 변경 */
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* 그림자 효과 추가 /
/ 기타 추가 스타일링 */
}

.menu {
	display: flex;
	justify-content:;
	align-items: center;
	color: white;
	margin-bottom: 20px;
}

.menu a {
	margin-left: 20px;
	color: white;
	text-decoration: none;
}

.menu span {
	margin-left: 20px;
}

body {
	background-color: black;
}
.button {
  display: inline-block;
  padding: 10px 20px;
  background-color: #4CAF50;
  color: white;
  text-decoration: none;
  border: none;
  border-radius: 4px;
  font-size: 16px;
}

</style>
<header class="sticky-header">
	<p>
	<div class="d-flex justify-content-around">
		<div class="menu">
			<a href="testmain_en.jsp">HOME</a>
		<a href="testmain_en.jsp">HOME</a>
			<%
			String id = (String) session.getAttribute("userId");
			if (id == null) {
			%>
			<a href="loginpage.jsp">LOGIN</a>
			<%
			} else {
			%>
			<a href="logout.jsp">LOGOUT</a>
			
			<%
			}
			%>
			
			<%
				if(id == null){
			%>
			<a href="register_code.jsp">JOIN US</a> 
			<%
				}else{
			%>
			<a href="order.jsp">ORDER</a>		
			<%			
				}
			%>			
			<a href="#"
				onclick="cart_check()">CART</a> <a href="#" onclick="mypage_check()">MY
				PAGE</a>
		</div>

		<div class="menu">
			<a href="boardwrite_en.jsp">reviews</a><a href="boardinquirewrite_en.jsp">inquire</a>
			<a href="boardeventwrite_en.jsp">event</a><a href="announcement_en.jsp">announcemet</a>
			<a href="testmain.jsp" class="button">korea</a>
		</div>
	</div>
</header>
