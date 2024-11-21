

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import bean.Bean;
import dao.KozouDAO;
import tool.Action;

public class UseraddAction extends Action {

	public String execute (
		HttpServletRequest request, HttpServletResponse response
	) throws Exception{
		
		String stockString = request.getParameter("stock");
		int stock = Integer.parseInt(stockString);
		String productnumber=request.getParameter("productnumber");
		String emailaddress=request.getParameter("emailaddress");
		
		System.out.println(emailaddress);
		
		KozouDAO dao=new KozouDAO();
		Bean bean = dao.userproductinsert(stock, productnumber, emailaddress);

		request.setAttribute("bean", bean);
		request.getRequestDispatcher("userhome3.jsp").forward(request, response);
		
		return  null;
	}
}