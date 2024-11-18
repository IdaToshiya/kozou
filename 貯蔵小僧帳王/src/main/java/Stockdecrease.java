import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import bean.Bean;
import dao.KozouDAO;
import tool.Page;

@WebServlet(urlPatterns={"/Stockdecrease"})
public class Stockdecrease extends HttpServlet {

	public void doGet (
		HttpServletRequest request, HttpServletResponse response
	) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		Page.header(out);
		try {
				String emailaddress=request.getParameter("emailaddress");
				
				Bean p=new Bean();
				p.setEmailaddress(emailaddress);
				
				KozouDAO dao=new KozouDAO();
				int line=dao.add(p);
				
				if (line>0) {
					
					//フォワード先の指定
			 		RequestDispatcher dispatcher =	request.getRequestDispatcher("");
			 
			 		//フォワードの実行
			 		dispatcher.forward(request, response);
					}
			

		} catch (Exception e) {
			e.printStackTrace(out);
		}
		Page.footer(out);
	}
}
