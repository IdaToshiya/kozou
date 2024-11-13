import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import org.apache.tomcat.jakartaee.commons.lang3.builder.ToStringBuilder;
import org.apache.tomcat.jakartaee.commons.lang3.builder.ToStringStyle;

import bean.Bean;
import dao.KozouDAO;
import tool.Action;


public class LoginAction extends Action {

	public String execute (
		HttpServletRequest request, HttpServletResponse response
	) throws Exception{
		HttpSession session=request.getSession();
			
			String password = request.getParameter("password");
			String hashedPassword = HashUtil.hashPassword(password);

			String nickname=request.getParameter("nickname");
		
			KozouDAO dao=new KozouDAO();
			Bean bean=dao.search(nickname, hashedPassword);
			
//			System.out.println(bean);
			
			// こんな風にすれば Bean の中身がログに出力できる
			String aaa =( ToStringBuilder.reflectionToString(bean, ToStringStyle.DEFAULT_STYLE) );
			System.out.println(aaa);
			
			if (aaa!=null) {
				session.setAttribute("bean", bean);
				return "test.jsp";
			}else {
				
			}
			
			return "Login.jsp";

		
	}
}
