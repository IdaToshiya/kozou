<%@ page contentType="text/html; charset=UTF-8"%>
<%@include file="../header.html" %>

<h1>新しい商品を使用する</h1>

<section>
		<form action="" method="post"  class="center">
				<div class="select">
				<label>カテゴリー</label>
					<select name="カテゴリー">
				    <option value="" selected>選択してください</option>
				    <option value="1">シャンプー</option>
				    <option value="2">リンス</option>
				    <option value="3">石鹸</option>
					</select>
				</div>
				
				<br>
				
				<div class="select">
				<label>商品名</label>
					<select name="商品名">
				    <option value="" selected>選択してください</option>
					</select>
				</div>
				
				<br>
				
				<div class="">
					<label>個数</label>
					<input type="text" name="" required min="1" placeholder="個数を入力" size="8" >&nbsp;個
				</div>
				
				<br>
				
				<div style="text-align:center">
				<input type="submit" value="追加" class="blue">
				</div>
		
		</form>
	</section>
<%@include file="../footer.html" %>