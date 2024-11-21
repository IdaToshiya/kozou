<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<%@include file="../header.html" %>

<h1>新しい商品を使用する</h1>

<section>
		<form action="" method="post"  class="center">	
				<!-- 検索フォーム -->
        <div style="text-align: center" class="search_container">
            <form action="<%= request.getContextPath() %>/SearchServlet" method="post">
                <input type="text" name="keyword" placeholder="商品名で検索" />
                <input type="hidden" name="emailaddress" value="${emailaddress}">
                <input type="submit" value="検索">
            </form>
        <br>
        <!-- 検索結果表示 -->
        <div class="box">
            <p><b>一覧/検索結果 表示</b></p>
            <table class="center">
                <tr>
                    <th>商品番号</th>
                    <th>商品名</th>
                    <th>個数</th>
                </tr>
                <!-- 検索結果を表示する -->
                <c:forEach var="item" items="${searchResults}">
                    <tr>
                        <td>${item.productnumber}</td>
                        <td>${item.productname}</td>
                        <td>
                            <!-- 商品追加フォーム -->
                            <form action="Useradd.action" method="post" style="display:inline;">
	                            <div class="">
	                                <input type="number" name="stock" placeholder="個数を入力" size="1">&nbsp;個
	                            </div>
                                <!-- メールアドレスを送信 -->
                                <input type="hidden" name="emailaddress" value="${emailaddress}">
                                <!-- 商品情報（商品番号と商品名）を送信 -->
                                <input type="hidden" name="productnumber" value="${item.productnumber}">
                                <input type="submit" value="追加">
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </form>
</section>
<%@include file="../footer.html" %>