<%@ page contentType="text/html; charset=UTF-8"%>
<%@include file="../header.html" %>
<%@taglib prefix="sql" uri="jakarta.tags.sql" %>
<%@taglib prefix="c" uri="jakarta.tags.core" %>

<sql:query var="list" dataSource="jdbc/kozou">
	select * from stock_table LEFT JOIN product_table ON stock_table.productnumber = product_table.productnumber where emailaddress = '${emailaddress}' AND activenumber = 2;
</sql:query>

<h1>削除済みアイテム</h1>
<% if (request.getAttribute("errorMessage") != null) { %>
    <p style="color: red;"><%= request.getAttribute("errorMessage") %></p>
<% } %>
<div class="box">
    <p><b>一覧/検索結果 表示</b></p>
    <table class="center">
        <tr>
            <th>商品番号</th>
            <th>商品名</th>
            <th>個数</th>
            <th>操作</th>
        </tr>
		<c:forEach var="list" items="${list.rows}">
			<tr>
	            <td>${list.productnumber}</td>
	            <td>${list.productname}</td>
				<td>${list.stock}</td>
				<td>
	              <form action="UserDelete" method="post" style="display:inline;">
	                <input type="hidden" name="emailaddress" value="${emailaddress}">
	                <input type="hidden" name="productnumber" value="${list.productnumber}">
	                <input type="hidden" name="activenumber" value=1>
	                <input type="submit" value="戻す">
	              </form>
	             </td>
			</tr>
		</c:forEach>
	</table>
</div>


<%@include file="../footer.html" %>