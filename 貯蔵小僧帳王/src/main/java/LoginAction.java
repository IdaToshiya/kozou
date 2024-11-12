import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import bean.Bean;
import dao.KozouDAO;
import tool.Action;


public class LoginAction extends Action {

	public String execute (
		HttpServletRequest request, HttpServletResponse response
	) throws Exception{
		HttpSession session=request.getSession();		


			String nickname=request.getParameter("nickname");
			String password=request.getParameter("password");
		
			KozouDAO dao=new KozouDAO();
			Bean bean=dao.search(nickname, password);
			
			if (bean!=null) {
				session.setAttribute("bean", bean);
				return "test.jsp";
			}
			
			return "Login.jsp";

		
	}
}
