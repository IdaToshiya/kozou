<%@ page contentType="text/html; charset=UTF-8"%>
<%@include file="../header.html" %>
<%@ page import="java.util.List, bean.Bean" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<body>
<!--ホームボタン-->
<a href="<%= request.getContextPath() %>/SearchServlet" class="btn-flat-logo">
  <i class="fa fa-chevron-right">HOME</i>
</a>
<h1>ダッシュボード</h1>
	<h2>カテゴリー別の購入数</h2>
	<!-- グラフを描画するキャンバス -->
    <canvas id="productChart"></canvas>
	<!-- Chart.js -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.2.0/chart.min.js"></script>
    <script>
	    // サーバーからのデータを JavaScript 形式に変換
	    const beans = [
		    <% 
		        List<Bean> beans = (List<Bean>) request.getAttribute("beans");
		        for (int i = 0; i < beans.size(); i++) {
		            Bean bean = beans.get(i);
		            out.print("{");
		            out.print("\"categoryname\": \"" + bean.getCategoryname() + "\","); // 文字列をダブルクォートで囲む
		            out.print("\"numberofregistrations\": " + bean.getNumberofregistrations());
		            out.print("}");
		            if (i < beans.size() - 1) out.print(",");
		        }
		    %>
		];
	
	    // categoryname を labels に、numberofregistrations を data に変換
	    const categoryLabels = beans.map(bean => bean.categoryname);
	    const categorydata = beans.map(bean => bean.numberofregistrations);
	
	    // Chart.js を使って円グラフを描画
	    const ctxCategory = document.getElementById('productChart').getContext('2d');
	    const myChartCategory = new Chart(ctxCategory, {
	        type: 'pie',
	        data: {
	            labels: categoryLabels, // ラベルとして categoryname を使用
	            datasets: [{
	                data: categorydata, // データとして numberofregistrations を使用
	                backgroundColor: [
	                    '#f88', '#484', '#48f', '#8f8', '#ff8', '#88f', '#f84'
	                ], // 必要に応じて色を増やす
	            }],
	        },
	    });
	</script>
	<h2>商品別の購入数</h2>
	<!-- グラフを描画するキャンバス -->
    <canvas id="productChart2"></canvas>
	<!-- Chart.js -->
    <script>
	    // サーバーからのデータを JavaScript 形式に変換
	    const productbeans = [
		     <% 
		         List<Bean> productbeans = (List<Bean>) request.getAttribute("productbeans");
		         for (int i = 0; i < productbeans.size(); i++) {
		             Bean bean = productbeans.get(i);
		             out.print("{");
		             out.print("\"productname\": \"" + bean.getProductname() + "\",");
		             out.print("\"numberofregistrations\": " + bean.getNumberofregistrations());
		             out.print("}");
		             if (i < productbeans.size() - 1) out.print(",");
		         }
		     %>
		];
	
	    // productname を labels に、numberofregistrations を data に変換
	    const productlabels = productbeans.map(bean => bean.productname);
	    const productdata = productbeans.map(bean => bean.numberofregistrations);
	
	    // Chart.js を使って円グラフを描画
	    const ctxProduct = document.getElementById('productChart2').getContext('2d');
	    const myChartProduct = new Chart(ctxProduct, {
	        type: 'pie',
	        data: {
	            labels: productlabels, // ラベルとして productname を使用
	            datasets: [{
	                data: productdata, // データとして numberofregistrations を使用
	                backgroundColor: [
	                	'#f88', '#484', '#48f', '#8f8', '#ff8', '#88f', '#f84', 
	                    '#f99', '#494', '#49f', '#8ff', '#ff9', '#99f', '#f49', 
	                    '#ff6', '#46f', '#f6f', '#66f', '#f66', '#6f6', '#f6a' 
	                ], // 必要に応じて色を増やす
	            }],
	        },
	    });
	</script>
	<h2>上位3つの商品</h2>
		<div style="display: flex;">
		    <c:forEach var="product" items="${top3Products}">
		        <div style="margin-right: 20px;">
		            <strong>${product.productname}</strong>: ${product.numberofregistrations}
		        </div>
		    </c:forEach>
		</div>
   
    <h2>CSVファイルへ出力</h2>
    	<div style="text-align:center">
		    <input type="button" value="CSVへ出力" onClick="location.href='DownloadCSV'" class="green">
		</div>
</body>
<%@include file="../footer.html" %>
