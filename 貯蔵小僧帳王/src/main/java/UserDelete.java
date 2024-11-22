import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import bean.Bean;
import dao.KozouDAO;

@WebServlet(urlPatterns = {"/UserDelete"})
public class UserDelete extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response); // GETリクエストをPOSTメソッドに委譲
    }    
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String productnumber = request.getParameter("productnumber");
            String emailaddress = request.getParameter("emailaddress");
            int activenumber=Integer.parseInt(request.getParameter("activenumber"));            

            KozouDAO dao = new KozouDAO();
            Bean bean = dao.userdelete(productnumber,emailaddress,activenumber);
            
            if (bean != null && "female".equals(bean.getSex())) {

    			request.setAttribute("bean", bean);
    			request.getRequestDispatcher("userhome2.jsp").forward(request, response);
    			
    		} else if (bean != null && "male".equals(bean.getSex())) {
    			
    			request.setAttribute("bean", bean);
    			request.getRequestDispatcher("userhome.jsp").forward(request, response);
    			
    		} else if (bean != null && "empty".equals(bean.getSex())) {
    			
    			request.setAttribute("bean", bean);
    			request.getRequestDispatcher("userhome3.jsp").forward(request, response);
    			
    		}
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "削除に失敗しました。");
            RequestDispatcher dispatcher = request.getRequestDispatcher("error.jsp");
            dispatcher.forward(request, response);
        }
    }
}
