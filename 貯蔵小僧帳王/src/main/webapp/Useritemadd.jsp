<%@ page contentType="text/html; charset=UTF-8"%>
<%@include file="../header.html" %>

<h1>新しい商品を使用する</h1>

<section>
		<form action="" method="post">
				
				<div class="">
					<p>カテゴリー</p>
					<select name="カテゴリー">
				    <option value="" selected>選択してください</option>
				    <option value="1">シャンプー</option>
				    <option value="2">リンス</option>
				    <option value="3">石鹸</option>
					</select>
				</div>
				
				<div class="">
					<p>商品名</p>
					<select name="商品名">
				    <option value="" selected>選択してください</option>
				    
					</select>
				</div>
				
				<br>
				
				<div class="">
					<p>個数&nbsp;<input type="text" name="">&nbsp;個</p>
				</div>
				
				<div class="">
					<input type="submit" value="追加" class="button">
				</div>
		
		</form>
	</section>
<%@include file="../footer.html" %>