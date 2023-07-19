<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.font-color{
color:#ffffff;
}
</style>
<meta charset="utf-8">
<title></title>
<jsp:include page="header.jsp" />
</head>
<body class="font-color">
<%
	request.setCharacterEncoding("utf-8");
	%>
<%@ include file ="dbconn.jsp" %>
<table border="1">
<br>
<br>
<br>
<p>
<p>
<p>

<tr>
<th>이름</th>
<th>아이디</th>
<th>비밀번호</th>
<th>포지션</th>
<th>이메일</th>
<th>성별</th>
<th>출생연도</th>
<th>주거지</th>
<th>잔고</th>
<th>연락처</th>
<th>등급</th>
<th>수정</th>
</tr>
<%
try{
	String sql= "Select * from projectdata";
	pstmt = conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	while(rs.next()){
		String name= rs.getString("name");
		String id= rs.getString("id");
		String pw= rs.getString("pw");
		String position = rs.getString("position");
		String email = rs.getString("email");
		String sex = rs.getString("sex");
		String birth = rs.getString("birth");
		String location = rs.getString("location");
		String balance = rs.getString("balance");
		String phone = rs.getString("phone");
		String grade = rs.getString("grade");
		%>
<tr>
<td><%=name%></td>
<td><%=id %></td>
<td><%=pw %></td>
<td><%=position %></td>
<td><%=email %></td>
<td><%=sex %></td>
<td><%=birth %></td>
<td><%=location %></td>
<td><%=balance %></td>
<td><%=phone %></td>
<td><%=grade %></td>
<td>
<button onclick ="editRow(this)">수정</button><!--this는 해당 버튼을 가르킴 -->
	</td>
	</tr>
<% 	
	}
}catch(SQLException ex){
	out.println("member 테이블 호출이 실패했습니다.");
	out.println("SQLException: " + ex.getMessage());
	
}finally{
	if(rs != null) rs.close();
	if(pstmt != null) pstmt.close();
	if(conn != null) conn.close();
}
%>	
<script>
	function backtoPage(){
		window.location.href = "testmain.jsp";
	}
	/*
	button.parentNode는 버튼의 부모 요소를 나타냅니다. 
	여기서는 버튼이 <td> 요소 안에 있는 경우를 가정합니다.
	button.parentNode.parentNode은 버튼의 부모 요소(<td>)의 부모 요소(<tr>)를 나타냅니다. 
	즉, 현재 버튼이 포함된 HTML 테이블의 행(row)을 찾게 됩니다.  */
  function editRow(button) {
    var row = button.parentNode.parentNode;
    var nameCell = row.cells[0];
    var idCell = row.cells[1];
    var pwCell = row.cells[2];
    var positionCell = row.cells[3];
    var emailCell = row.cells[4];
    var sexCell = row.cells[5];
    var birthCell = row.cells[6];
    var locationCell = row.cells[7];
    var balanceCell = row.cells[8];
    var phoneCell = row.cells[9];
    var gradeCell = row.cells[10];
    var nameValue = nameCell.textContent;
    var idValue = idCell.textContent;
    var pwValue = pwCell.textContent;
    var positionValue = positionCell.textContent;
    var emailValue = emailCell.textContent;
    var sexValue = sexCell.textContent;
    var birthValue = birthCell.textContent;
    var locationValue = locationCell.textContent;
    var balanceValue = balanceCell.textContent;
    var phoneValue = phoneCell.textContent;
    var gradeValue = gradeCell.textContent;
    nameCell.innerHTML = '<input type="text" value="' + nameValue + '">';
    idCell.innerHTML = '<input type="text" value="' + idValue + '">';
    pwCell.innerHTML = '<input type="password" value="' + pwValue + '">';
    positionCell.innerHTML = '<input type="text" value="' + positionValue + '">';
    emailCell.innerHTML = '<input type="text" value="' + emailValue + '">';
    sexCell.innerHTML = '<input type="text" value="' + sexValue + '">';
    birthCell.innerHTML = '<input type="text" value="' + birthValue + '">';
    locationCell.innerHTML = '<input type="text" value="' + locationValue + '">';
    balanceCell.innerHTML = '<input type="text" value="' + balanceValue + '">';
    phoneCell.innerHTML = '<input type="text" value="' + phoneValue + '">';
    gradeCell.innerHTML = '<input type="text" value="' + gradeValue + '">';
    // 수정 버튼을 저장 버튼으로 변경
    button.innerHTML = '저장';
    button.onclick = function() {
      saveRow(button, row);
    };
  }
  function saveRow(button, row) {
    var nameCell = row.cells[0];
    var idCell = row.cells[1];
    var pwCell = row.cells[2];
    var positionCell = row.cells[3];
    var emailCell = row.cells[4];
    var sexCell = row.cells[5];
    var birthCell = row.cells[6];
    var locationCell = row.cells[7];
    var balanceCell = row.cells[8];
    var phoneCell = row.cells[9];
    var gradeCell = row.cells[10];
    var newName = nameCell.querySelector('input').value;
    var newId = idCell.querySelector('input').value;
    var newPw = pwCell.querySelector('input').value;
    var newPosition = positionCell.querySelector('input').value;
    var newEmail = emailCell.querySelector('input').value;
    var newSex = sexCell.querySelector('input').value;
    var newBirth = birthCell.querySelector('input').value;
    var newLocation = locationCell.querySelector('input').value;
    var newBalance = balanceCell.querySelector('input').value;
    var newPhone = phoneCell.querySelector('input').value;
    var newGrade = gradeCell.querySelector('input').value;
    
    // 데이터를 다시 텍스트로 변경
    nameCell.innerHTML = newName;
    idCell.innerHTML = newId;
    pwCell.innerHTML = '********';
    positionCell.innerHTML = newPosition;
    emailCell.innerHTML = newEmail;
    sexCell.innerHTML = newSex;
    birthCell.innerHTML = newBirth;
    locationCell.innerHTML = newLocation;
    balanceCell.innerHTML = newBalance;
    phoneCell.innerHTML = newPhone;
    gradeCell.innerHTML = newGrade;
	//저장 버튼에서 수정버튼으로
    button.innerHTML = '수정';
    button.onclick = function() {
      editRow(button, row);
    };
    var form = document.createElement('form');
    form.method = 'POST';
    form.action = 'update.jsp';
    var input1 = document.createElement('input');
    input1.type = 'hidden';
    input1.name = 'newName';
    input1.value = newName;
    form.appendChild(input1);
    var input2 = document.createElement('input');
    input2.type = 'hidden';
    input2.name = 'newId';
    input2.value = newId;
    form.appendChild(input2);
    
    var input3 = document.createElement('input');
    input3.type = 'hidden';
    input3.name = 'newPw';
    input3.value = newPw;
    form.appendChild(input3);
    
    var input4 = document.createElement('input');
    input4.type = 'hidden';
    input4.name = 'newPosition';
    input4.value = newPosition;
    form.appendChild(input4);
    
    var input5 = document.createElement('input');
    input5.type = 'hidden';
    input5.name = 'newEmail';
    input5.value = newEmail;
    form.appendChild(input5);
    
    var input6 = document.createElement('input');
    input6.type = 'hidden';
    input6.name = 'newSex';
    input6.value = newSex;
    form.appendChild(input6);
    
    var input7 = document.createElement('input');
    input7.type = 'hidden';
    input7.name = 'newBirth';
    input7.value = newBirth;
    form.appendChild(input7);
    
    var input8 = document.createElement('input');
    input8.type = 'hidden';
    input8.name = 'newLocation';
    input8.value = newLocation;
    form.appendChild(input8);
    
    var input9 = document.createElement('input');
    input9.type = 'hidden';
    input9.name = 'newBalance';
    input9.value = newBalance;
    form.appendChild(input9);
    
    var input10 = document.createElement('input');
    input10.type = 'hidden';
    input10.name = 'newPhone';
    input10.value = newPhone;
    form.appendChild(input10);
    
    var input11 = document.createElement('input');
    input11.type = 'hidden';
    input11.name = 'newGrade';
    input11.value = newGrade;
    form.appendChild(input11);
    document.body.appendChild(form);
    form.submit();
  }
  
</script>
</table>
	<button onclick = "backtoPage()">뒤로가기</button>
</body>
</html> 