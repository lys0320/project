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
    <th><a href="testmain_en.jsp">Home</a></th>
    <th><a href="boardwrite_en.jsp">reviews</a></th>
    <th><a href="boardinquirewrite_en.jsp">inquire</a></th>
    <th><a href="boardeventwrite_en.jsp">event</a></th>
    <th><a href="announcement_en.jsp">announcement</a></th>
  </tr>
</table>
