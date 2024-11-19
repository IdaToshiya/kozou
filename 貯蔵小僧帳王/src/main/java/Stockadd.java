import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import dao.KozouDAO;
import tool.Page;

@WebServlet(urlPatterns={"/Stockadd"})
public class Stockadd extends HttpServlet {

	public void doGet (
		HttpServletRequest request, HttpServletResponse response
	) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		Page.header(out);
		try {
				String emailaddress=request.getParameter("emailaddress");
				String productnumber=request.getParameter("productnumber");
				int stock=Integer.parseInt(request.getParameter("stock"));
				
				
				KozouDAO dao=new KozouDAO();
				int line=dao.add(emailaddress, productnumber, stock);
				
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