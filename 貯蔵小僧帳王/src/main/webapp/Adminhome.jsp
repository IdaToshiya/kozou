<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>

<%@include file="../header.html" %>

<form action="LoginAction" method="post">
<h1>貯蔵小僧帳王 管理画面</h1>

<button class ="" onclick="location.href='../貯蔵小僧帳王/Adminitemadd.jsp'">商品登録</button>&nbsp;<button class ="" onclick="location.href='../貯蔵小僧帳王/Dashboard.jsp'">ダッシュボード</button>


<form action="insert" method="post">
<sql:query var="list" dataSource="jdbc/todo">
	select * from user_name where status not like '2';
</sql:query>

</form>
<br>
<a href="../todolist/Todo.action">リスト表示</a>



<%@include file="../footer.html" %>
