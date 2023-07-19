<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="dbconn.jsp"%>
<%@ page import="java.sql.*"%>
<%@ page errorPage ="isErrorPage.jsp" %>
<jsp:include page="header.jsp" />
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
 #td {
 color : white;
 }
</style>
<script type="text/javascript">

function edit(){
/* 	let editBtn = document.getElementById('editBtn'); */

	let inputPw = document.getElementById('pw');
 		document.getElementById('confirmBtn').style.display = '';
		 
 	var child = window.open('editPw.jsp','child','300','200');
		
		  
			editBtn.style.display = '';
		    confirmBtn.style.display = 'inline-block';
}
function operation(){
	let confrimBtn = document.getElementById('confirmBtn');
	alert("수정되었습니다. 다시로그인해주세요.");
	location.href = "logout.jsp";
	
}
function deleteInf(){
	let deleteBtn = document.getElementById('deleteBtn')
	location.href = "delete.jsp";
}
</script>
<%
request.setCharacterEncoding("utf-8");
String id = (String)session.getAttribute("userId");
String pw = (String)session.getAttribute("userPw");
try {
    pstmt = conn.prepareStatement("SELECT * FROM projectdata WHERE id = ?");
    pstmt.setString(1, id);
    rs = pstmt.executeQuery();
    if(rs.next() && rs.getString("id").equals(id)&& rs.getString("pw").equals(pw)){
	String Dbname = rs.getString("name");
	String Dbid = rs.getString("id");
	String Dbpw = rs.getString("pw");
	String Dbposition = rs.getString("position");
	String Dbemail = rs.getString("email");
	String Dbbirth = rs.getString("birth");
	String Dblocation = rs.getString("location");
	String Dbbalance = rs.getString("balance");
	String Dbphone = rs.getString("phone");
	String Dbgrade = rs.getString("grade");
	
	session.setAttribute("DBid", Dbid);
	session.setAttribute("DBpw", Dbpw);
%>       
 <h1>나의 정보 보기</h1>
 <hr color = "blue";>

 <table>

  <tr>
    <td id="td">이름:</td>
    <td><input type="text" name="name" id="name" value="<%=Dbname %>" readonly size = "55px"></td>
  </tr>
  <tr>
    <td id="td">아이디:</td>
    <td><input type="text" name="id" id="id" value="<%=Dbid %>" readonly size = "55px"></td>
  </tr>
  <tr>
    <td id="td">비밀번호:</td>
  	<td><input type="text" name="pw" id="pw" value="<%=Dbpw %>" readonly size = "55px"></td>
  </tr>
  <tr>
    <td id="td">포지션:</td>
   <td><input type="text" name="position" id="position" value="<%=Dbposition %>" readonly size = "55px"></td>
  </tr>
  <tr>
    <td id="td">이메일:</td>
    <td><input type="text" name="email" id="email" value="<%=Dbemail %>" readonly size = "55px"></td>
  </tr>
  <tr>
    <td id="td">생년월일:</td>
    <td><input type="text" name="birth" id="birth" value="<%=Dbbirth %>" readonly size = "55px"></td>
  </tr>
  <tr>
    <td id="td">주소:</td>
    <td><input type="text" name="location" id="location" value="<%=Dblocation %>" readonly size = "55px"></td>
  </tr>
  <tr>
    <td id="td">잔고:</td>
    <td><input type="text" name="balance" id="balance" value="<%=Dbbalance %>" readonly size = "55px"></td>
  </tr>
  <tr>
    <td id="td">연락처:</td>
    <td><input type="phone" name="phone" id="name" value="<%=Dbphone %>" readonly size = "55px"></td>
  </tr>
  <tr>
    <td id="td">등급:</td>
   <td><input type="text" name="grade" id="grade" value="<%=Dbgrade %>" readonly size = "55px"></td>
  </tr>
</table>
<button id="deleteBtn" onclick ="deleteInf()"> 회원탈퇴
<button id="editBtn" onclick="edit()">수정하기
<button id="confirmBtn" onclick="operation()" style="display: none"> 확인
</form>

 
 
 
 
 
 
 <%
    }else{
 %>
    	<script>
    	alert("비밀번호를 다시 입력해주세요.");
    	history.go(-1);
    	
    	</script>
 <% 
    }

} catch (Exception e) {
	e.printStackTrace();
} finally {
    if (rs != null) rs.close();
    if (pstmt != null) pstmt.close();
    if (conn != null) conn.close();
}
%>


<meta charset="utf-8">
<title>마이페이지</title>
</head>
<body>

</body>
</html>