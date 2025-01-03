import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import bean.Bean;
import dao.KozouDAO;
import tool.Page;

@WebServlet(urlPatterns={"/start"})
public class start extends HttpServlet {

	public void doGet (
		HttpServletRequest request, HttpServletResponse response
	) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		Page.header(out);
		try {
				String emailaddress=request.getParameter("emailaddress");
				String productnumber=request.getParameter("productnumber");
				int stock=Integer.parseInt(request.getParameter("stock"));
				String sex=request.getParameter("sex");
				
				System.out.println(productnumber);
				
				if(stock == 0) {
					Bean bean = new Bean();
		            bean.setEmailaddress(emailaddress);
		            bean.setSex(sex);
		            
		            if ("female".equals(bean.getSex())) {
		            	
		            	request.setAttribute("errorMessage", "この商品は在庫がありません。");
		    			request.setAttribute("bean", bean);
		    			request.getRequestDispatcher("userhome2.jsp").forward(request, response);
		    			
		    		} else if ("male".equals(bean.getSex())) {
		    			
		    			request.setAttribute("errorMessage", "この商品は在庫がありません。");
		    			request.setAttribute("bean", bean);
		    			request.getRequestDispatcher("userhome.jsp").forward(request, response);
		    			
		    		} else if ("empty".equals(bean.getSex())) {
		    			
		    			request.setAttribute("errorMessage", "この商品は在庫がありません。");
		    			request.setAttribute("bean", bean);
		    			request.getRequestDispatcher("userhome3.jsp").forward(request, response);
		    			
		    		}
					
				} else {					
				
					KozouDAO dao=new KozouDAO();
					Bean bean = dao.start(emailaddress, productnumber, stock);
					
					if (bean != null && "female".equals(bean.getSex())) {
		        		
						request.setAttribute("bean", bean);
						request.getRequestDispatcher("userhome2.jsp").forward(request, response);
						
					} else if (bean != null && "male".equals(bean.getSex())) {
						
						request.setAttribute("bean", bean);
						request.getRequestDispatcher("userhome.jsp").forward(request, response);
						
					} else if (bean != null && "empty".equals(bean.getSex())) {
			
					request.setAttribute("bean", bean);
					request.getRequestDispatcher("userhome3.jsp").forward(request, response);	
					}
				}

		} catch (Exception e) {
			e.printStackTrace(out);
		}
		Page.footer(out);
	}
}