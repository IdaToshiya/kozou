<%@ page contentType="text/html; charset=UTF-8"%>
<%@include file="../header.html" %>
</head>
<body>
<h1>商品編集画面</h1>
<form action="" method="post">
<p><%= request.getParameter("productname") %></p>
<div class=""><p>商品名&nbsp;<input type=text name=""></input></p></div>
<p><%= request.getParameter("productnumber") %></p>
<div class=""><p>商品番号&nbsp;<input type=text name=""></input></p></div>
<div style="text-align:center" ><input type="button" value="編集"  name ="" onClick="" class="green">
</form>



</body>
<%@include file="../footer.html" %>