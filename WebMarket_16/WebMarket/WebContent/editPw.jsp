<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head> 
 	<script> 
	/* 변경할 비밀번호에 유효성검사 */
	
function exception() {
	window.opener.document.getElementById('pw').value =
		window.document.getElementById('edit_pw').value;
	document.editPwForm.submit();
	}
	
	
	
	</script>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<form name="editPwForm" method="post" action="editPw_process.jsp">

현재 비밀번호: <input type="text" name="pw" id="pw"><p>

변경할 비밀번호:<input type="text" name="edit_pw" id="edit_pw">

<input type="button" value ="확인" onclick="exception()"></button>


</form>
</body>
</html>