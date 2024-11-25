<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="sql" uri="jakarta.tags.sql"%>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<%@ page import="java.util.List, bean.Bean"%>
<%@include file="../header-2.html"%>

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
					<td><a
						href="Stockadd?emailaddress=${list.emailaddress}&productnumber=${list.productnumber}&stock=${list.stock}">＋</a>
					</td>
					<td><a
						href="Stockdecrease?emailaddress=${list.emailaddress}&productnumber=${list.productnumber}&stock=${list.stock}">－</a>
					</td>
					<td><a href="start?productnumber=${list.productnumber}&emailaddress=${list.emailaddress}&stock=${list.stock}">スタート</a></td>
					<td><progress id="progress" max="${list.perioddenominator}"
							value="${list.periodnumerator}"></progress></td>
					<td><a href="UserDelete?emailaddress=${list.emailaddress}&productnumber=${list.productnumber}&activenumber=2">削除</a></td>
				</tr>
			</c:forEach>
		</table>

		<sql:query var="list" dataSource="jdbc/kozou">
			select * FROM stock_table LEFT JOIN product_table ON stock_table.productnumber = product_table.productnumber where emailaddress = '${emailaddress}' AND activenumber = 1;
		</sql:query>

		<p>日用品一覧</p>
		<table>
			<c:forEach var="list" items="${list.rows}">
				<tr>
					<td>${list.productname}</td>
					<td>${list.stock}</td>
					<td><a
						href="Stockadd?emailaddress=${list.emailaddress}&productnumber=${list.productnumber}&stock=${list.stock}">＋</a>
					</td>
					<td><a
						href="Stockdecrease?emailaddress=${list.emailaddress}&productnumber=${list.productnumber}&stock=${list.stock}">－</a>
					</td>&nbsp;
					<td><a href="start?productnumber=${list.productnumber}&emailaddress=${list.emailaddress}&stock=${list.stock}">スタート</a></td>
					<td><progress id="progress" max="${list.perioddenominator}"
							value="${list.periodnumerator}"></progress></td>
					<td><a href="UserDelete?emailaddress=${list.emailaddress}&productnumber=${list.productnumber}&activenumber=2">削除</a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</div>
<%@include file="../footer.html"%>