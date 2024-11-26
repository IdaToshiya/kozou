<%@ page contentType="text/html; charset=UTF-8"%>
<%@include file="../header.html" %>
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

<a href="Logout" class="btn-flat-logo">
  <i class="fa fa-chevron-right"></i> Logout
</a>

<h1>HOME</h1>
<div style="text-align: center" class="center">
	<div style="display: inline-flex">
		<form method="post" action="Useritemreturn.jsp">
			<input type="submit" value="削除済みアイテム" class="green">&emsp;&emsp;&emsp;&emsp;<input
				type="hidden" name="emailaddress" value='${emailaddress}'> <input
				type="hidden" name="sex" value='${sex}'>
		</form>
		<form method="post" action="SearchServlet">
			<input type="submit" value="追加" class="red"> <input
				type="hidden" name="emailaddress" value='${emailaddress}'> <input
				type="hidden" name="sex" value='${sex}'>
		</form>
	</div>
	
	<% if (request.getAttribute("errorMessage") != null) { %>
    <p style="color: red;"><%= request.getAttribute("errorMessage") %></p>
	<% } %>

	<sql:query var="list" dataSource="jdbc/kozou">
		SELECT stock_table.productnumber AS stock_productnumber, stock_table.perioddenominator AS stock_perioddenominator,
		        stock_table.emailaddress AS stock_emailaddress, stock_table.stock AS stock_stock, product_table.productname AS product_name,
		        periodnumerator, startusing FROM stock_table LEFT JOIN product_table ON stock_table.productnumber = product_table.productnumber
		    WHERE stock_table.emailaddress = '${emailaddress}' AND stock_table.stock <= 1 AND stock_table.activenumber = 1;
	</sql:query>

	<div class="box">
		<p><b>なくなりそうなもの</b></p>
		<table cellpadding="5">
			<c:forEach var="list" items="${list.rows}">
				<tr>
					<td>${list.product_name}</td>
					<td>${list.stock_stock}</td>
					<td><a href="Stockadd?emailaddress=${list.stock_emailaddress}&productnumber=${list.stock_productnumber}&stock=${list.stock_stock}">＋</a></td>
					<td><a href="Stockdecrease?emailaddress=${list.stock_emailaddress}&productnumber=${list.stock_productnumber}&stock=${list.stock_stock}&sex=${sex}">－</a></td>&nbsp;
					<td><a href="start?productnumber=${list.stock_productnumber}&emailaddress=${list.stock_emailaddress}&stock=${list.stock_stock}&sex=${sex}">スタート</a></td>
					<td><progress class="progress-bar" max="${list.stock_perioddenominator}" value="${list.stock_perioddenominator - list.periodnumerator}"></progress>
		                <p>Max: ${list.stock_perioddenominator}, Start: ${list.startusing}</p></td>
					<td><a href="UserDelete?emailaddress=${list.stock_emailaddress}&productnumber=${list.stock_productnumber}&activenumber=2">削除</a></td>
				</tr>
			</c:forEach>
		</table>

		<sql:query var="list" dataSource="jdbc/kozou">
		    SELECT stock_table.productnumber AS stock_productnumber, stock_table.perioddenominator AS stock_perioddenominator,
		        stock_table.emailaddress AS stock_emailaddress, stock_table.stock AS stock_stock, product_table.productname AS product_name,
		        periodnumerator, startusing FROM stock_table LEFT JOIN product_table ON stock_table.productnumber = product_table.productnumber
		       WHERE stock_table.emailaddress = '${emailaddress}' AND stock_table.activenumber = 1;
		</sql:query>
		<br>
		<p><b>日用品一覧</b></p>
		<table cellpadding="4">
			<c:forEach var="list" items="${list.rows}">
				<tr>
					<td>${list.product_name}</td>
					<td>${list.stock_stock}</td>
					<td><a href="Stockadd?emailaddress=${list.stock_emailaddress}&productnumber=${list.stock_productnumber}&stock=${list.stock_stock}">＋</a></td>
					<td><a href="Stockdecrease?emailaddress=${list.stock_emailaddress}&productnumber=${list.stock_productnumber}&stock=${list.stock_stock}&sex=${sex}">－</a></td>&nbsp;
					<td><a href="start?productnumber=${list.stock_productnumber}&emailaddress=${list.stock_emailaddress}&stock=${list.stock_stock}&sex=${sex}">スタート</a></td>
					<td><progress class="progress-bar" max="${list.stock_perioddenominator}" value="${list.stock_perioddenominator - list.periodnumerator}"></progress>
		                <p>Max: ${list.stock_perioddenominator}, Start: ${list.startusing}</p></td>
					<td><a href="UserDelete?emailaddress=${list.stock_emailaddress}&productnumber=${list.stock_productnumber}&activenumber=2">削除</a></td>
				</tr>
			</c:forEach>
		</table>
		<script>
		    document.addEventListener("DOMContentLoaded", function () {
		        const progressBars = document.querySelectorAll(".progress-bar");
		
		        progressBars.forEach(progress => {
		            const max = parseInt(progress.getAttribute("max"), 10);
		            const value = parseInt(progress.getAttribute("value"), 10);
		
		            if (isNaN(max) || isNaN(value) || max <= 0) {
		                console.error("Invalid progress attributes", { max, value });
		                return;
		            }
		
		            if (value / max <= 0.2) {
		                progress.classList.add("low"); // 低い値の場合にクラス追加
		            }
		        });
		    });
		</script>
		
				
	</div>
</div>
<%@include file="../footer.html" %>
