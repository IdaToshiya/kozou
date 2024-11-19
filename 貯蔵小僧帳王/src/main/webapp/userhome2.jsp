<%@ page contentType="text/html; charset=UTF-8"%>
<%@include file="../header-2.html"%>
<%@taglib prefix="sql" uri="jakarta.tags.sql"%>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<%@ page import="java.util.List, bean.Bean"%>


<%
//リクエストスコープからのデータの取得
Bean User = (Bean) request.getAttribute("bean");
String emailaddress = User.getEmailaddress();
String nickname = User.getNickname();
String password = User.getPassword();
%>

<h1>HOME</h1>
<br>
<br>
<div class="center" style="text-align: center">
	<div class="search_container">
		<form action="UserSerch.action" method="post">
			<input type="text" name="productname" /> <input type="submit"
				value="検索" /> <input type="hidden" name="nickname"
				value="<%=nickname%>"> <input type="hidden" name="password"
				value="<%=password%>">
		</form>
	</div>
	<div class="" style="text-align:right;">
		<input class="del" type="button" value="削除済みアイテム"
            onClick="location.href='Useritemreturn.jsp'">
	</div>
	<sql:query var="list" dataSource="jdbc/kozou">
	select * FROM stock_table LEFT JOIN product_table ON stock_table.productnumber = product_table.productnumber
	 where emailaddress = '<%=emailaddress%>' AND stock <= 1;
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

		<div class="" style="text-align:right;">
			<form method="post" action="Useritemadd.jsp">
				<input type="submit" value="追加" class="add"> <input
					type="hidden" name="emailaddress" value="<%=emailaddress%>">
			</form>

		</div>

		<sql:query var="list" dataSource="jdbc/kozou">
	select * FROM stock_table LEFT JOIN product_table ON stock_table.productnumber = product_table.productnumber where emailaddress = '<%=emailaddress%>';
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
					<td><progress id="progress" max="${list.perioddenominator}"
							value="${list.periodnumerator}"></progress></td>
					<td><a href="Delete?productnumber=${list.productnumber}">削除</a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<%@include file="../footer.html"%>