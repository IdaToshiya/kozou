<%@ page contentType="text/html; charset=UTF-8"%>
<%@include file="../header-2.html"%>


<body>
	<div class="select">
		<h1>アイテム追加</h1>
		<form action="Adminadd.action" method="post">
			<div class="category">
				<div class="select">
					<select name="categorynumber">
						<option value="" selected>カテゴリー</option>
						<option value="1">1.シャンプー</option>
						<option value="2">2.リンス</option>
						<option value="3">3.石鹸</option>
					</select>
				</div>
			</div>
			<p>
				&nbsp;<input type="text" name="productname" placeholder="商品名">
			</p>
			<p>
				&nbsp;<input type="text" name="productnumber" placeholder="商品番号">
			</p>
			<div style="text-align: center">
				<input type="submit" value="追加" class="delete">
			</div>
		</form>


	</div>
</body>
<%@include file="../footer.html"%>
