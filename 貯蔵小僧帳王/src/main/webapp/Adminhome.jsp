<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<%@include file="../header.html"%>

<a href="Logout" class="btn-flat-logo">
  <i class="fa fa-chevron-right"></i> Logout
</a>

	<h1>貯蔵小僧帳王 管理画面</h1>
    <div style="text-align: center" class="center">
        <input class="red" type="button" value="商品登録"
            onClick="location.href='Adminitemadd.jsp'">&emsp;&emsp;&emsp;&emsp;
        <input class="blue" type="button" value="ダッシュボード" 
            onClick="location.href='<%= request.getContextPath() %>/Dashboard.action'">
        <br><br>
        <!-- 検索フォーム -->
        <div style="text-align: center" class="search_container">
            <form action="<%= request.getContextPath() %>/SearchServlet" method="post">
                <input type="text" name="keyword" placeholder="商品名で検索" />
                <input type="submit" value="検索">
            </form>
        </div>
        <br>
        <!-- 検索結果表示 -->
        <div class="box">
            <p><b>一覧/検索結果 表示</b></p>
            <table class="center">
                <tr>
                    <th>商品番号</th>
                    <th>商品名</th>
                    <th>操作</th>
                </tr>
                <c:forEach var="item" items="${searchResults}">
                    <tr>
                        <td>${item.productnumber}</td>
                        <td>${item.productname}</td>
                        <td>
                            <form action="Adminitemedit.jsp" method="get" style="display:inline;">
						        <input type="hidden" name="productnumber" value="${item.productnumber}">
						        <input type="hidden" name="productname" value="${item.productname}">
						        <input type="submit" value="編集">
						    </form>
                            &nbsp;|&nbsp;
                            <form action="Delete" method="post" style="display:inline;">
      						  <input type="hidden" name="productnumber" value="${item.productnumber}">
      						  <input type="submit" value="削除">
  						    </form>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>  
<%@include file="../footer.html"%>
