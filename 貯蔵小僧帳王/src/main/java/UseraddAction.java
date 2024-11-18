

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import dao.KozouDAO;
import tool.Action;

public class UseraddAction extends Action {

	public String execute (
		HttpServletRequest request, HttpServletResponse response
	) throws Exception{
		
		String stock=request.getParameter("stock");
		String productname=request.getParameter("productname");
		String categorynumber=request.getParameter("categorynumber");
		String emailaddress=request.getParameter("emailaddress");
		
		System.out.println(emailaddress);

		
		KozouDAO dao=new KozouDAO();
		int productline=dao.userproductinsert(stock, productname, categorynumber);

		if (productline>0) {
			return "Adminhome.jsp";
		}
		
		return "Adminitemadd.jsp";
	}
}