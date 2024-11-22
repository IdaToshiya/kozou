import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import dao.KozouDAO;

@WebServlet(urlPatterns = {"/Delete"})
public class Delete extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String productnumber = request.getParameter("productnumber");

            KozouDAO dao = new KozouDAO();
            dao.delete(productnumber);

            // SearchServletにフォワード
            RequestDispatcher dispatcher = request.getRequestDispatcher("SearchServlet");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "削除に失敗しました。");
            RequestDispatcher dispatcher = request.getRequestDispatcher("Adminhome.jsp");
            dispatcher.forward(request, response);
        }
    }
}
