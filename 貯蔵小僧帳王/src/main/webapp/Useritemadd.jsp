<%@ page contentType="text/html; charset=UTF-8"%>
<%@include file="../header.html" %>
<%= request.getAttribute("emailaddress") %>

<h1>新しい商品を使用する</h1>

<section>
		<form action="Useradd.action" method="post"  class="center">
		
			<input type="hidden" name="password" value="<%= emailaddress %>">
			
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
					<select name="productname">
				    <option value="" selected>選択してください</option>
				    <option value="石鹸お姫様ゴールド">石鹸お姫様ゴールド</option>
				    <option value="リンスお姫様レギュラー450ml">リンスお姫様レギュラー450ml</option>
				    <option value="シャンプーお姫様レギュラー450ml">シャンプーお姫様レギュラー450ml</option>
					</select>
				</div>
				
				<br>
				
				<div class="">
					<label>個数</label>
					<input type="text" name="stock" required min="1" placeholder="個数を入力" size="8" >&nbsp;個
				</div>
				
				<br>
				
				<div style="text-align:center">
				<input type="submit" value="追加" class="green">
				</div>
		
		</form>
	</section>
<%@include file="../footer.html" %>