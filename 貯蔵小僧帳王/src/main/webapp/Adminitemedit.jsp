<%@ page contentType="text/html; charset=UTF-8"%>
<%@include file="../header.html" %>
</head>
<body>
<h1>商品編集画面</h1>
<form action="Edit.action" method="post">
	<p><%= request.getParameter("productname") %></p>
	<div class=""><p>商品名&nbsp;<input type=text name="productname"></input></p></div>
	<input type="hidden" name="productnumbermoto" value="<%= request.getParameter("productnumber") %>">
	<p type=text name="productnumbermoto"><%= request.getParameter("productnumber") %></p>
	<div class=""><p>商品番号&nbsp;<input type=text name="productnumber"></input></p></div>
	<div style="text-align:center" >
		<input type="submit" value="編集"  class="green">
	</div>
</form>



</body>
<%@include file="../footer.html" %>