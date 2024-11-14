import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import bean.Bean;
import dao.KozouDAO;

@WebServlet(urlPatterns = {"/Delete"})
public class Delete extends HttpServlet {

	public void doGet (
		HttpServletRequest request, HttpServletResponse response
	) throws ServletException, IOException {
		try {
			String productnumber = request.getParameter("productnumber");

			Bean p=new Bean();
			p.setProductnumber(productnumber);
			
			KozouDAO dao=new KozouDAO();
			dao.delete(p);
			
			// 削除後、Adminhome.jspにフォワードまたはリダイレクト
            response.sendRedirect("Adminhome.jsp");  // リダイレクトで再読み込み

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "削除に失敗しました。");
            RequestDispatcher dispatcher = request.getRequestDispatcher("Adminhome.jsp");
            dispatcher.forward(request, response);
        }
    }
}