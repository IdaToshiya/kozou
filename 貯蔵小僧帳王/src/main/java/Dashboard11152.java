
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

	
	@WebServlet("/dashboard11152")
	public class Dashboard11152 extends HttpServlet {
		//Serializableなオブジェクトに定義するバージョン番号
	    private static final long serialVersionUID = 1L;
	    
	  //リクエストを受け取る
	    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {

	    	
	    	
	    	try 
        	// DBに接続（接続先情報）
        	(Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost/jdbc/kozou", "postgres", "admin")) {
        
        	
            // ユーザー情報や統計データを取得するクエリ
            String sql = "SELECT * FROM category_table";
            
            //SQLを走らせるための変数（実行するSQL文を格納するオブジェクト）
            PreparedStatement stmt = conn.prepareStatement(sql);
                        
            //getAttributeはServletで保存した値をJSPで受け取るためのメソッド
            //stmt.setInt(1, (Integer) session.getAttribute("user_id"));
            
            //SELECT文を実行
            ResultSet rs = stmt.executeQuery();
            
            //テスト
            while (rs.next()) {
                System.out.println(rs.getString("categorynumber"));
            } 

            // 結果をリクエストに設定
            //getString()はレコードの内容を文字列として取得する
            if (rs.next()) {
                request.setAttribute("data", rs.getString("data_column"));
            }
        } catch (Exception e) {
            e.printStackTrace();

	    	
	    }
	    }
	}
