<%@ page contentType="text/html; charset=UTF-8"%>
<%@include file="../header.html" %>
<%@taglib prefix="sql" uri="jakarta.tags.sql" %>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page import="java.util.List, bean.Bean" %>
<%
//リクエストスコープからのデータの取得
Bean User = (Bean)request.getAttribute("bean");
String emailaddress = User.getEmailaddress();
%>

<h1>HOME</h1>

<div class="">
	<input type="submit" value="削除済みアイテム" class="button">
</div>

<sql:query var="list" dataSource="jdbc/kozou">
	select * FROM stock_table LEFT JOIN product_table ON stock_table.productnumber = product_table.productnumber
	 where emailaddress = '<%= emailaddress %>' AND stock <= 1;
</sql:query>

<p>なくなりそうなもの</p>
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

<sql:query var="list" dataSource="jdbc/kozou">
	select * FROM stock_table LEFT JOIN product_table ON stock_table.productnumber = product_table.productnumber where emailaddress = '<%= emailaddress %>';
</sql:query>

<p>日用品一覧</p>
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
	<td><a href="Completion?productnumber=${list.productnumber}">スタート</a></td>
	<td><progress id="progress" max="${list.perioddenominator}" value="${list.periodnumerator}"></progress></td>
	<td><a href="Delete?productnumber=${list.productnumber}">削除</a></td>
	</tr>
</c:forEach>
</table>

<%@include file="../footer.html" %>