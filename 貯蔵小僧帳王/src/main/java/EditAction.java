import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import bean.Bean;
import dao.KozouDAO;
import tool.Action;

public class EditAction extends Action {

	public String execute (
			HttpServletRequest request, HttpServletResponse response
		) throws Exception{
		
			String productnumber = request.getParameter("productnumber");
			String productname = request.getParameter("productname");
			String productnumbermoto = request.getParameter("productnumbermoto");

			Bean p=new Bean();
			p.setProductnumber(productnumber);
			p.setProductname(productname);
			p.setProductnumbermoto(productnumbermoto);
			
			KozouDAO dao=new KozouDAO();
			int line=dao.update(productnumber, productname, productnumbermoto);
				
			if (line>0) {
				return "Adminhome.jsp";
			}
			
			return "Adminitemedit.jsp";
		}
}