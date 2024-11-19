import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/DownloadCSV")
public class DownloadCSV extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/csv");
        response.setHeader("Content-Disposition", "attachment; filename=\"product_data.csv\"");

        try (PrintWriter writer = response.getWriter()) {
            // JNDIデータソースから接続を取得
            Context context = new InitialContext();
            Object obj = context.lookup("java:/comp/env/jdbc/kozou");
            DataSource ds = (DataSource) obj;
            
            try (Connection con = ds.getConnection()) {
                String sql = "SELECT productnumber, productname FROM product_table";
                PreparedStatement stmt = con.prepareStatement(sql);
                ResultSet rs = stmt.executeQuery();

                // CSVのヘッダー
                writer.println("商品番号,商品名");

                // データをCSV形式で書き出す
                while (rs.next()) {
                    int productnumber = rs.getInt("productnumber");
                    String productname = rs.getString("productname");
                    writer.println(productnumber + "," + productname);
                }
            } catch (SQLException e) {
		        e.printStackTrace();
		        throw new ServletException("データ出力中にエラーが発生しました", e);
		    }
        } catch (Exception e) {
            System.out.print(e.getMessage());
        }
	}
}
//        } catch (SQLException e) {
//            e.printStackTrace();
//            throw new ServletException("データ出力中にエラーが発生しました", e);
//        }
//    }
//}




