<html>
<head>
<meta charset="UTF-8">
<title>Servlet/JSP Samples</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/Sub4.css" type="text/css"
	media="all">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Reggae+One&display=swap"
	rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@include file="../header-3.html" %>
<%@taglib prefix="sql" uri="jakarta.tags.sql" %>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page import="java.util.List, bean.Bean" %>
<%
    Bean User = (Bean) request.getAttribute("bean");
    String emailaddress = User.getEmailaddress();
    session.setAttribute("emailaddress", emailaddress);
    String sex = User.getSex();
    session.setAttribute("sex", sex);// リクエストスコープに格納
%>

<h1>HOME</h1>
<br>
<br>
<div class="">
	<form method="post" action="Useritemreturn.jsp">
		<input type="submit" value="削除済みアイテム" class="button">
		<input type="hidden" name="emailaddress" value='${emailaddress}'>
		<input type="hidden" name="sex" value='${sex}'>
	</form>
</div>

<sql:query var="list" dataSource="jdbc/kozou">
	select * FROM stock_table LEFT JOIN product_table ON stock_table.productnumber = product_table.productnumber
	 where emailaddress = '${emailaddress}' AND stock <= 1 AND activenumber = 1;
</sql:query>
  
	<div class="box">
		<p>なくなりそうなもの</p>
		<table>
			<c:forEach var="list" items="${list.rows}">
				<tr>
					<td>${list.productname}</td>
					<td>${list.stock}</td>
					<td><a href="Stockadd?id=${list.emailaddress}">＋</a></td>
					<td><a href="Stockdecrease?id=${list.emailaddress}">-</a></td>
					<td><a href="Completion?id=${list.productnumber}">スタート</a></td>
					<td><progress id="progress" max="${list.perioddenominator}"
							value="${list.periodnumerator}"></progress></td>
					<td><a href="Delete?id=${list.productnumber}">削除</a></td>
				</tr>
			</c:forEach>
		</table>

<p>なくなりそうなもの</p>
	<table>
		<c:forEach var="list" items="${list.rows}">
			<tr>
			<td>${list.productname}</td>
			<td>${list.stock}</td>
			<td>
			<a href="Stockadd?emailaddress=${list.emailaddress}&productnumber=${list.productnumber}&stock=${list.stock}">＋</a>
			</td>
			<td>
			<a href="Stockdecrease?emailaddress=${list.emailaddress}&productnumber=${list.productnumber}&stock=${list.stock}">-</a>
			</td>
			<td><a href="start?productnumber=${list.productnumber}&emailaddress=${list.emailaddress}">スタート</a></td>
			<td><progress id="progress" max="${list.perioddenominator}" value="${list.periodnumerator}"></progress></td>
			<td><a href="UserDelete?emailaddress=${list.emailaddress}&productnumber=${list.productnumber}&activenumber=2">削除</a></td>
			</tr>
		</c:forEach>
	</table>

<div class="">
	<form method="post" action="SearchServlet">
		<input type="submit" value="追加" class="button">
		<input type="hidden" name="emailaddress" value='${emailaddress}'>
		<input type="hidden" name="sex" value='${sex}'>
	</form>
</div>

<sql:query var="list" dataSource="jdbc/kozou">
	select * FROM stock_table LEFT JOIN product_table ON stock_table.productnumber = product_table.productnumber where emailaddress = '${emailaddress}' AND activenumber = 1;
</sql:query>

<p>日用品一覧</p>
	<table>
		<c:forEach var="list" items="${list.rows}">
			<tr>
			<td>${list.productname}</td>
			<td>${list.stock}</td>
			<td>
			<a href="Stockadd?emailaddress=${list.emailaddress}&productnumber=${list.productnumber}&stock=${list.stock}">＋</a>
			</td>
			<td>
			<a href="Stockdecrease?emailaddress=${list.emailaddress}&productnumber=${list.productnumber}&stock=${list.stock}">-</a>
			</td>
			<td><a href="Completion?productnumber=${list.productnumber}">スタート</a></td>
			<td><progress id="progress" max="${list.perioddenominator}" value="${list.periodnumerator}"></progress></td>
			<td><a href="UserDelete?emailaddress=${list.emailaddress}&productnumber=${list.productnumber}">削除</a></td>
			</tr>
		</c:forEach>
	</table>
</div>
<%@include file="../footer.html" %>
