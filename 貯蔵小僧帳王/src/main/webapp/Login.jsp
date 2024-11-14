<%@ page contentType="text/html; charset=UTF-8"%>
<%@include file="../header.html" %>


	<form action="Login.action" method="post">
		
		<h1>貯蔵小僧帳王</h1>
			<div class="">
				<p>ニックネーム&nbsp;<input type="text" name="nickname"></p>
			</div>
			<div class="">
				<p>パスワード&nbsp;<input type="text" name="password"></p>
			</div>
			<div class="" style="text-align:center">
				<input type="submit" value="ログイン" class="green">
			</div>
	
	</form>	
	<form action="">
	
			<div class="newfont" style="text-align:center">
				<a href=new.jsp>新規登録</a>
			</div>
	
	</form>



<%@include file="../footer.html" %>