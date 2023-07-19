<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="dbconn.jsp"%>
<%@ page import="java.sql.*"%>
<%@ page errorPage ="isErrorPage.jsp" %>
<jsp:include page="header.jsp" />
<style>
p {
 color : white;
 size : 30px;s
}
</style>

<center>
<img src="img/티모따봉.jpg" height="500px" size="500px">

<p>아이디 또는 비밀번호 오류입니다.
<p>다시입력해주세요.
<p>
<a href="loginpage.jsp">다시 입력하기</a>
</center>