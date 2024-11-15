
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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

@WebServlet("/Dashboard")
public class Dashboard extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<String> category = new ArrayList<>(); // カテゴリーのリスト
        DataSource dataSource = null;
        
        try {
            Context context = new InitialContext();
            Object obj = context.lookup("java:/comp/env/jdbc/kozou");
            dataSource = (DataSource) obj;
        
            //データベースに接続
	        try (Connection con = dataSource.getConnection();
	            PreparedStatement pstmt = con.prepareStatement("SELECT * FROM category_table")) {
	            ResultSet rs = pstmt.executeQuery();
	            while (rs.next()) {
	            	category.add(rs.getString("categorynumber"));
	            	category.add(rs.getString("numberofregistrations"));
	            }
		        
		        System.out.println(category);
		        request.setAttribute("categor", category);
		        request.getRequestDispatcher("Dashboard.jsp").forward(request, response);
		
		    } catch (SQLException e) {
		        e.printStackTrace();
		        throw new ServletException("DB接続に失敗しました", e);
		    }
        } catch (Exception e) {
            System.out.print(e.getMessage());
        }
	}
}
           
