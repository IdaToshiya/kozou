import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import bean.bean;
import dao.KozouDAO;
import tool.Page;

@WebServlet(urlPatterns={"/LoginAction"})
public class LoginAction extends HttpServlet {

	public void doGet (
		HttpServletRequest request, HttpServletResponse response
	) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		Page.header(out);
		try {

			String nickname=request.getParameter("nickname");
			String password=request.getParameter("password");
			
			bean p=new bean();
			p.setNickName(nickname);
			p.setPassword(password);
			
			KozouDAO dao=new KozouDAO();
			List<bean> list=dao.search();
			
			for (bean p1 : list) {
				System.out.println(p1.getNickName());
				System.out.println(p1.getPassword());
			
			}

		} catch (Exception e) {
			e.printStackTrace(out);
		}
		Page.footer(out);
	}
}
