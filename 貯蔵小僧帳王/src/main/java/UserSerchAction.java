import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import org.apache.tomcat.jakartaee.commons.lang3.builder.ToStringBuilder;
import org.apache.tomcat.jakartaee.commons.lang3.builder.ToStringStyle;

import bean.Bean;
import dao.KozouDAO;
import tool.Action;


public class UserSerchAction extends Action {

	public String execute (
		HttpServletRequest request, HttpServletResponse response
	) throws Exception{
		HttpSession session=request.getSession();
			
			String productname = request.getParameter("productname");
			String nickname = request.getParameter("nickname");
			String password = request.getParameter("password");
		
			KozouDAO dao=new KozouDAO();
			Bean bean=dao.usersearch(productname, nickname, password);
			
			// こんな風にすれば Bean の中身がログに出力できる
			String aaa =( ToStringBuilder.reflectionToString(bean, ToStringStyle.DEFAULT_STYLE) );
			System.out.println(aaa);
			
	        if (bean!=null) {
	        	request.setAttribute("bean", bean);
	        	request.getRequestDispatcher("userhomeserch.jsp").forward(request, response);
	        } 
      
			return null;
		
	}
}
