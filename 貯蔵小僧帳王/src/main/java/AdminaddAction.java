

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import dao.KozouDAO;
import tool.Action;

public class AdminaddAction extends Action {

	public String execute (
		HttpServletRequest request, HttpServletResponse response
	) throws Exception{
		
		String productnumber=request.getParameter("productnumber");
		String productname=request.getParameter("productname");
//		int categorynumber=Integer.parseInt(request.getParameter("categorynumber"));
		String categorynumber=request.getParameter("categorynumber");
//		String numberofregistrations=request.getParameter("numberofregistrations");
		
		KozouDAO dao=new KozouDAO();
		int productline=dao.productinsert(productnumber, productname, categorynumber);

		if (productline>0) {
			return "Adminhome.jsp";
		}
		
		return "Adminitemadd.jsp";
	}
}