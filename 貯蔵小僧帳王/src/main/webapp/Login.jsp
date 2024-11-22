<%@ page contentType="text/html; charset=UTF-8"%>
<%@include file="../header.html" %>

	<form action="Login.action" method="post" class="center">
		
		<h1>貯蔵小僧帳王</h1>
			<div class="">
				<label>ニックネーム</label>
				<input type="text" name="nickname" maxlength="10" required placeholder='入力してください'>
			</div>
			<br>
			<div class="">
				<label>パスワード</label>
				<input type="password" name="password"min="1" minlength="12" maxlength="20" pattern="^[0-9A-Za-z!-~]+$" required placeholder='12文字以上 / 半角英数記号'>
			</div>
			<br>
			<div class="" style="text-align:center">
				<input type="submit" value="ログイン" class="green">
			</div>
			<% if (request.getAttribute("error") != null) { %>
		    <p style="color: red;"><%= request.getAttribute("error") %></p>
			<% } %>
	</form>	
	<form action="">
	
			<div class="newfont" style="text-align:center">
				<a href=new.jsp>新規登録</a>
			</div>
	
	</form>
<%@include file="../footer.html" %>
