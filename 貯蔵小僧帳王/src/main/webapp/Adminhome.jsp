<%@ page contentType="text/html; charset=UTF-8"%>
<%@include file="../header.html" %>


<form action="LoginAction" method="post">
<h1>貯蔵小僧帳王 管理画面</h1>


<a href=""><button>商品登録</button></a>&nbsp;<a href=""><button>ダッシュボード</button></a>

<!--// 検索画面 //-->
<form action="" method ="post">
<div class=""><input type="text"><input type="submit" value="検索"></div>
</form>

<!--一覧画面-->
<div class="">
<h2>一覧/検索結果 表示</h2>
<c:forEach var="p" items="${list}">
	${""}  ${""}  ${""}<br>
</c:forEach>


</div>

<%@include file="../footer.html" %>