<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
function idCheck(){
       /// alert("�� ���̵�� ����Ͻ� �� �����ϴ�.");
        window.opener.document.getElementById('id').value 
        = window.document.getElementById('id').value;
        document.dupleForm.submit();
}
        </script>
</head>
<body>
<h1>���̵� �Է����ּ���.</h1>
<form name='dupleForm' action="duplicate_process.jsp">
    ���̵�: <input type='text' name='id' id='id'>
<!--     <input type='submit' value='�ߺ��˻�'> -->
    <input type='button' value='�ߺ��˻�' onclick="idCheck()">
    <p>���̵�� 4~12�ڷ� �Է����ֽð�, ������ ���Ұ�, ���� �ҹ��ڿ� ���ڷ� �������ּ���.</p>
</form>
</body>
</html>