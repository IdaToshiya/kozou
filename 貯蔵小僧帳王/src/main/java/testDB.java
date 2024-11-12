
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class testDB {
	
	   // PostgreSQL接続情報
    private static final String URL = "jdbc:postgresql://localhost:5432/kozou";
    private static final String USER = "postgres";
    private static final String PASSWORD = "admin";

	public static void main(String[] args) {
		// TODO 自動生成されたメソッド・スタブ
		
		
		 Connection conn = null;
	     Statement stmt = null;

	        try {
	            // データベースに接続
	            conn = DriverManager.getConnection(URL, USER, PASSWORD);
	            stmt = conn.createStatement();

	            // データベースが存在するか確認し、無ければ作成
	            String checkDatabaseQuery = "SELECT * FROM user_table";
	            ResultSet rs = stmt.executeQuery(checkDatabaseQuery);
	           
	            while (rs.next()) {
                    System.out.println(rs.getString("nickname"));
	            } 
	        }catch (SQLException e) {
	            e.printStackTrace();
	        } 
	    
	    
	}
}