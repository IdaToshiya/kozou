<%@ page contentType="text/html; charset=UTF-8"%>
<%@include file="../header11141145.html" %>
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
 
  var ctx = document.getElementById('myChart').getContext('2d');
  var myChart = new Chart(ctx, {
      type: 'pie',
      data: {
          labels: ['赤', '青', '黄'],
          datasets: [{
              label: '# of Votes',
              data: [12, 19, 3],
              backgroundColor: [
                  'rgba(255, 99, 132, 0.2)',
                  'rgba(54, 162, 235, 0.2)',
                  'rgba(255, 206, 86, 0.2)'
              ],
              borderColor: [
                  'rgba(255, 99, 132, 1)',
                  'rgba(54, 162, 235, 1)',
                  'rgba(255, 206, 86, 1)'
              ],
              borderWidth: 1
          }]
      },
      options: {
          scales: {
              y: {
                  beginAtZero: true
              }
          }
      }
  });

</script>


<!--  <a href="#" target="_blank">CSVファイルに出力する</a> -->
   <div style="text-align:center" ><h2 class="">CSVファイルへ出力</h2>
   <input type="button" value="CSVへ出力"  name ="" onClick="" class="green"></div>
</body>
<%@include file="../footer.html" %>

