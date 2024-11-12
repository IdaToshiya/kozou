import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import dao.KozouDAO;
import tool.Action;

public class InsertAction extends Action {

	public String execute (
		HttpServletRequest request, HttpServletResponse response
	) throws Exception{

			String nickname=request.getParameter("nickname");
			String password=request.getParameter("password");
			String emailAddress=request.getParameter("emailAddress");
			String dateOfBirth=request.getParameter("dateOfBirth");
			String sex=request.getParameter("sex");
			String prefectures=request.getParameter("prefectures");
			
			KozouDAO dao=new KozouDAO();
			int line=dao.instert(nickname, password, emailAddress, dateOfBirth, sex, prefectures);

			if (line>0) {
				return "Login.jsp";
			}
			
			return "new.jsp";
	}
}
