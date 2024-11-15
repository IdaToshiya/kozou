<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<%@taglib prefix="sql" uri="jakarta.tags.sql"%>
<%@include file="../header.html"%>

<body>
	<form action="Login.action" method="post">
		<h1>貯蔵小僧帳王 管理画面</h1>
		<div style="text-align: center" class="center">
			<input class="red" type="button" value="商品登録"
				onClick="location.href='Adminitemadd.jsp'">&emsp;&emsp;&emsp;&emsp;<input
				class="blue" type="button" value="ダッシュボード"
				onClick="location.href='Dashboard.jsp'"> <br> <br>
			<div style="text-align: center" class="search_container">
				<form action="<%=request.getContextPath()%>/" method="post">
					<input type="text" /><input type="submit" value="検索">
				</form>
			</div>
			<sql:query var="list" dataSource="jdbc/kozou">
	select * from product_table order by productnumber;
</sql:query>
			<div class="box">
				<p>
					<b>一覧/検索結果 表示</b>
				</p>
				<table class="center">
					<tr>
						<td>商品番号</td>
						<td>商品名</td>
						<td>操作</td>

					</tr>
					<c:forEach var="list" items="${list.rows}">
						<tr>
							<td>${list.productnumber}</td>
							<td>${list.productname}</td>
							<!--	<td>${list.categorynumber}</td>-->
							<!--	<td>${list.numberofregistrations}</td>-->
							<td><a
								href="Adminitemedit.jsp?productnumber=${list.productnumber}&productname=${list.productname}">編集</a></td>
							<td><a href="Delete?productnumber=${list.productnumber}">削除</a></td>
						</tr>
					</c:forEach>
				</table>
			</div>
	</form>
</body>
<%@include file="../footer.html"%>






