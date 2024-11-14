




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
			
			// こんな風にすれば Bean の中身がログに出力できる
			String aaa =( ToStringBuilder.reflectionToString(bean, ToStringStyle.DEFAULT_STYLE) );
			
			if (aaa.contains("管理人") && aaa.contains("bc252ca239c1056c615e4742ede7a786f22598dfcd68c501e788ccdf388d3e32")){
	            System.out.println("emailaddress");
				return "Adminhome.jsp";
	        }else if (bean!=null) {
	        	request.setAttribute("bean", bean);
//	        	return "test.jsp";
	        	request.getRequestDispatcher("userhome.jsp").forward(request, response);
	        } 
//	       
			return "Login.jsp";
		
	}
}
