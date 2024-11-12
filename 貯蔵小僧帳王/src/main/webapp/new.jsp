<%@ page contentType="text/html; charset=UTF-8"%>
<%@include file="../header.html" %>

	<section>
		<form action="" method="post">
			<h1>新規登録</h1>
				
				<div class="">
					<p>ニックネーム&nbsp;<input type="text" name=""></p>
				</div>
				<div class="">
					<p>パスワード&nbsp;<input type="text" name=""></p>
				</div>
				<div class="">
					<p>メールアドレス&nbsp;<input type="text" name=""></p>
				</div>
				<div style="text-align:center" class="birthday">
	        		<p>生年月日</p>
	        		<input name="year" id="year" size="10">&nbsp;年&nbsp;<input name="month" id="month" size="5">&nbsp;月&nbsp;<input name="day" id="day" size="5">&nbsp;日&nbsp;
				</div>
				<div style="text-align:center">
					<p>性別</p>
					<input type="radio" name="gender" value="female">女性&nbsp;<input type="radio" name="gender" value="male">男性&nbsp;<input type="radio" name="gender" value="empty" checked>未指定
				</div>
				<div class="">
					<p>都道府県</p>
					<select name="都道府県">
				    <option value="" selected>選択してください</option>
				    <option value="北海道">北海道</option>
				    <option value="青森県">青森県</option>
				    <option value="岩手県">岩手県</option>
				    <option value="宮城県">宮城県</option>
				    <option value="秋田県">秋田県</option>
				    <option value="山形県">山形県</option>
				    <option value="福島県">福島県</option>
				    <option value="茨城県">茨城県</option>
				    <option value="栃木県">栃木県</option>
				    <option value="群馬県">群馬県</option>
				    <option value="埼玉県">埼玉県</option>
				    <option value="千葉県">千葉県</option>
				    <option value="東京都">東京都</option>
				    <option value="神奈川県">神奈川県</option>
				    <option value="新潟県">新潟県</option>
				    <option value="富山県">富山県</option>
				    <option value="石川県">石川県</option>
				    <option value="福井県">福井県</option>
				    <option value="山梨県">山梨県</option>
				    <option value="長野県">長野県</option>
				    <option value="岐阜県">岐阜県</option>
				    <option value="静岡県">静岡県</option>
				    <option value="愛知県">愛知県</option>
				    <option value="三重県">三重県</option>
				    <option value="滋賀県">滋賀県</option>
				    <option value="京都府">京都府</option>
				    <option value="大阪府">大阪府</option>
				    <option value="兵庫県">兵庫県</option>
				    <option value="奈良県">奈良県</option>
				    <option value="和歌山県">和歌山県</option>
				    <option value="鳥取県">鳥取県</option>
				    <option value="島根県">島根県</option>
				    <option value="岡山県">岡山県</option>
				    <option value="広島県">広島県</option>
				    <option value="山口県">山口県</option>
				    <option value="徳島県">徳島県</option>
				    <option value="香川県">香川県</option>
				    <option value="愛媛県">愛媛県</option>
				    <option value="高知県">高知県</option>
				    <option value="福岡県">福岡県</option>
				    <option value="佐賀県">佐賀県</option>
				    <option value="長崎県">長崎県</option>
				    <option value="熊本県">熊本県</option>
				    <option value="大分県">大分県</option>
				    <option value="宮崎県">宮崎県</option>
				    <option value="鹿児島県">鹿児島県</option>
				    <option value="沖縄県">沖縄県</option>
					</select>
				</div>
				
				<br>
				<div style="text-align:center">
					<input type="submit" value="登録" class="button">
				</div>
		
		</form>
	</section>
	
	

<%@include file="../footer.html" %>
