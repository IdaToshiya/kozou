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

<sql:query var="list" dataSource="jdbc/kozou">
	select * from user_table LEFT JOIN stock_table ON user_table.emailaddress = stock_table.emailaddress LEFT JOIN product_table ON stock_table.productnumber = product_table.productnumber where productname LIKE '%<%= productname %>%' AND nickname =  '<%= nickname %>' AND password =  '<%= password %>';
</sql:query>

<p>検索結果</p>
<table>
<c:forEach var="list" items="${list.rows}">
	<tr>
	<td>${list.productname}</td>
	<td>${list.stock}</td>
	<td>
	<div class="">
	<input type="submit" value="+" class="button">
	</div>
	</td>
	<td>
	<div class="">
	<input type="submit" value="-" class="button">
	</div>
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