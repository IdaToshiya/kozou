import java.io.BufferedWriter;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import bean.Bean;
import dao.KozouDAO;

@WebServlet(urlPatterns = {"/DownloadCSV"})
public class DownloadCSV extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        LocalDateTime date = LocalDateTime.now();
        String today = date.format(DateTimeFormatter.ISO_LOCAL_DATE);
        
        KozouDAO dao = new KozouDAO();
        List<Bean> beans = null;
        List<Bean> productbeans = null;

        try {
            // データ取得
            beans = dao.dashboard1(today);
            productbeans = dao.dashboard2(today);
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().write("Database error occurred while fetching data.");
            return; // 処理を中止
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("An error occurred.");
            return; // 処理を中止
        }

        // 出力するファイル名の設定
        String filename = "dashboard_data.csv";
        
        response.setContentType("text/csv; charset=UTF-8"); 
        response.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\"");
        response.setStatus(HttpServletResponse.SC_OK);

        // CSVにデータを書き込む
        BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(response.getOutputStream(), "Shift_JIS"));
        
        // CSVヘッダー
        writer.write("Category Name,Number of Registrations");
        writer.newLine();

        // `dashboard1`のデータをCSVに書き込む
        for (Bean bean : beans) {
            writer.write(bean.getCategoryname() + "," + bean.getNumberofregistrations());
            writer.newLine();
        }

        writer.write("Product Name,Number of Registrations");
        writer.newLine();
        
        // `dashboard2`のデータをCSVに書き込む
        for (Bean bean : productbeans) {
            writer.write(bean.getProductname() + "," + bean.getNumberofregistrations());
            writer.newLine();
        }

        writer.flush();
        writer.close();
    }
}