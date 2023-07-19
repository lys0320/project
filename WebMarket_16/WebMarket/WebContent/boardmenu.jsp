<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<style>
  .menu {
    border-collapse: collapse;
    width: 100%;
  }

  .menu th, .menu td {
    border: 1px solid black;
    padding: 8px;
    text-align: center;
  }

  .menu th {
    background-color: #f2f2f2;
  }

  .menu th a {
    text-decoration: none;
    color: black;
  }
  .menu th a:hover {
  color: blue;
}
</style>

<table class="menu">
  <tr>
    <th><a href="testmain.jsp">Home</a></th>
    <th><a href="boardwrite.jsp">상품후기</a></th>
    <th><a href="boardinquirewrite.jsp">상품문의</a></th>
    <th><a href="boardeventwrite.jsp">이벤트</a></th>
    <th><a href="announcement.jsp">공지사항</a></th>
  </tr>
</table>