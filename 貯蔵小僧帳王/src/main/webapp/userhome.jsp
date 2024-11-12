<%@ page contentType="text/html; charset=UTF-8"%>
<%@include file="../header.html" %>
<%@taglib prefix="sql" uri="jakarta.tags.sql" %>

<h1>HOME</h1>

<div class="">
	<input type="submit" value="削除済みアイテム" class="button">
</div>

<sql:query var="list" dataSource="jdbc/todo">
	select * from todolist where status not like '2';
</sql:query>

<p>なくなりそうなもの</p>
<table>
<c:forEach var="list" items="${list.rows}">
	<tr>
	<td>${list.id}</td>
	<td>${list.todo}</td>
	<td>${list.date}</td>
	<td>${list.dateend}</td>
	<td>${list.datecompletion}</td>
	<td><a href="Completion?id=${list.id}">完了</a></td>
	<td><a href="Delete?id=${list.id}">削除</a></td>
	</tr>
</c:forEach>
</table>

<div class="">
	<input type="submit" value="追加" class="button">
</div>

<sql:query var="list" dataSource="jdbc/todo">
	select * from todolist where status not like '2';
</sql:query>

<p>日用品一覧</p>
<table>
<c:forEach var="list" items="${list.rows}">
	<tr>
	<td>${list.id}</td>
	<td>${list.todo}</td>
	<td>${list.date}</td>
	<td>${list.dateend}</td>
	<td>${list.datecompletion}</td>
	<td><a href="Completion?id=${list.id}">完了</a></td>
	<td><a href="Delete?id=${list.id}">削除</a></td>
	</tr>
</c:forEach>
</table>

<%@include file="../footer.html" %>