import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import bean.Bean;

@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // 検索キーワードを取得
        String keyword = request.getParameter("keyword");
        
        List<Bean> searchResults = new ArrayList<>();
        DataSource dataSource = null;

        // データソースの取得
        try {
            Context context = new InitialContext();
            Object obj = context.lookup("java:/comp/env/jdbc/kozou");
            dataSource = (DataSource) obj;

            // データベース接続
            try (Connection con = dataSource.getConnection()) {
                // キーワードが空の場合は全件検索
                String sql = keyword == null || keyword.isEmpty()
                        ? "SELECT * FROM product_table"
                        : "SELECT * FROM product_table WHERE productname LIKE ?";
                PreparedStatement st = con.prepareStatement(sql);

                if (keyword != null && !keyword.isEmpty()) {
                    st.setString(1, "%" + keyword + "%");
                }
                
                System.out.println(st + " query executed.");

                // SQLの実行
                ResultSet rs = st.executeQuery();
                
                // 検索結果をProductオブジェクトに格納
                while (rs.next()) {
                    Bean bean = new Bean();
                    bean.setProductnumber(rs.getString("productnumber"));
                    bean.setProductname(rs.getString("productname"));
                    searchResults.add(bean);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("検索処理中にエラーが発生しました", e);
        }

        // 検索結果をリクエスト属性に設定し、JSPに転送
        request.setAttribute("searchResults", searchResults);
        request.getRequestDispatcher("Adminhome.jsp").forward(request, response);
    }
}