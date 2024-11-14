<%@ page contentType="text/html; charset=UTF-8"%>
<%@include file="../header.html"%>


<body>


	<h1>アイテム追加</h1>

	<section>
		<form action="" method="post" class="center">
			<div class="select">
				<label>カテゴリー</label> <select name="カテゴリー">
					<option value="" selected>選択してください</option>
					<option value="1">シャンプー</option>
					<option value="2">リンス</option>
					<option value="3">石鹸</option>
				</select>
			</div>

			<br>

			<div class="select">
				<label>商品名</label> <input type="text" name="" >
	</select>
	</div>

	<br>

	<div class="">
		<label>商品番号</label> <input tyoe="text" name="">
	</div>

	<br>

	<div style="text-align: center">
		<input type="submit" value="追加" class="green">
	</div>

	</form>
	</section>
</body>
<%@include file="../footer.html"%>
