<%@ page contentType="text/html; charset=UTF-8"%>
<%@include file="../header.html"%>
<!--ホームボタン-->
<a href="<%= request.getContextPath() %>/SearchServlet" class="btn-flat-logo">
  <i class="fa fa-chevron-right">HOME</i>
</a>

<h1>商品登録</h1>
<% if (request.getAttribute("errorMessage") != null) { %>
    <p style="color: red;"><%= request.getAttribute("errorMessage") %></p>
<% } %>
<section>
	<form action="Adminadd.action" method="post" class="center">
		<div class="select">
			<label>カテゴリー</label> <select name="categorynumber" required>
				<option value="" selected>選択してください</option>
				<option value="1">シャンプー</option>
				<option value="2">リンス</option>
				<option value="3">石鹸</option>
			</select>
		</div>

		<br>

		<div class="select">
			<label>商品名</label> <input type="text" name="productname" required>
		</div>

		<br>

		<div class="">
			<label>商品番号</label><input type="text" name="productnumber" required>
		</div>

		<br>

		<div style="text-align: center">
			<input type="submit" value="追加" class="green">
		</div>
	</form>
</section>
<%@include file="../footer.html"%>
