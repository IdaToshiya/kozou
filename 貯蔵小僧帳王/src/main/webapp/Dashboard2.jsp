<%@ page contentType="text/html; charset=UTF-8"%>
<%@include file="../header11141145.html" %>
<!--↓セッションの使用の宣言　必要？-->
<%@ page session="true" %>
<body>
<!--ホームボタン-->
<a href=Adminhome.jsp class="btn-flat-logo">
  <i class="fa fa-chevron-right"></i> HOME
</a>

<h1>ダッシュボード</h1>

<canvas id="myChart" width="50" height="50"></canvas>

　<!--chart.jsを読み込み-->
  <!--script src = "https://cdnjs.cloudflare.com/ajax/libs/Chart.js/4.4.0/chart.umd.js"  -->

 <script>
 
 <h2>Welcome, ${sessionScope.user}!</h2>
 <div class="dashboard">
     <div class="card">
         <h3>統計情報</h3>
         <p>${data}</p>
     </div>
     <div class="card">
         <h3>最近のアクティビティ</h3>
         <p>例: この部分にユーザーの最近の行動を表示</p>
     </div>
     <a href="logout">Logout</a>
 </div>

</script>

<!--  <a href="#" target="_blank">CSVファイルに出力する</a> -->
   <div style="text-align:center" ><h2 class="">CSVファイルへ出力</h2>
   <input type="button" value="CSVへ出力"  name ="" onClick="" class="green"></div>
</body>
<%@include file="../footer.html" %>