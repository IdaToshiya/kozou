<%@ page contentType="text/html; charset=UTF-8"%>
<%@include file="../header.html" %>




<form action="LoginAction" method="post">
<h1>貯蔵小僧帳王 管理画面</h1>

<button class ="" onclick="location.href='../貯蔵小僧帳王/Adminitemadd.jsp'">商品登録</button>&nbsp;<button class ="" onclick="location.href='../貯蔵小僧帳王/Dashboard.jsp'">ダッシュボード</button>

<div class="">
		<aside class="search">
			<div class="form">
				<form action="<%= %>" method="post">
					<input type="text" name="" />
					<input type="submit" value="検索" />
				</form>
			</div>

<sql:query var="list" dataSource="jdbc/todo">
	select * from  where status not like '2';
</sql:query>

<p>一覧/検索結果 表示</p>
<table>
<c:forEach var="list" items="${list.rows}">
	<tr>
	<td>${list.id}</td>
	<td>${list.todo}</td>
	<td>${list.date}</td>
	<td>${list.dateend}</td>
	<td>${list.datecompletion}</td>
	<td><a href="Completion?id=${list.id}">編集</a></td>
	<td><a href="Delete?id=${list.id}">削除</a></td>
	</tr>
</c:forEach>
</table>


</form>
<br>
<a href="../todolist/Todo.action">リスト表示</a>



<%@include file="../footer.html" %>