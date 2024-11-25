<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<%@include file="../header.html"%>

<!--ホームボタン-->
<a href="User?emailaddress=${emailaddress}&sex=${sex}" class="btn-flat-logo">
  <i class="fa fa-chevron-right"></i> HOME
</a>

<h1>新しい商品を使用する</h1>
<p>1商品づつ追加してください</p>
<% if (request.getAttribute("errorMessage") != null) { %>
    <p style="color: red;"><%= request.getAttribute("errorMessage") %></p>
<% } %>
<section>
	<form action="" method="post" class="center">
		<!-- 検索フォーム -->
		<div style="text-align: center" class="search_container">
			<form action="<%=request.getContextPath()%>/SearchServlet"
				method="post">
				<input type="text" name="keyword" placeholder="商品名で検索" /> <input
					type="hidden" name="emailaddress" value="${emailaddress}">
				<input type="submit" value="検索">
			</form>
			<br>

			<!-- 検索結果表示 -->
			<div class="box">
				<p>
					<b>一覧/検索結果 表示</b>
				</p>
				<script>
					function clearFields() {
						var inputs = document
								.querySelectorAll('input[type="number"]');
						inputs.forEach(function(input) {
							input.value = ''; // 各入力フィールドをクリア
						});
					}
				</script>
				<!-- クリアボタン -->
				<div class="clear">
				<input type="submit" value="クリア" onclick="clearFields()"
					style="margin-left: 10px; float: right;"></div>
				<table class="center">
					<tr>
						<th>商品番号</th>
						<th>商品名</th>
						<th>個数</th>
						<th>操作</th>
					</tr>
					<!-- 検索結果を表示する -->
					<c:forEach var="item" items="${searchResults}">
						<tr>
							<td>${item.productnumber}</td>
							<td>${item.productname}</td>
							<td>
								<!-- 商品追加フォーム -->
								<div class="useradd">
									<form action="Useradd.action" method="post" style="display: inline;">
										<input type="number" name="stock" placeholder="個数を入力" size="1" min="1" class="number">&nbsp;&nbsp;個<input type="submit" value="追加">
								 		<input type="hidden" name="emailaddress" value="${emailaddress}">
								 		<input type="hidden" name="productnumber" value="${item.productnumber}">
									</form>
								</div>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
	</form>
</section>
<%@include file="../footer.html"%>