<%@ page contentType="text/html; charset=UTF-8"%>
<%@include file="../header.html" %>
<body>
<!--ホームボタン-->
<a href=Adminhome.jsp class="btn-flat-logo">
  <i class="fa fa-chevron-right"></i> HOME
</a>
<h1>ダッシュボード</h1>
<!-- グラフを描画するキャンバス -->
    <canvas id="productChart" width="600" height="400"></canvas>

    <script>
        // JSPで渡されたデータをJavaScriptで利用できるようにする
        const products = ${products};

        // 商品名と商品番号をJavaScript配列に変換
        const labels = products.map(product => product.productname); // X軸: 商品名
        const data = products.map(product => product.productnumber); // Y軸: 商品番号

        // Chart.jsを使ってグラフを描画
        const ctx = document.getElementById('productChart').getContext('2d');
        const chart = new Chart(ctx, {
            type: 'bar', // 棒グラフ'pie'
            data: {
                labels: labels,
                datasets: [{
                    label: '商品番号',
                    data: data,
                    backgroundColor: 'rgba(54, 162, 235, 0.2)',
                    borderColor: 'rgba(54, 162, 235, 1)',
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: {
                        display: true,
                        position: 'top'
                    }
                },
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    </script>
   <div style="text-align:center" ><h2 class="">CSVファイルへ出力</h2>
   <input type="button" value="CSVへ出力"  name ="" onClick="location.href='DownloadCSV'" class="green"></div>
</body>
<%@include file="../footer.html" %>
