<%@ page contentType="text/html; charset=UTF-8"%>
<%@include file="../header.html" %>
<%@taglib prefix="sql" uri="jakarta.tags.sql" %>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page import="java.util.List, bean.Bean" %>
<%
//リクエストスコープからのデータの取得
Bean User = (Bean)request.getAttribute("bean");
String productname = User.getProductname();
String nickname = User.getNickname();
String password = User.getPassword();
%>

<h1><%= nickname %></h1>

<div style="text-align: center" class="search_container">
	<form action="UserSerch.action" method="post">
		<input type="text" name="productname" /> <input type="submit" value="検索" />
		<input type="hidden" name="nickname" value="<%= nickname %>">
		<input type="hidden" name="password" value="<%= password %>">
	</form>
</div>

<div class="">
	<input type="submit" value="削除済みアイテム" class="button">
</div>

<p>検索結果</p>
<table>
<c:forEach var="list" items="${bean}">
	<tr>
	<td>${list.productname}</td>
	<td>${list.stock}</td>
	<td>
	<a href="Stockadd?emailaddress=${list.emailaddress}&productnumber=${list.productnumber}&stock=${list.stock}">＋</a>
	</td>
	<td>
	<a href="Stockdecrease?emailaddress=${list.emailaddress}&productnumber=${list.productnumber}&stock=${list.stock}">-</a>
	</td>
	<td><a href="Completion?id=${list.productnumber}">スタート</a></td>
	<td><progress id="progress" max="${list.perioddenominator}" value="${list.periodnumerator}"></progress></td>
	<td><a href="Delete?id=${list.productnumber}">削除</a></td>
	</tr>
</c:forEach>
</table>

<div class="">
	<input type="submit" value="追加" class="button">
</div>

<%@include file="../footer.html" %>